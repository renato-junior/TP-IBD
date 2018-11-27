<html>

<head>
	<meta charset="UTF-8">
	<title>WebIBD</title>
	<link rel="stylesheet" type="text/css" href="css/global.css?version=1">
	<link rel="stylesheet" type="text/css" href="css/fonts.css?version=1">
</head>

<body>

    <div id="capaTitulo">
			<h1 id="titulo">
					GAME STATION JSP
			</h1>
    </div>

    <div id="cab">
			<span class="cabCell"><buttom onclick="nextPage('index');" class="cabCellText">Home</buttom></span>
			<span class="cabCell"><buttom onclick="nextPage('jogos');" class="cabCellText">Jogos</buttom></span>
			<span class="cabCell"><buttom onclick="nextPage('categorias');" class="cabCellText">Categorias</buttom></span>
			<span class="cabCell"><buttom onclick="nextPage('contato');" class="cabCellText">Contato</buttom></span>
    </div>

	<div class="pageInfo">
		<p> CONTATO </p>

		
		<span id="testTarget" ></span>
	</div>

</body>


</html>

<script src="scripts/script.js"></script>
<script src="scripts/nextPage.js"></script>