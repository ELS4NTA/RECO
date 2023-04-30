<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Notas</title>
</head>
<body>
    <div class="contenedor-formulario">
        <h1 id="titulo">Calculadora de notas</h1>
        <form class="formulario" method="post" action="">
            <label for="nombre">Nombre del estudiante</label><br>
            <input type="text" id="nombre" name="nombre"><br>
            <label for="nota1">Nota 1</label><br>
            <input type="text" id="nota1" name="nota1" required><br>
            <label for="nota2">Nota 2</label><br>
            <input type="text" id="nota2" name="nota2" required><br>
            <label for="nota3">Nota 3</label><br>
            <input type="text" id="nota3" name="nota3" required><br>
            <button type="submit"  name="calcular" value="Calcular">Enviar</button>
        </form>
        <?php
        if(isset($_POST['calcular'])){   
            $nota1 = $_POST['nota1'];
            $nota2 = $_POST['nota2'];
            $nota3 = $_POST['nota3'];
            $nombre = $_POST['nombre'];
            echo "<h2 class='nombre-estudiante'> Hola ".$nombre."!</h2>";
            // Validamos que las notas sean numeros
            if(!is_numeric($nota1) || !is_numeric($nota2) || !is_numeric($nota3)){
                echo "<p class='mensaje-error';'>Error: Las notas deben ser numeros.</p>";
                exit;
            }
            $nota_definitiva = ($nota1 * 0.3) + ($nota2 * 0.3) + ($nota3 * 0.4);
            echo "<p class='nota-definitiva'>La nota definitiva es: ".round($nota_definitiva, 2)."</p>";
        }
        ?>
    </div>
</body>
</html>
