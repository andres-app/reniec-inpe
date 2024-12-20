<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de DNI</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Roboto', sans-serif;
        }

        .container-fluid {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('background-image.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .left-section {
            background-color: #333333;
            color: #fff;
            padding: 40px;
            border-radius: 10px 0 0 10px;
        }

        .left-section h1 {
            font-size: 32px;
            font-weight: bold;
        }

        .left-section p {
            font-size: 18px;
            margin-top: 20px;
        }

        .right-section {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 0 10px 10px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .right-section h2 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333333;
        }

        .form-control {
            background: #f5f5f5;
            border: 1px solid #ddd;
            padding: 10px;
        }

        .btn-primary {
            background-color: #ffcc00;
            color: #333;
            border: none;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #e6b800;
        }

        .footer {
            margin-top: 20px;
            text-align: center;
            color: #666;
        }

        .footer p {
            font-size: 14px;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row shadow-lg">
            <!-- Sección izquierda -->
            <div class="col-md-6 left-section">
                <h1>¡Bienvenido a la consulta RENIEC!</h1>
                <p>Facilitamos la búsqueda de información confiable y actualizada.</p>
                <ul class="mt-4">
                    <li>Consulta datos oficiales.</li>
                    <li>Acceso rápido y seguro a datos personales.</li>
                    <li>Gestión eficiente de trámites en línea.</li>
                </ul>
                <img src="https://cdn.www.gob.pe/uploads/document/file/2772011/Logotipo%20RENIEC.png?v=1642696746">
            </div>
            <!-- Sección derecha -->
            <div class="col-md-6 right-section">
                <h2>Consulta de DNI</h2>
                <form method="GET" action="">
                    <div class="mb-3">
                        <label for="dni" class="form-label">Número de DNI:</label>
                        <input type="text" id="dni" name="dni" class="form-control" maxlength="8" required placeholder="Ingrese su DNI">
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Consultar</button>
                </form>

                <?php
if (isset($_GET['dni'])) {
    $dni = $_GET['dni'];

    // Conexión a la base de datos
    $dbHost = 'localhost';
    $dbName = 'bdreniec';
    $dbUser = 'root';
    $dbPass = '';

    try {
        $pdo = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Obtener la clave de la base de datos
        $stmt = $pdo->prepare("SELECT api_key FROM api_keys WHERE service_name = :service_name LIMIT 1");
        $stmt->execute(['service_name' => 'PeruDevs']);
        $keyRow = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($keyRow) {
            $key = $keyRow['api_key'];

            // Consultar la API
            $url = "https://api.perudevs.com/api/v1/dni/complete?document=$dni&key=$key";

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $response = curl_exec($ch);
            curl_close($ch);

            $data = json_decode($response, true);

            echo '<div class="mt-4">';
            if ($data && isset($data['estado']) && $data['estado'] == true) {
                // Datos encontrados
                $nombres = $data['resultado']['nombres'];
                $apellido_paterno = $data['resultado']['apellido_paterno'];
                $apellido_materno = $data['resultado']['apellido_materno'];
                $fecha_nacimiento = $data['resultado']['fecha_nacimiento'];
                $nombre_completo = $data['resultado']['nombre_completo'];
                $codigo_verificacion = $data['resultado']['codigo_verificacion'];
                $genero = $data['resultado']['genero'];

                // Formatear fecha de nacimiento
                if (strpos($fecha_nacimiento, '/') !== false) {
                    $fecha_nacimiento = DateTime::createFromFormat('d/m/Y', $fecha_nacimiento)->format('Y-m-d');
                }

                echo "<h4>Datos encontrados:</h4>";
                echo "<p><strong>Nombres:</strong> $nombres</p>";
                echo "<p><strong>Apellido Paterno:</strong> $apellido_paterno</p>";
                echo "<p><strong>Apellido Materno:</strong> $apellido_materno</p>";
                echo "<p><strong>Fecha de Nacimiento:</strong> $fecha_nacimiento</p>";
                echo "<p><strong>Nombre completo:</strong> $nombre_completo</p>";
                echo "<p><strong>Código de verificación:</strong> $codigo_verificacion</p>";
                echo "<p><strong>Género:</strong> $genero</p>";

                // Usar INSERT ON DUPLICATE KEY UPDATE
                $sql = "INSERT INTO api_requests (dni, nombres, apellido_paterno, apellido_materno, fecha_nacimiento, nombre_completo, codigo_verificacion, genero, estado_consulta)
                        VALUES (:dni, :nombres, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :nombre_completo, :codigo_verificacion, :genero, 1)
                        ON DUPLICATE KEY UPDATE
                        nombres = VALUES(nombres),
                        apellido_paterno = VALUES(apellido_paterno),
                        apellido_materno = VALUES(apellido_materno),
                        fecha_nacimiento = VALUES(fecha_nacimiento),
                        nombre_completo = VALUES(nombre_completo),
                        codigo_verificacion = VALUES(codigo_verificacion),
                        genero = VALUES(genero),
                        estado_consulta = 1";

                $stmt = $pdo->prepare($sql);
                $stmt->execute([
                    'dni' => $dni,
                    'nombres' => $nombres,
                    'apellido_paterno' => $apellido_paterno,
                    'apellido_materno' => $apellido_materno,
                    'fecha_nacimiento' => $fecha_nacimiento,
                    'nombre_completo' => $nombre_completo,
                    'codigo_verificacion' => $codigo_verificacion,
                    'genero' => $genero,
                ]);
            } else {
                echo "<p>No se encontraron datos para el DNI ingresado.</p>";

                // Registrar consulta fallida
                $sql = "INSERT INTO api_requests (dni, estado_consulta)
                        VALUES (:dni, 0)
                        ON DUPLICATE KEY UPDATE estado_consulta = 0";
                $stmt = $pdo->prepare($sql);
                $stmt->execute(['dni' => $dni]);
            }

            echo '</div>';
        } else {
            echo "<p>Error: No se encontró la clave API en la base de datos.</p>";
        }
    } catch (PDOException $e) {
        echo "<p>Error en la conexión a la base de datos: " . $e->getMessage() . "</p>";
    }
}
?>



            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
</body>

</html>