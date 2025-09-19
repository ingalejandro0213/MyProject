<?php
// Conexión a la base de datos
require_once '../db/conexion.php';

// Filtro seguro por fecha (opcional)
$filtro = isset($_GET['filtro_fecha']) ? trim($_GET['filtro_fecha']) : null;

// Query base
$sqlBase = "SELECT id, fecha, hora_inicio, hora_fin, responsable, area_sesion, actividad, creado_en 
            FROM agenda_reservas ";

// Ejecutar consulta (con o sin filtro) usando prepared statements
if ($filtro) {
    $sql = $sqlBase . " WHERE fecha = ? ORDER BY hora_inicio";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $filtro);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
} else {
    $sql = $sqlBase . " ORDER BY fecha, hora_inicio";
    $result = $conn->query($sql);
}

// Construir eventos para FullCalendar
$eventos = [];
while ($row = $result->fetch_assoc()) {
    // Asegurar formato ISO (agregar :00 si tu TIME viene HH:MM)
    $inicio = preg_match('/^\d{2}:\d{2}(:\d{2})?$/', $row['hora_inicio']) ? $row['hora_inicio'] : ($row['hora_inicio'] . ':00');
    $fin    = preg_match('/^\d{2}:\d{2}(:\d{2})?$/', $row['hora_fin'])    ? $row['hora_fin']    : ($row['hora_fin'] . ':00');

    $eventos[] = [
        'id'    => (int)$row['id'],
        'title' => $row['actividad'] . " — " . $row['responsable'],
        'start' => $row['fecha'] . 'T' . $inicio,
        'end'   => $row['fecha'] . 'T' . $fin,
        'extendedProps' => [
            'responsable' => $row['responsable'],
            'area'        => $row['area_sesion'],
            'actividad'   => $row['actividad'],
            'creado_en'   => $row['creado_en'],
            'fecha'       => $row['fecha'],
            'hora_inicio' => $row['hora_inicio'],
            'hora_fin'    => $row['hora_fin']
        ]
    ];
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agenda Biblioteca</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- FullCalendar: usa los bundles global (evita 'FullCalendar undefined') -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/locales-all.global.min.js"></script>

    <style>
        #calendario { min-height: 720px; background: #fff; border: 1px solid #e5e7eb; border-radius: .5rem; padding: .75rem; }
        .fc .fc-toolbar-title { font-size: 1.15rem; }
    </style>
</head>
<body class="bg-light">
<?php include '../header.php'; ?>

<div class="container mt-4">
    <h2 class="text-center mb-4">📅 Agenda de Biblioteca</h2>

    <!-- Botón para volver -->
    <div class="mb-3 text-start">
        <a href="../dashboard_admin.php" class="btn btn-outline-primary">🏠 Volver a la página principal</a>
    </div>

    <!-- Formulario de creación -->
    <div class="card mb-4 shadow-sm">
        <div class="card-header bg-success text-white">Registrar nueva reserva</div>
        <div class="card-body">
            <form action="guardar_reserva.php" method="POST" class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Fecha</label>
                    <input type="date" name="fecha" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Hora de Inicio</label>
                    <input type="time" name="hora_inicio" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Hora de Fin</label>
                    <input type="time" name="hora_fin" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Responsable</label>
                    <input type="text" name="responsable" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Área o Sección:</label>
                    <input type="text" name="area_sesion" class="form-control" required>
                </div>
                <div class="col-md-12">
                    <label class="form-label">Actividad</label>
                    <textarea name="actividad" rows="2" class="form-control" required></textarea>
                </div>
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-success">Guardar Reserva</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Filtro por fecha -->
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-warning text-dark">🔍 Filtrar por Fecha</div>
        <div class="card-body">
            <form method="GET" class="row g-3">
                <div class="col-md-4">
                    <input type="date" name="filtro_fecha" class="form-control" value="<?php echo $filtro ? htmlspecialchars($filtro) : ''; ?>">
                </div>
                <div class="col-md-4">
                    <button type="submit" class="btn btn-outline-primary">Aplicar Filtro</button>
                    <a href="agenda_biblioteca.php" class="btn btn-outline-secondary">Limpiar</a>
                </div>
                <div class="col-md-4">
                    <a href="exportar_excel.php<?php echo $filtro ? '?filtro_fecha=' . urlencode($filtro) : ''; ?>" class="btn btn-success">📥 Exportar a Excel</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Calendario -->
    <div class="card shadow-sm mb-5">
        <div class="card-header bg-primary text-white">🗓️ Calendario de Reservas</div>
        <div class="card-body">
            <div id="calendario"></div>
            <?php if (empty($eventos)): ?>
                <p class="text-center text-muted mt-3 mb-0">No hay reservas para mostrar.</p>
            <?php endif; ?>
        </div>
    </div>
</div>

<?php include '../footer.php'; ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const calendarEl = document.getElementById('calendario');
    const eventos = <?php echo json_encode($eventos, JSON_UNESCAPED_UNICODE); ?>;

    if (!calendarEl) return;

    // Si NO quieres que el usuario vea la lista, ya la eliminamos del HTML.
    // Solo renderizamos el calendario:
    const calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'es',
        timeZone: 'local',
        initialView: 'dayGridMonth',
        height: 'auto',
        nowIndicator: true,
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        slotMinTime: '06:00:00',
        slotMaxTime: '19:00:00',
        expandRows: true,
        navLinks: true,
        weekNumbers: true,
        selectable: false,
        editable: false,
        displayEventEnd: true,
        events: eventos,
        eventDidMount: function(info) {
            const p = info.event.extendedProps || {};
            info.el.title =
                "Actividad: " + (p.actividad || info.event.title) + "\n" +
                "Responsable: " + (p.responsable || '') + "\n" +
                "Área/Sesión: " + (p.area || '') + "\n" +
                "Inicio: " + (info.event.start ? info.event.start.toLocaleString() : '') + "\n" +
                (info.event.end ? ("Fin: " + info.event.end.toLocaleString() + "\n") : "") +
                "Registrado: " + (p.creado_en || '');
        },
        eventClick: function(info) {
            const p = info.event.extendedProps || {};
            const inicio = info.event.start ? info.event.start.toLocaleString() : '';
            const fin    = info.event.end ? info.event.end.toLocaleString() : '';
            alert(
                "📘 Detalle de reserva\n\n" +
                "Actividad: " + (p.actividad || info.event.title) + "\n" +
                "Responsable: " + (p.responsable || '') + "\n" +
                "Área/Sesión: " + (p.area || '') + "\n" +
                "Inicio: " + inicio + "\n" +
                (fin ? ("Fin: " + fin + "\n") : "") +
                "Registrado: " + (p.creado_en || '')
            );
        }
    });

    calendar.render();
});
</script>
</body>
</html>
