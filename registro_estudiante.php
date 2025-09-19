<?php
session_start();
if (!isset($_SESSION["user_id"]) || $_SESSION["rol"] !== "admin") {
    header("Location: index.php");
    exit();
}
include './db/conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST["nombre"];
    $email = $_POST["email"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
    $documento = $_POST["documento"];
    $grado = $_POST["grado"];
    $rol = 'estudiante';

    $stmt_user = $conn->prepare("INSERT INTO usuarios (nombre, email, password, rol) VALUES (?, ?, ?, ?)");
    $stmt_user->bind_param("ssss", $nombre, $email, $password, $rol);

    if ($stmt_user->execute()) {
        $usuario_id = $stmt_user->insert_id;
        $stmt_est = $conn->prepare("INSERT INTO estudiantes (usuario_id, documento, grado) VALUES (?, ?, ?)");
        $stmt_est->bind_param("iss", $usuario_id, $documento, $grado);
        if ($stmt_est->execute()) {
            $success = "Estudiante registrado correctamente.";
        } else {
            $error = "Error al registrar datos del estudiante: " . $stmt_est->error;
        }
    } else {
        $error = "Error al registrar usuario: " . $stmt_user->error;
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro Estudiante - Biblioteca</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<?php include __DIR__ . '/header.php'; ?>
<div class="text-center mt-3">
                <a href="dashboard_admin.php">Volver al Panel</a>
            </div>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Registrar Estudiante</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <?php if (isset($success)): ?>
                <div class="alert alert-success"><?php echo $success; ?></div>
            <?php elseif (isset($error)): ?>
                <div class="alert alert-danger"><?php echo $error; ?></div>
            <?php endif; ?>
            <form method="POST">
                <div class="mb-3">
                    <label class="form-label">Nombre completo:</label>
                    <input type="text" name="nombre" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Correo electrónico:</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Contraseña:</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Documento de identidad:</label>
                    <input type="text" name="documento" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Grado:</label>
                    <input type="text" name="grado" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-success w-100">Registrar Estudiante</button>
            </form>
            
        </div>
    </div>
</div>
<?php include __DIR__ . '/footer.php'; ?>
</body>
</html>
