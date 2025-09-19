<?php
session_start();

if (empty($_SESSION['user_id']) || empty($_SESSION['rol']) || $_SESSION['rol'] !== 'admin') {
    header('Location: index.php');
    exit();
}

require_once __DIR__ . '/db/conexion.php'; // $conn (mysqli)
if ($conn instanceof mysqli) {
    $conn->set_charset('utf8mb4');
}

// Mensajes para la vista
$flash = ['type' => null, 'msg' => null];

// PRG: si venimos de una redirección con mensaje
if (isset($_GET['status'], $_GET['msg'])) {
    $flash['type'] = $_GET['status'] === 'ok' ? 'success' : 'danger';
    $flash['msg']  = $_GET['msg'];
}

// Procesamiento POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitizar y validar
    $titulo       = trim($_POST['titulo'] ?? '');
    $autor        = trim($_POST['autor'] ?? '');
    $codigo_libro = trim($_POST['codigo_libro'] ?? '');

    if ($titulo === '' || $autor === '' || $codigo_libro === '') {
        $status = 'err';
        $msg = 'Todos los campos son obligatorios.';
    } elseif (mb_strlen($titulo) > 255 || mb_strlen($autor) > 255 || mb_strlen($codigo_libro) > 64) {
        $status = 'err';
        $msg = 'Revisa la longitud: Título/Autor ≤ 255, Código ≤ 64 caracteres.';
    } else {
        // (Opcional) verificar duplicado por código
        $dup = $conn->prepare('SELECT 1 FROM libros WHERE codigo_libro = ? LIMIT 1');
        if ($dup && $dup->bind_param('s', $codigo_libro) && $dup->execute()) {
            $dup->store_result();
            if ($dup->num_rows > 0) {
                $status = 'err';
                $msg = 'Ya existe un libro con ese código.';
            } else {
                // Insertar
                $stmt = $conn->prepare('INSERT INTO libros (titulo, autor, codigo_libro) VALUES (?, ?, ?)');
                if (!$stmt) {
                    $status = 'err';
                    $msg = 'No se pudo preparar la consulta.';
                } else {
                    $stmt->bind_param('sss', $titulo, $autor, $codigo_libro);
                    if ($stmt->execute()) {
                        $status = 'ok';
                        $msg = 'Libro registrado exitosamente.';
                    } else {
                        // Si tienes índice único en codigo_libro, podrías detectar error 1062
                        $status = 'err';
                        $msg = 'Error al registrar libro.';
                    }
                    $stmt->close();
                }
            }
        } else {
            $status = 'err';
            $msg = 'Error validando duplicados.';
        }
        if ($dup) { $dup->close(); }
    }

    // Redirección PRG con mensaje
    $to = 'registrar_libro.php?status=' . ($status === 'ok' ? 'ok' : 'err')
       . '&msg=' . urlencode($msg);
    header("Location: $to");
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registrar Libro - Biblioteca</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<?php
// Header (asegúrate que la ruta es correcta)
$headerPath = __DIR__ . '/header.php';
if (is_file($headerPath)) { require_once $headerPath; }
?>
<div class="container mt-5">
  <h2 class="text-center mb-4">Registrar Nuevo Libro</h2>
  <div class="row justify-content-center">
    <div class="col-md-6">

      <?php if ($flash['msg']): ?>
        <div class="alert alert-<?= $flash['type'] === 'success' ? 'success' : 'danger' ?>">
          <?= htmlspecialchars($flash['msg'], ENT_QUOTES, 'UTF-8') ?>
        </div>
      <?php endif; ?>

      <form method="POST" novalidate>
        <div class="mb-3">
          <label class="form-label">Título del libro:</label>
          <input type="text" name="titulo" class="form-control" maxlength="255" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Autor:</label>
          <input type="text" name="autor" class="form-control" maxlength="255" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Código del libro (ISBN o interno):</label>
          <input type="text" name="codigo_libro" class="form-control" maxlength="64" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Registrar Libro</button>
      </form>

      <div class="text-center mt-3">
        <a href="dashboard_admin.php">Volver al Panel</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>
