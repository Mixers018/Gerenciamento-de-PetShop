<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
    <title>PetBack - Cadastrar Clientes</title>
    <link rel="stylesheet" type="text/css" href="css/cadastro2.css" media="screen" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://kit.fontawesome.com/d3d2efc2cc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
</head>
<body>
<form action="controller.do" method="post">
	<div>
    	
    </div>
    <!--Links-->
    <c:import url="include/menu.jsp?nome=${nome }"></c:import>
    <!--Links-->
    
    
    <main>
    	<h1>Crie sua conta</h1>
    	<br>
                        <c:if test="${ajuda ==1 || ajuda ==0}">
                        		<span style="color:#f2727f; font-family: 'Bahnschrift Light';margin: 0 auto; font-size:16px" class="alert alert-warning" role="alert">${msg}</span><br>
                        </c:if>
                        <br>
    	<div>
    		<label>Insira seu nome completo *</label><br>
    		<input  maxlength="50" type="text" name="nome" required placeholder="Digite seu nome" id="input" value="${pnome }"><br><br>
    		
    		<label>Insira seu CPF *</label><br>
    		<input  maxlength="11" type="text" name="cpf" required placeholder="Digite seu CPF" id="input" value="${pcpf }"><br><br>
    		
    		<label>Insira seu Email *</label><br>
    		<input  maxlength="50" type="email" name="email" required placeholder="Digite seu Email" id="input" value="${pEmail }"><br><br>
    		
    		<label>Insira seu número de telefone</label><br>
    		<input  maxlength="20" type="text" name="tel" placeholder="Digite seu telefone" id="input" value="${ptel }"><br><br>
    		
    		<label>Insira seu CEP</label><br>
    		<input  maxlength="50" type="text" name="cep" placeholder="Digite seu CEP" id="input" value="${pcep }"><br><br>	
    	</div>
    	<hr>
    	<div>
    		<h1>Configurações</h1>
    		<div class="row">
    			<div>
	    			<label>Insira uma senha *</label><br>
	    			<input minlength="6" maxlength="30" type="password" name="senha" required placeholder="Digite uma senha" id="input">
	    		</div>
	    		<div>
	    			<label>Repita a senha *</label><br>
	    			<input minlength="6" maxlength="30" type="password" name="repitSenha" required placeholder="Digite novamente a senha" id="input">
	    		</div>
    		</div>
    		<br>
    		<br><br><br>
    		<label style="padding-bottom: 1rem"><h1>Selecione uma foto para o seu perfil *</h1></label><br>
    		<div class="form-group row">
    			<div>
	    			<img src="img_PerfilF/cachorro.png" height="100vw">
	    			<div style="width:100%; height:20px; padding-right:7px">
					<input type="radio" name="foto" id="inlineRadio1" value="cachorro" required>
	    			</div>
	    		</div>
    			<div >
	    			<img src="img_PerfilF/gato.png" height="100vw">
	    			<div style="width:100%;height:20px; padding-right:7px">
					<input type="radio" name="foto" id="inlineRadio2" value="gato" required>
	    			</div>
	    		</div>
    			<div>
	    			<img src="img_PerfilF/passaro.png" height="100vw">
	    			<div style="width:100%; height:20px; padding-right:7px">
					<input type="radio" name="foto" id="inlineRadio3" value="passaro" required>
	    			</div>
	    		</div>
    			<div>
	    			<img src="img_PerfilF/peixe.png" height="100vw">
	    			<div style="width:100%; height:20px; padding-right:7px">
					<input type="radio" name="foto" id="inlineRadio4" value="peixe" required>
	    			</div>
	    		</div>
    			<div>
	    			<img src="img_PerfilF/hamster.png" height="100vw">
	    			<div style="width:100%; height:20px; padding-right:7px">
					<input type="radio" name="foto" id="inlineRadio5" value="hamster" required>
	    			</div>
	    		</div>
    		</div>
    	</div>
    	<br>
    	<button type="submit" value="Cadastrar" name="command" class="btn btn-outline-primary">
    		Cadastrar
    	</button>
    	 
    	<br><br>
    </main>
    
  <!-- Import Footer -->
	<c:import url="include/footer.jsp"></c:import>
	<!-- Import Footer -->
</form>
</body>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 1500,
    }
    );

    var btn = document.querySelector("#button");
    button.addEventListener("click", function () {
        var div = document.querySelector("#menu");

        if (div.style.display === "none") {
            div.style.display = "flex";
        } else {
            div.style.display = "none";
        }
    });
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>