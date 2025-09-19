<?php
session_start();
if (!isset($_SESSION["user_id"]) || $_SESSION["rol"] !== "admin") {
    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Administrador - Biblioteca</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root{
            --cab-primary: #0b3a68;   /* azul institucional */
            --cab-gold:    #c9a227;   /* dorado */
            --cab-accent:  #0d6efd;   /* acento (compat Bootstrap) */
            --cab-muted:   #6c757d;
            --card-shadow: 0 10px 22px rgba(11,58,104,.08), 0 2px 6px rgba(0,0,0,.05);
        }

        html, body { height: 100%; }
        body {
            display: flex; flex-direction: column; background: #f6f8fb;
        }
        .main-content { flex: 1; }

        /* Encabezado de página */
        .page-header{
            background: linear-gradient(135deg, var(--cab-primary) 0%, #0e4a85 60%, #1360ae 100%);
            color:#fff; border-radius: 16px; padding: 28px 24px; box-shadow: var(--card-shadow);
        }
        .page-header .subtitle{
            color: rgba(255,255,255,.85); font-size: .95rem; margin-top: .25rem;
        }

        /* Tarjetas del tablero */
        .dash-card{
            border: 0;
            border-top: 5px solid transparent;
            border-radius: 14px;
            box-shadow: var(--card-shadow);
            transition: transform .2s ease, box-shadow .2s ease, border-color .2s ease;
            background:#fff;
        }
        .dash-card:hover{ transform: translateY(-2px); box-shadow: 0 12px 26px rgba(11,58,104,.14); }
        .dash-card .card-body{ padding: 22px; }
        .dash-card .card-title{ font-weight: 700; color: #0f2238; }
        .dash-card .lead{ color: var(--cab-muted); font-size: .92rem; margin-bottom: 12px; }

        /* Borde superior por “categoría” */
        .bt-primary { border-top-color: var(--cab-primary); }
        .bt-gold    { border-top-color: var(--cab-gold); }
        .bt-green   { border-top-color: #2e7d32; }
        .bt-orange  { border-top-color: #ff8f00; }
        .bt-cyan    { border-top-color: #0aa2c0; }
        .bt-grey    { border-top-color: #495057; }
        .bt-red     { border-top-color: #c62828; }

        /* Botones a toda anchura y con estilo */
        .btn-wide{ width:100%; font-weight:600; padding:.7rem 1rem; border-radius:10px; }
        .btn-cab-primary{
            background: var(--cab-primary); border-color: var(--cab-primary);
        }
        .btn-cab-primary:hover{ background:#083153; border-color:#083153; }
        .btn-cab-gold{
            background: var(--cab-gold); border-color: var(--cab-gold); color:#1b1b1b;
        }
        .btn-cab-gold:hover{ background:#b38f22; border-color:#b38f22; color:#fff; }
        .btn-outline-cab{
            border-color: var(--cab-primary); color: var(--cab-primary);
        }
        .btn-outline-cab:hover{ background: var(--cab-primary); color:#fff; }

        /* Sección auditoría al final con descripciones debajo de cada botón */
        .audit-card { border:0; border-radius:16px; box-shadow: var(--card-shadow); }
        .audit-btn { min-width: 220px; }
        .audit-desc { color: var(--cab-muted); font-size: .92rem; margin-top:.35rem; }

        /* Logout */
        .logout-section { padding: 20px 0 28px; }

        /* Responsivo: separaciones */
        .g-elite { row-gap: 1.25rem; }

        /* Íconos grandes opcionales usando emoji */
        .icon-xxl{ font-size: 2rem; line-height:1; margin-bottom: .5rem; }
    </style>
</head>

<body>
    <?php include 'header.php'; ?>

    <div class="container mt-4 mb-4 main-content">
        <!-- Cabecera del dashboard -->
        <div class="page-header mb-4">
            <h2 class="mb-0">Panel de Administración de Biblioteca</h2>
            <div class="subtitle">Colegio Americano de Barranquilla • Gestión centralizada de módulos</div>
        </div>

        <!-- GRID DE TARJETAS -->
        <div class="row g-elite">
            <!-- Fila 1 -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="card dash-card bt-primary">
                    <div class="card-body text-center">
                        <div class="icon-xxl">📚</div>
                        <h5 class="card-title">Registrar Libro</h5>
                        <p class="lead">Añade nuevos títulos al inventario de la biblioteca.</p>
                        <a href="registrar_libro.php" class="btn btn-cab-primary btn-wide">Ir al módulo</a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4">
                <div class="card dash-card bt-green">
                    <div class="card-body text-center">
                        <div class="icon-xxl">🧑‍🎓</div>
                        <h5 class="card-title">Registrar Estudiante</h5>
                        <p class="lead">Crea o actualiza la ficha de estudiantes.</p>
                        <a href="registro_estudiante.php" class="btn btn-success btn-wide">Ir al módulo</a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4">
                <div class="card dash-card bt-orange">
                    <div class="card-body text-center">
                        <div class="icon-xxl">📖</div>
                        <h5 class="card-title">Realizar Préstamo</h5>
                        <p class="lead">Entrega y control de préstamos de material.</p>
                        <a href="realizar_prestamo.php" class="btn btn-warning btn-wide">Ir al módulo</a>
                    </div>
                </div>
            </div>

            <!-- Fila 2 -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="card dash-card bt-cyan">
                    <div class="card-body text-center">
                        <div class="icon-xxl">📘</div>
                        <h5 class="card-title">Historial de Préstamos</h5>
                        <p class="lead">Consulta movimientos, devoluciones y estados.</p>
                        <a href="historial_prestamos.php" class="btn btn-info btn-wide">Ver historial</a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4">
                <div class="card dash-card bt-grey">
                    <div class="card-body text-center">
                        <div class="icon-xxl">📋</div>
                        <h5 class="card-title">Lista de Estudiantes</h5>
                        <p class="lead">Listado, edición y búsqueda detallada.</p>
                        <a href="./estudiantes/estudiantes.php" class="btn btn-dark btn-wide">Abrir lista</a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4">
                <div class="card dash-card bt-primary">
                    <div class="card-body text-center">
                        <div class="icon-xxl">📅</div>
                        <h5 class="card-title">Agenda de Biblioteca</h5>
                        <p class="lead">Reservas, actividades y programación.</p>
                        <a href="./agenda_biblioteca/agenda_biblioteca.php" class="btn btn-cab-primary btn-wide">Gestionar</a>
                    </div>
                </div>
            </div>

            <!-- Fila 3 -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="card dash-card bt-red">
                    <div class="card-body text-center">
                        <div class="icon-xxl">⚠️</div>
                        <h5 class="card-title">Llamados de Atención</h5>
                        <p class="lead">Registro y seguimiento de llamados.</p>
                        <a href="./llamadas/llamados.php" class="btn btn-danger btn-wide">Gestionar</a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4">
                <div class="card dash-card bt-grey">
                    <div class="card-body text-center">
                        <div class="icon-xxl">💻</div>
                        <h5 class="card-title">Consulta Especializada</h5>
                        <p class="lead">Asignación y control de equipos de consulta.</p>
                        <a href="consultas.php" class="btn btn-outline-secondary btn-wide">Asignar PC</a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4">
                <div class="card dash-card bt-green">
                    <div class="card-body text-center">
                        <div class="icon-xxl">👨‍🏫</div>
                        <h5 class="card-title">Actividades Biblioteca</h5>
                        <p class="lead">Registra y consulta actividades internas.</p>
                        <a href="actividades_biblioteca.php" class="btn btn-success btn-wide">Ver</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- SECCIÓN DE AUDITORÍA (al final, con descripciones bajo los botones) -->
        <div class="card audit-card mt-5">
            <div class="card-header" style="background:linear-gradient(90deg,var(--cab-primary),#14518d); color:#fff;">
                <h5 class="mb-0">📊 Gestión de Auditoría</h5>
            </div>
            <div class="card-body">
                <div class="row gy-4 justify-content-center">
                    <div class="col-12 col-md-6 col-lg-4 text-center">
                        <a href="auditoria_prestamos.php" class="btn btn-outline-cab audit-btn">
                            🔍 Ver auditoría
                        </a>
                        <div class="audit-desc">Explora eventos, acciones y estados para análisis y control.</div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4 text-center">
                        <a href="exportar_auditoria_excel.php" class="btn btn-cab-gold audit-btn">
                            📥 Exportar a Excel
                        </a>
                        <div class="audit-desc">Descarga un reporte detallado en formato Excel para compartir.</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Cerrar sesión -->
        <div class="logout-section text-center">
            <a href="logout.php" class="btn btn-outline-danger px-4 py-2">Cerrar sesión</a>
        </div>
    </div>

    <?php include 'footer.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
