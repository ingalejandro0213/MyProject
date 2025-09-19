<?php
declare(strict_types=1);

require_once __DIR__ . '/db/conexion.php';
date_default_timezone_set('America/Bogota');

// Asegura UTF-8 en la conexión
if (function_exists('mysqli_set_charset')) {
    @mysqli_set_charset($conn, 'utf8mb4');
}

// CSRF
session_start();
if (empty($_SESSION['csrf'])) {
    $_SESSION['csrf'] = bin2hex(random_bytes(16));
}

// Helpers
function h(string $s): string { return htmlspecialchars($s, ENT_QUOTES, 'UTF-8'); }
function isValidDate(string $d): bool { return (bool)preg_match('/^\d{4}-\d{2}-\d{2}$/', $d); }      // YYYY-MM-DD
function isValidTime(string $t): bool { return (bool)preg_match('/^\d{2}:\d{2}(:\d{2})?$/', $t); }   // HH:MM[:SS]

// --------- Cargar tipos de usuario externo (para el <select>) ----------
$tipos = [];
$sqlTipos = "SELECT id, tipo_usuario FROM tipo_usuario_externo ORDER BY tipo_usuario ASC";
if ($rt = $conn->query($sqlTipos)) {
    while ($row = $rt->fetch_assoc()) { $tipos[] = $row; }
    $rt->close();
}

$mensaje = null;
$tipo_alerta = 'info';

// ---------------------- Procesar formulario (INSERT) -------------------
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // CSRF
    if (!isset($_POST['csrf']) || !hash_equals($_SESSION['csrf'], $_POST['csrf'])) {
        $mensaje = 'Solicitud inválida (CSRF).';
        $tipo_alerta = 'danger';
    } else {
        // Captura y limpieza
        $fecha           = trim($_POST['fecha'] ?? '');
        $hora            = trim($_POST['hora'] ?? '');
        $nombre_completo = trim($_POST['nombre_completo'] ?? '');
        $area_sesion     = trim($_POST['area_sesion'] ?? '');
        $tipo_usuario_id = (int)($_POST['tipo_usuario_id'] ?? 0);
        $actividad       = trim($_POST['actividad'] ?? '');
        $requerimientos  = trim($_POST['requerimientos'] ?? '');
        $observaciones   = trim($_POST['observaciones'] ?? '');

        // Validaciones mínimas
        $errores = [];
        if (!isValidDate($fecha))        $errores[] = 'Fecha inválida.';
        if (!isValidTime($hora))         $errores[] = 'Hora inválida.';
        if ($nombre_completo === '')     $errores[] = 'El nombre completo es obligatorio.';
        if ($area_sesion === '')         $errores[] = 'El área/sección es obligatoria.';
        if ($tipo_usuario_id <= 0)       $errores[] = 'Selecciona un tipo de usuario.';
        if ($actividad === '')           $errores[] = 'La actividad es obligatoria.';

        // Normaliza hora a HH:MM:SS si viene en HH:MM
        if ($hora !== '' && preg_match('/^\d{2}:\d{2}$/', $hora)) {
            $hora .= ':00';
        }

        if (empty($errores)) {
            $sqlIns = "INSERT INTO prestamo_sala_biblioteca
                (fecha, hora, nombre_completo, area_sesion, tipo_usuario_id, actividad, requerimientos, observaciones)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sqlIns);
            if ($stmt) {
                $stmt->bind_param(
                    "ssssisss",
                    $fecha,
                    $hora,
                    $nombre_completo,
                    $area_sesion,
                    $tipo_usuario_id,
                    $actividad,
                    $requerimientos,
                    $observaciones
                );
                if ($stmt->execute()) {
                    // PRG: redirige con mensaje OK
                    $ok = urlencode('Actividad registrada con éxito.');
                    header("Location: " . basename(__FILE__) . "?ok={$ok}");
                    exit;
                } else {
                    $mensaje = 'Error al registrar: ' . h($stmt->error);
                    $tipo_alerta = 'danger';
                }
                $stmt->close();
            } else {
                $mensaje = 'Error al preparar la consulta.';
                $tipo_alerta = 'danger';
            }
        } else {
            $mensaje = implode(' ', $errores);
            $tipo_alerta = 'warning';
        }
    }
}

// Mensaje tras redirección (PRG)
if (isset($_GET['ok'])) {
    $mensaje = $_GET['ok'];
    $tipo_alerta = 'success';
}

// ----------------------- Consulta por fecha (GET) ----------------------
$filtro_fecha = isset($_GET['filtro_fecha']) ? trim($_GET['filtro_fecha']) : '';
$actividades = [];

