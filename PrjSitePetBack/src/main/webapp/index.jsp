<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
    <title>Pet Shop: PetBack, o maior Pet Shop da América latina</title>
    <link rel="stylesheet" type="text/css" href="css/index6.css" media="screen" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://kit.fontawesome.com/d3d2efc2cc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>
	<c:import url="include/menu.jsp?nome=${Nome }"></c:import>
	
	<c:if test="${not empty message }">
		<div class="alert alert-success alert-dismissible fade show" role="alert" style="width: 50%; float: right; margin: 10px 20px" id="FadeIn">
			<span><c:out value="${message }"/></span>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<br>
	</c:if>
	
    <main>
        <!--Banner - Sobre-->
        <figure>
            <section class="banner">
                <img alt="Banner" src="Img-banner/img.png" id="Image1">

                <div class=txtBanner>
                    <h3>Quem Somos?</h3>
                    <p>Somos apaixonados por pets! Essa não é apenas uma expressão inserida em nossa missão como empresa, mas uma 
                        realidade vivenciada todos os dias em nossas atitudes, 
                        nas lojas e em todos os nossos pontos de contato.</p>
                </div>
            </section>
        </figure>
        <!--Banner - Sobre-->



        <!--Mais Área sobre-->
        <section class="mais_sobre" data-aos="fade-up">
            <div>
                <h3>Os melhores cuidados para seu PARCEIRO DE VIDA</h3>
                <br />
                <p>Só quem é apaixonado por anima
                    is sabe: a relação de amor e cumplicidade que temos 
                    com nossos bichinhos de estimação é um vín
                    culo único! </p>
            </div>
        </section>
        <!--Mais Área sobre-->
        


        <!--Banner - Serviços-->
        <figure data-aos="fade-right">
            <section class="banner2">
                <img alt="Banner2" id="Image2" src="Img-banner/Img2.png">

                <div class=txtBanner2>
                    <h3>Serviços</h3>
                    <p>Somos especializados no tratamento do seu Pet, oferecendo também, uma gama de produtos para o seu cuidado.</p>
                </div>
            </section>
        </figure>
        <!--Banner - Serviços-->


        <!--Área de MSG com o Usuário-->
        <section class="area_usuario" id="Area_Contato" data-aos="fade-up">
            <div class="area_Msg">
                <div>
                    <h3>Alguma Pergunta?</h3>
                    <h4>Conte-nos sobre!</h4>
                </div>

                <div>
                    <div>
                        <form action="controller.do" method="post">							
                            <label ID="Label1" for="txtAssunto">Assunto *</label>
                        	<br />
                            <input id="txtAssunto" name="_subject" type="text" placeholder="Sugestões, reclamações e dúvidas" required/><br /><br />
							<c:if test="${empty Dados.id}">
								<label ID="Label3" for="txtEmail">Email *</label>
							<br />
	                            <input id="txtEmail" name="email" type="email" placeholder="contato@gmail.com" value=""/><br /><br />	
							</c:if>
							
							<c:if test="${not empty Dados.id}">
								<label ID="Label3" for="txtEmail">Email *</label>
								<br />
	                            <input id="txtEmail" name="email" type="email" placeholder="contato@gmail.com" value="${Dados.email }"/><br /><br />	
							</c:if>
                            
                            <label ID="Label2">Mensagem *</label><br />
                            <textarea id="txtMsg" name="message" cols="90" rows="7" placeholder="Escreva aqui..." style=" resize: none;" required></textarea>
							<br /><br />
							
                            <c:if test="${not empty Dados.nome}">
								<button type="submit" class="btn btn-outline-primary" id="btnEnviar" value="Contato" name="command">Enviar</button>
					        </c:if>        
					        <c:if test="${empty Dados.nome}">
					        	<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Faça login para continuar">
									<button id="btnEnviar" class="btn btn-primary" style="pointer-events: none;" type="button" disabled>Agendar</button>
								</span>
					        </c:if>
						</form>
                    </div>
                    <div></div>
                </div>
            </div>

            <div class="dados">
                <div>
                    <h3>Endereço</h3>
                    <br />
                    <p>
                        Rua do Pé Torto, 666<br />
                        São Paulo, SP - Brasil
                    </p>
                </div>


                <div>
                    <h3>Contato</h3>
                    <br />
                    <p>
                        +55 (11) 4002-8969<br />
                        contato@gmail.com
                    </p>
                </div>
            </div>
        </section>

    </main>
    <!--Fim Conteúdo da página-->


	<c:import url="include/footer.jsp"></c:import>
    


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
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout(function(){
			$(".alert").alert('close');
		}, 15500);	
	});
	
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
	})
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>