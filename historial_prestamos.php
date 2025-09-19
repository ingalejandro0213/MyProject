    <?php
session_start();

if (empty($_SESSION["user_id"]) || !isset($_SESSION["rol"]) || $_SESSION["rol"] !== "admin") {
    header("Location: index.php");
    exit();
}

include './db/conexion.php';

$nombre_estudiante = $_GET['nombre_estudiante'] ?? '';
$fecha_inicio = $_GET['fecha_inicio'] ?? '';
$fecha_fin = $_GET['fecha_fin'] ?? '';

// Consulta con filtros
$sql = "SELECT 
            p.id, 
            l.titulo, 
            e.nombre_completo AS estudiante, 
            e.grado AS grado, 
            p.fecha_prestamo, 
            p.fecha_devolucion, 
            p.devuelto
        FROM prestamos p
        INNER JOIN libros l ON p.libro_id = l.id
        INNER JOIN estudiantes e ON p.estudiante_id = e.id
        WHERE 1=1";

$params = [];

if (!empty($nombre_estudiante)) {
    $sql .= " AND e.nombre_completo LIKE ?";
    $params[] = "%$nombre_estudiante%";
}

if (!empty($fecha_inicio)) {
    $sql .= " AND p.fecha_prestamo >= ?";
    $params[] = $fecha_inicio;
}

if (!empty($fecha_fin)) {
    $sql .= " AND p.fecha_prestamo <= ?";
    $params[] = $fecha_fin;
}

$sql .= " ORDER BY p.fecha_prestamo DESC";

// Preparar y ejecutar
$stmt = $conn->prepare($sql);

if ($params) {
    $types = str_repeat("s", count($params));
    $stmt->bind_param($types, ...$params);
}

$stmt->execute();
$resultado = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial de Préstamos - Biblioteca</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">📚 Historial de Préstamos</h2>

    <!-- Filtro -->
    <form class="row g-3 mb-4" method="GET" action="">
        <div class="col-md-4">
            <input type="text" name="nombre_estudiante" class="form-control" placeholder="Buscar por estudiante" value="<?= htmlspecialchars($nombre_estudiante) ?>">
        </div>
        <div class="col-md-3">
            <input type="date" name="fecha_inicio" class="form-control" value="<?= htmlspecialchars($fecha_inicio) ?>">
        </div>
        <div class="col-md-3">
            <input type="date" name="fecha_fin" class="form-control" value="<?= htmlspecialchars($fecha_fin) ?>">
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-success w-100">Buscar</button>
        </div>
    </form>

    <!-- Tabla -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Libro</th>
                    <th>Estudiante</th>
                    <th>Grado</th>
                    <th>Fecha de Préstamo</th>
                    <th>Fecha Limite para Devolución</th>
                    <th>Devuelto</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($resultado->num_rows > 0): ?>
                    <?php while ($row = $resultado->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row["id"]) ?></td>
                            <td><?= htmlspecialchars($row["titulo"]) ?></td>
                            <td><?= htmlspecialchars($row["estudiante"]) ?></td>
                            <td><?= htmlspecialchars($row["grado"]) ?></td>
                            <td><?= date('d/m/Y', strtotime($row["fecha_prestamo"])) ?></td>
                            <td><?= date('d/m/Y', strtotime($row["fecha_devolucion"])) ?></td>
                            <td class="text-center">
                                <?php if ($_SESSION["rol"] === "admin"): ?>
                                    <form method="POST" action="cambiar_estado.php" onsubmit="return confirm('¿Estás seguro de cambiar el estado?');">
                                        <input type="hidden" name="prestamo_id" value="<?= $row['id'] ?>">
                                        <input type="hidden" name="estado_actual" value="<?= $row['devuelto'] ?>">
                                        <button type="submit" class="btn btn-sm <?= $row['devuelto'] === 'si' ? 'btn-outline-success' : 'btn-outline-danger' ?>">
                                            <?= $row['devuelto'] === 'si' ? '✔️ Sí' : '❌ No' ?>
                                        </button>
                                    </form>
                                <?php else: ?>
                                    <?= $row["devuelto"] === 'si' ? '<span class="text-success fw-bold">✔️ Sí</span>' : '<span class="text-danger fw-bold">❌ No</span>' ?>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="7" class="text-center text-muted">No se encontraron registros con los filtros aplicados.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-4">
        <a href="dashboard_admin.php" class="btn btn-primary">Volver al Panel</a>
    </div>
</div>

</body>
</html>
