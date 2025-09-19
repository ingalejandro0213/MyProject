<?php
// llamados.php (DENTRO de /llamadas)
declare(strict_types=1);

require_once __DIR__ . '/../db/conexion.php';
require_once __DIR__ . '/../header.php';

// Registrar llamado de atención
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $stmt = $conn->prepare("INSERT INTO llamados_atencion (estudiante_id, motivo) VALUES (?, ?)");
    $stmt->bind_param("is", $_POST["estudiante_id"], $_POST["motivo"]);
    $stmt->execute();
    $stmt->close();
    header("Location: " . basename(__FILE__)); // redirige a llamados.php
    exit();
}

// Listado para el select del formulario
$estudiantes = $conn->query("SELECT id, nombre_completo FROM estudiantes ORDER BY nombre_completo");

// --- NUEVO: Listado de estudiantes con llamados (nombre + total) ---
$sql_ranking = "
    SELECT e.id, e.nombre_completo, COUNT(la.id) AS total_llamados
    FROM llamados_atencion la
    INNER JOIN estudiantes e ON e.id = la.estudiante_id
    GROUP BY e.id, e.nombre_completo
    HAVING COUNT(la.id) > 0
    ORDER BY total_llamados DESC, e.nombre_completo ASC
";
$ranking = $conn->query($sql_ranking);

// --- NUEVO: Si viene ?ver=ID, se muestran los detalles de ese estudiante ---
$ver_id = isset($_GET['ver']) ? (int)$_GET['ver'] : 0;
$detalles_llamados = null;
$ver_nombre = '';

if ($ver_id > 0) {
    // Traer el nombre del estudiante
    $stmt_nombre = $conn->prepare("SELECT nombre_completo FROM estudiantes WHERE id = ?");
    $stmt_nombre->bind_param("i", $ver_id);
    $stmt_nombre->execute();
    $res_nombre = $stmt_nombre->get_result()->fetch_assoc();
    $stmt_nombre->close();
    if ($res_nombre) {
        $ver_nombre = $res_nombre['nombre_completo'];
    }

    // Traer detalles de llamados
    $stmt_det = $conn->prepare("
        SELECT motivo, fecha
        FROM llamados_atencion
        WHERE estudiante_id = ?
        ORDER BY fecha DESC, id DESC
    ");
    $stmt_det->bind_param("i", $ver_id);
    $stmt_det->execute();
    $detalles_llamados = $stmt_det->get_result();
    $stmt_det->close();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Llamados de Atención</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { padding-top: 90px; padding-bottom: 90px; }
        header, footer { position: fixed; width: 100%; z-index: 1040; }
        header { top: 0; }
        footer { bottom: 0; }
    </style>
</head>
<body>

<div class="container mt-4">
    <h2 class="mb-4 text-center">📢 Llamados de Atención a Estudiantes</h2>

    <!-- Formulario de registro -->
    <form method="POST" class="row g-3 mb-4 border p-3 bg-light rounded shadow-sm">
        <div class="col-md-6">
            <label class="form-label">Estudiante:</label>
            <select name="estudiante_id" id="estudiante_id" class="form-select" required>
                <option value="">Seleccione...</option>
                <?php while($row = $estudiantes->fetch_assoc()): ?>
                    <option value="<?= (int)$row['id'] ?>"><?= htmlspecialchars($row['nombre_completo']) ?></option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="col-md-6">
            <label class="form-label">Motivo:</label>
            <textarea name="motivo" id="motivo" class="form-control" rows="1" required></textarea>
        </div>
        <div class="col-12 text-end">
            <button type="submit" class="btn btn-primary">Registrar Llamado</button>
        </div>
    </form>

    <!-- NUEVO: Tabla de estudiantes con llamados -->
    <div class="mt-4">
        <h4 class="text-center">👥 Estudiantes con llamados registrados</h4>
        <?php if ($ranking && $ranking->num_rows > 0): ?>
            <div class="table-responsive mt-3">
                <table class="table table-bordered table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th style="min-width: 280px;">Estudiante</th>
                            <th class="text-center" style="width: 160px;">Total de llamados</th>
                            <th class="text-center" style="width: 160px;">Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($r = $ranking->fetch_assoc()): ?>
                            <tr>
                                <td><?= htmlspecialchars($r['nombre_completo']) ?></td>
                                <td class="text-center"><span class="badge bg-primary"><?= (int)$r['total_llamados'] ?></span></td>
                                <td class="text-center">
                                    <a class="btn btn-sm btn-outline-primary"
                                       href="<?= htmlspecialchars(basename(__FILE__)) ?>?ver=<?= (int)$r['id'] ?>">
                                        Ver detalles
                                    </a>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        <?php else: ?>
            <p class="text-muted text-center">Aún no hay estudiantes con llamados registrados.</p>
        <?php endif; ?>
    </div>

    <!-- NUEVO: Detalle del estudiante seleccionado -->
    <?php if ($ver_id > 0): ?>
        <div class="mt-5">
            <h5 class="text-center">📋 Detalles de llamados de <?= htmlspecialchars($ver_nombre ?: 'Estudiante') ?></h5>
            <?php if ($detalles_llamados && $detalles_llamados->num_rows > 0): ?>
                <div class="d-flex justify-content-center">
                    <table class="table table-bordered table-hover mt-3 w-auto">
                        <thead class="table-secondary">
                            <tr>
                                <th>Fecha</th>
                                <th>Motivo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while ($d = $detalles_llamados->fetch_assoc()): ?>
                                <tr>
                                    <td><?= date('d/m/Y', strtotime($d['fecha'])) ?></td>
                                    <td><?= htmlspecialchars($d['motivo']) ?></td>
                                </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            <?php else: ?>
                <p class="text-muted text-center">Este estudiante no tiene llamados registrados.</p>
            <?php endif; ?>
            <div class="text-center mt-3">
                <a href="<?= htmlspecialchars(basename(__FILE__)) ?>" class="btn btn-outline-secondary btn-sm">Volver al listado</a>
            </div>
        </div>
    <?php endif; ?>
</div>

<?php require_once __DIR__ . '/../footer.php'; ?>
</body>
</html>
