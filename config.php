<?php
// config.php (RAÍZ del proyecto)
declare(strict_types=1);

// Calcula la URL base comparando la ruta física del proyecto con el DOCUMENT_ROOT
$docRoot = rtrim(str_replace('\\','/', $_SERVER['DOCUMENT_ROOT']), '/');
$appRoot = rtrim(str_replace('\\','/', realpath(__DIR__)), '/'); // __DIR__ = raíz del proyecto
$baseUrl = rtrim(str_replace($docRoot, '', $appRoot), '/').'/';

// Si la app está en la raíz del dominio, quedaría "/".
// Si está en /proyecto, quedaría "/proyecto/"
if ($baseUrl === '') { $baseUrl = '/'; }

define('BASE_URL', $baseUrl);

// (Opcional) Configura zona horaria y charset
date_default_timezone_set('America/Bogota');
header('Content-Type: text/html; charset=UTF-8');