if ($filtro_fecha !== '' && isValidDate($filtro_fecha)) {
    // ← AÑADIDO: requerimientos y observaciones para que coincidan con lo que muestras
    $sqlSel = "SELECT id, fecha, hora, nombre_completo, area_sesion, actividad, requerimientos, observaciones, creado_en
               FROM prestamo_sala_biblioteca
               WHERE fecha = ?
               ORDER BY hora ASC, id ASC";
    $st = $conn->prepare($sqlSel);
    if ($st) {
        $st->bind_param("s", $filtro_fecha);
        $st->execute();
        $rs = $st->get_result();
        while ($r = $rs->fetch_assoc()) { $actividades[] = $r; }
        $st->close();
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actividades Biblioteca</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<?php include __DIR__ . '/header.php'; ?>

<div class="container mt-4">
    <h2 class="text-primary mb-4">Registro de Actividades en la Biblioteca</h2>

    <?php if ($mensaje): ?>
        <div class="alert alert-<?= h($tipo_alerta) ?>"><?= h($mensaje) ?></div>
    <?php endif; ?>
    <div class="mb-3 text-start">
        <a href="dashboard_admin.php" class="btn btn-outline-primary">🏠 Volver a la página principal</a>
    </div>


    <!-- Formulario de registro -->
    <form method="POST" class="border p-4 bg-white rounded shadow-sm mb-4">
        <input type="hidden" name="csrf" value="<?= h($_SESSION['csrf']) ?>">

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="fecha" class="form-label">Fecha:</label>
                <input type="date" name="fecha" id="fecha" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="hora" class="form-label">Hora:</label>
                <input type="time" name="hora" id="hora" class="form-control" required>
            </div>
        </div>

        <div class="mb-3">
            <label for="nombre_completo" class="form-label">Nombre completo:</label>
            <input type="text" name="nombre_completo" id="nombre_completo" class="form-control" required maxlength="120">
        </div>

        <div class="mb-3">
            <label for="area_sesion" class="form-label">Área o Sección:</label>
            <input type="text" name="area_sesion" id="area_sesion" class="form-control" required maxlength="120">
        </div>

        <div class="mb-3">
            <label for="tipo_usuario_id" class="form-label">Tipo de Usuario:</label>
            <select name="tipo_usuario_id" id="tipo_usuario_id" class="form-select" required>
                <option value="">Seleccione...</option>
                <?php foreach ($tipos as $t): ?>
                    <option value="<?= (int)$t['id'] ?>"><?= h($t['tipo_usuario']) ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <div class="mb-3">
            <label for="actividad" class="form-label">Actividad a realizar:</label>
            <input type="text" name="actividad" id="actividad" class="form-control" required maxlength="200">
        </div>

        <div class="mb-3">
            <label for="requerimientos" class="form-label">Requerimientos:</label>
            <textarea name="requerimientos" id="requerimientos" class="form-control" rows="3" maxlength="500"></textarea>
        </div>

        <div class="mb-3">
            <label for="observaciones" class="form-label">Observaciones:</label>
            <textarea name="observaciones" id="observaciones" class="form-control" rows="3" maxlength="500"></textarea>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-success">Registrar Actividad</button>
        </div>
    </form>

    <!-- Filtro y resultados por fecha -->
    <div class="card shadow-sm mb-5">
        <div class="card-header bg-warning text-dark">🔍 Consultar actividades por fecha</div>
        <div class="card-body">
            <form method="GET" class="row g-3 mb-3">
                <div class="col-md-4">
                    <input type="date" name="filtro_fecha" class="form-control"
                           value="<?= h($filtro_fecha) ?>" required>
                </div>
                <div class="col-md-8">
                    <button type="submit" class="btn btn-outline-primary">Aplicar filtro</button>
                    <a href="<?= h(basename(__FILE__)) ?>" class="btn btn-outline-secondary">Limpiar</a>
                </div>
            </form>

            <?php if ($filtro_fecha === ''): ?>
                <p class="text-muted mb-0">Selecciona una fecha y presiona <em>Aplicar filtro</em>.</p>
            <?php else: ?>
                <h6 class="mb-3">Resultados para: <strong><?= h($filtro_fecha) ?></strong></h6>

                <?php if (!empty($actividades)): ?>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>Nombre</th>
                                    <th>Área/Sesión</th>
                                    <th>Actividad</th>
                                    <th>Requerimientos</th>
                                    <th>Observaciones</th>
                                    <th>Creado en</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($actividades as $a): ?>
                                    <tr>
                                        <td><?= (int)$a['id'] ?></td>
                                        <td><?= h($a['fecha']) ?></td>
                                        <td><?= h($a['hora']) ?></td>
                                        <td><?= h($a['nombre_completo']) ?></td>
                                        <td><?= h($a['area_sesion']) ?></td>
                                        <td><?= h($a['actividad']) ?></td>
                                        <td><?= h($a['requerimientos']) ?></td>
                                        <td><?= h($a['observaciones']) ?></td>
                                        <td><?= h($a['creado_en']) ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                <?php else: ?>
                    <p class="text-muted mb-0">No hay actividades registradas para esa fecha.</p>
                <?php endif; ?>
            <?php endif; ?>
        </div>
    </div>
</div>

<?php include __DIR__ . '/footer.php'; ?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


