<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Petback</title>
    <link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="css/login4.css" media="screen" />
    <link rel="stylesheet" href="css/efeitoFade.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://kit.fontawesome.com/d3d2efc2cc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body class="color">

  <c:import url="include/menu.jsp?nome=${nome }"></c:import>

	<c:if test="${not empty mensagem}">
		<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width:  30%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${mensagem }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
    </c:if>

	<c:if test="${not empty sair}">
	    	<div class="alert alert-success alert-dismissible fade show" role="alert" style="width:  40%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${sair }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
	
	<c:if test="${not empty sucessoDeleteConta }">
	    	<div class="alert alert-success alert-dismissible fade show" role="alert" style="width:  50%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${sucessoDeleteConta }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
	    
	    <c:if test="${not empty msgSenha }">
	    	<div class="alert alert-success alert-dismissible fade show" role="alert" style="width:  30%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${msgSenha }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
	    
	    
	    
	    
	     <!--Controler de informação da conta deletada p/ o cliente-->

    <main style="margin-top:2rem">
        <section class="conteiner">
            <div class="form">
                <div>
                    <form action="controller.do" method="post">
                        <h1>Acesse sua conta</h1>
                        <br>
                        <label>Email *</label><br>
                        <input type="email" name="email" placeholder="Digite seu Email" id="input" value="${ usuario}" required>
                        <br>
                        <br>
                        <label>Senha *</label><br>
                        <input type="password" name="senha" placeholder="Digite sua senha" id="input" value="${ senha}"required><br><br><br>
                        <input type="submit" value="Entrar" id="submit"class="btn" name="command">
                    </form>
                    <br>
                    <hr>
                    <br>
                    <div class="link">
                        <ul>
                            <li id="cadastrar"><a href="cadastro.jsp">Cadastrar</a></li>
                            <li><a href="esqueciSenha.jsp">Esqueci a senha</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="info">
                <div>
                    <h1>Criar uma conta é rápido, fácil e gratuito</h1>
                    <p>Com a sua conta da PetBack você tem acesso
                        a Ofertas exclusivas, descontos, pode criar
                        e gerenciar a sua Assinatura PetBack, acompanhar
                        os seus pedidos e muito mais!</p>
                    <a href="cadastro.jsp" class="btn" id="butn">Criar minha conta</a>
                    <img src="img_Login/dog.png" alt="cachorro" width="350px">
                </div>
            </div>
        </section>
    </main>

	<!-- Import Footer -->
	<c:import url="include/footer.jsp"></c:import>
	<!-- Import Footer -->
</body>
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout(function(){
			$(".alert").alert('close');
		}, 10000);
	});
	
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
</script>
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