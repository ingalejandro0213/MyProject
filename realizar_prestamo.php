<?php 
session_start();
if (!isset($_SESSION["user_id"]) || $_SESSION["rol"] !== "admin") {
    header("Location: index.php");
    exit();
}

include './db/conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $libro_id = intval($_POST["libro_id"]);
    $estudiante_id = intval($_POST["estudiante_id"]);
    $fecha_prestamo = $_POST["fecha_prestamo"];
    $fecha_devolucion = $_POST["fecha_devolucion"];
    $puede_prestarse = false;

    // Verificar estado del libro
    $check = $conn->prepare("SELECT estado FROM libros WHERE id = ?");
    $check->bind_param("i", $libro_id);
    $check->execute();
    $res_check = $check->get_result();
    $row = $res_check->fetch_assoc();

    if ($row && $row["estado"] === "disponible") {
        $puede_prestarse = true;
    } elseif ($row) {
        $verificar_prestamo = $conn->prepare("
            SELECT devuelto 
            FROM prestamos 
            WHERE libro_id = ? 
            ORDER BY fecha_prestamo DESC 
            LIMIT 1
        ");
        $verificar_prestamo->bind_param("i", $libro_id);
        $verificar_prestamo->execute();
        $res = $verificar_prestamo->get_result();
        $ultimo = $res->fetch_assoc();
        if ($ultimo && $ultimo['devuelto'] === 'si') {
            $puede_prestarse = true;
        }
    }

    if ($puede_prestarse) {
        // Obtener grado del estudiante
        $query_grado = $conn->prepare("SELECT grado FROM estudiantes WHERE id = ?");
        $query_grado->bind_param("i", $estudiante_id);
        $query_grado->execute();
        $res_grado = $query_grado->get_result();
        $grado_row = $res_grado->fetch_assoc();
        $grado = $grado_row ? $grado_row['grado'] : '';

        // Insertar el préstamo
        $stmt = $conn->prepare("
            INSERT INTO prestamos (libro_id, estudiante_id, grado, fecha_prestamo, fecha_devolucion, devuelto) 
            VALUES (?, ?, ?, ?, ?, 'no')
        ");
        $stmt->bind_param("iisss", $libro_id, $estudiante_id, $grado, $fecha_prestamo, $fecha_devolucion);

        if ($stmt->execute()) {
            $conn->query("UPDATE libros SET estado = 'prestado' WHERE id = $libro_id");
            $success = "✅ Préstamo registrado correctamente.";
        } else {
            $error = "❌ Error al registrar préstamo: " . $stmt->error;
        }
    } else {
        $error = "⚠️ El libro no está disponible para préstamo.";
    }
}

// Libros disponibles o devueltos
$libros = $conn->query("
    SELECT l.id, l.titulo 
    FROM libros l
    LEFT JOIN (
        SELECT libro_id, MAX(fecha_prestamo) AS ultima_fecha 
        FROM prestamos 
        GROUP BY libro_id
    ) ult ON l.id = ult.libro_id
    LEFT JOIN prestamos p ON l.id = p.libro_id AND p.fecha_prestamo = ult.ultima_fecha
    WHERE l.estado = 'disponible' OR (l.estado = 'prestado' AND p.devuelto = 'si')
");

// Estudiantes
$estudiantes = $conn->query("SELECT id, nombre_completo FROM estudiantes ORDER BY nombre_completo ASC");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Realizar Préstamo - Biblioteca</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
  <?php include __DIR__ . '/header.php'; ?>
<body class="bg-light">
   
<div class="container mt-5">
    
    <div class="mb-3 text-start">
       
        <a href="dashboard_admin.php" class="btn btn-outline-primary">🏠 Volver a la página principal</a>
    </div>

    <h2 class="text-center mb-4">📚 Realizar Préstamo de Libro</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <?php if (isset($success)): ?>
                <div class="alert alert-success text-center"><?= $success ?></div>
            <?php elseif (isset($error)): ?>
                <div class="alert alert-danger text-center"><?= $error ?></div>
            <?php endif; ?>

            <form method="POST">
                <div class="mb-3">
                    <label class="form-label">📖 Libro:</label>
                    <select name="libro_id" class="form-select" required>
                        <option value="">Seleccione un libro</option>
                        <?php while ($libro = $libros->fetch_assoc()): ?>
                            <option value="<?= $libro['id'] ?>"><?= htmlspecialchars($libro['titulo']) ?></option>
                        <?php endwhile; ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">👤 Estudiante:</label>
                    <select name="estudiante_id" class="form-select" required>
                        <option value="">Seleccione un estudiante</option>
                        <?php while ($est = $estudiantes->fetch_assoc()): ?>
                            <option value="<?= $est['id'] ?>"><?= htmlspecialchars($est['nombre_completo']) ?></option>
                        <?php endwhile; ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">📅 Fecha de préstamo:</label>
                    <input type="date" name="fecha_prestamo" class="form-control" required value="<?= date('Y-m-d') ?>">
                </div>

                <div class="mb-3">
                    <label class="form-label">📅 Fecha de devolución:</label>
                    <input type="date" name="fecha_devolucion" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-warning w-100">Registrar Préstamo</button>
            </form>

            <div class="text-center mt-3">
                <a href="dashboard_admin.php" class="btn btn-secondary">Volver al Panel</a>
            </div>
        </div>
    </div>
</div>
<?php include __DIR__ . '/footer.php'; ?>
</body>
</html>
