<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
    <title>Pet Shop: PetBack, o maior Pet Shop da América latina</title>
    <link rel="stylesheet" type="text/css" href="css/conta5.css" media="screen" />
    <link rel="stylesheet" href="css/efeitoFade.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://kit.fontawesome.com/d3d2efc2cc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>
	
	<c:import url="include/menu.jsp?nome=${Nome }"></c:import>

	<c:if test="${not empty sucesso }">
	    	<div class="alert alert-success alert-dismissible fade show" role="alert" style="width:  30%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${sucesso }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
		<!--Controler de informação da alteração do email/nome p/ o cliente-->

	<c:if test="${not empty erro }">
	    	<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width:  30%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${erro }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
	    <!--Controler de informação do email/imagem já em uso p/ o cliente -->

    <main>
        <div class="conteudo">
            
                <div class="subMenu">
                    <div class="perfil">
                        <div class="imagem">
                            <div class="foto">
                            	<c:if test="${Image == null}">
                            		<img src="img_Perfil/img.png" alt="Imagem sem foto" id="fot">
                            	</c:if>
                            	<c:if test="${Image != null}">
                                	<img src="img_PerfilF/${Image}.png" alt="Imagem de ${Image }" id="fot">
                                </c:if>
                            </div>
                        </div>
                        <div class="info">
                            <div class="nome">
                            	<h1>
                            		${Nome }
                            	</h1>
                            </div>
                            <div class="email">
	                            <h2>${Email }</h2>
                            </div>
                        </div>
                    </div>




                    <div class="list-group">
                        <div class="botao" id="conta">
                            <img src="img_Perfil/Icone_Perfil.png" class="item" id="icone">
                            <a class="btn btn-primary" href="conta.jsp" id="btnConta">
                                Sua conta
                            </a>

                        </div>
                        
                        <div class="botao" id="seguranca">
                            <img src="img_Perfil/Icone_Seguranca.png" class="item" id="icone2">
                            <a class="btn btn-primary" href="seguranca.jsp" id="btnSeguranca">
                                Login e segurança
                            </a>

                        </div>

                        <div class="botao" id="historico">
                            <img src="img_Perfil/Icone_Carrinho.png" class="item" id="icone3">
                            <a class="btn btn-primary" href="historico.jsp" id="btnHistorico">
                                Histórico de compra
                            </a>

                        </div>
                      </div>

                </div>

                <div class="janela">
                    <div class="cont">
                        <div class="ft">
                            <h1>Foto de perfil</h1>
                            <div class="img">
                                <c:if test="${Image == null}">
                            		<img src="img_Perfil/img.png" alt="Imagem sem foto" id="fot">
                            	</c:if>
                            	<c:if test="${Image != null}">
                                	<img src="img_PerfilF/${Image}.png" alt="Imagem de ${Image }" id="fot">
                                </c:if>
                            </div>
                            
                            <a class="btn btn-primary" id="pet" target="_parent" data-toggle="modal" data-target="#ModalFoto">Editar</a>
        <!-- Modal Alterar foto-->
        <form action="controller.do" method="post">
			<div class="modal fade" id="ModalFoto" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
  				<div class="modal-dialog modal-dialog-centered" role="document">
    				<div class="modal-content">
      					<div class="modal-header" style="width: 100%">
        					<h5 class="modal-title" id="TituloModalCentralizado" style="margin-left:6rem">Selecione a nova foto de perfil:</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          					<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      		<div style="width:90%; height:100px; display:flex; margin-top:15px; margin-bottom:15px">
    			<div style="flex:1; text-align:center">
	    			<img src="img_PerfilF/cachorro.png" width="90%">
	    			<div style="width:100%; height:20px">
					<input type="radio" name="foto" id="inlineRadio1" value="cachorro" required>
	    			</div>
	    		</div>
    			<div style="flex:1; text-align:center">
	    			<img src="img_PerfilF/gato.png" width="90%">
	    			<div style="width:100%;height:20px">
					<input type="radio" name="foto" id="inlineRadio2" value="gato" required>
	    			</div>
	    		</div>
    			<div style="flex:1; text-align:center">
	    			<img src="img_PerfilF/passaro.png" width="90%">
	    			<div style="width:100%; height:20px">
					<input type="radio" name="foto" id="inlineRadio3" value="passaro" required>
	    			</div>
	    		</div>
    			<div style="flex:1; text-align:center">
	    			<img src="img_PerfilF/peixe.png" width="90%">
	    			<div style="width:100%; height:20px">
					<input type="radio" name="foto" id="inlineRadio4" value="peixe" required>
	    			</div>
	    		</div>
    			<div style="flex:1; text-align:center">
	    			<img src="img_PerfilF/hamster.png" width="90%">
	    			<div style="width:100%; height:20px">
	    			<input type="radio" name="foto" id="inlineRadio5" value="hamster" required>
	    			</div>
	    		</div>
    		</div>
      					
      					<div class="modal-footer">
	        				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        					<button type="submit" class="btn btn-primary" name="command" value="AlterarFotoPerfil">Salvar</button>
      					</div>
    				</div>
  				</div>
			</div>               
        </form>
                        </div>
                        <div class="nomeJanela">
                            <a class="btn btn-primary" id="pet" target="_parent" data-toggle="modal" data-target="#ModalNome">Editar</a>
                            <h1>Nome</h1>
                           	<h2>${Nome }</h2>
                        </div>
        <!-- Modal Alterar nome-->
        <form action="controller.do" method="post">
			<div class="modal fade" id="ModalNome" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
  				<div class="modal-dialog modal-dialog-centered" role="document">
    				<div class="modal-content">
      					<div class="modal-header" style="width: 100%">
        					<h5 class="modal-title" id="TituloModalCentralizado" style="margin-left:8.2rem">Informe o novo nome:</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          					<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<div class="modal-body">
	        				<input maxlength="50" type="text" class="form-control" id="recipient-name" placeholder="Digite seu nome" name="nomeCli" required>
      					</div>
      					<div class="modal-footer">
	        				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        					<button type="submit" class="btn btn-primary" name="command" value="AlterarNome">Salvar</button>
      					</div>
    				</div>
  				</div>
			</div>               
        </form>
                        
                        <div class="emailJanela">
                            <a class="btn btn-primary" id="pet" target="_parent" data-toggle="modal" data-target="#ModalEmail">Editar</a>
                            <h1>Endereço de Email</h1>
                            <h2>${Email }</h2>
                        </div>
        <!-- Modal Alterar email-->
        <form action="controller.do" method="post">
			<div class="modal fade" id="ModalEmail" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
  				<div class="modal-dialog modal-dialog-centered" role="document">
    				<div class="modal-content">
      					<div class="modal-header" style="width: 100%">
        					<h5 class="modal-title" id="TituloModalCentralizado" style="margin-left:8rem">Informe o novo email:</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          					<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<div class="modal-body">
	        				<input maxlength="50" type="email" class="form-control" id="recipient-name" placeholder="Digite seu Email" name="email" required>
      					</div>
      					<div class="modal-footer">
	        				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        					<button type="submit" class="btn btn-primary" name="command" value="AlterarEmail">Salvar</button>
      					</div>
    				</div>
  				</div>
			</div>               
        </form>
                    </div>
                </div>


        </div>
	
    </main>
    
    <c:import url="include/footer.jsp"></c:import>
    
</body>
<style>
    div.subMenu h1{
        font-size: 25px;
        color:black;
    }
    div.subMenu h2{
        font-size: 20px;
        color:gray;
    }

    div.janela h1{
        font-size: 20px;
        color:black;
        font-weight:500;
    }
    div.janela h2{
        font-size: 20px;
        color:#474747;
        font-weight:400;
    }
    
    </style>
    <script>
        const inputFile = document.querySelector("#picture__input");
            const pictureImage = document.querySelector(".picture__image");
            const pictureImageTxt = "";
            pictureImage.innerHTML = pictureImageTxt;
            
            inputFile.addEventListener("change", function (e) {
              const inputTarget = e.target;
              const file = inputTarget.files[0];
            
              if (file) {
                const reader = new FileReader();
            
                reader.addEventListener("load", function (e) {
                  const readerTarget = e.target;
            
                  const img = document.createElement("img");
                  img.src = readerTarget.result;
                  img.classList.add("picture__img");
            
                  pictureImage.innerHTML = "";
                  pictureImage.appendChild(img);
                });
            
                reader.readAsDataURL(file);
              } else {
                pictureImage.innerHTML = pictureImageTxt;
              }
            });
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>