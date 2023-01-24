<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
    <title>Pet Shop: PetBack, o maior Pet Shop da América latina</title>
    <link rel="stylesheet" href="css/seguranca2.css">
    <link rel="stylesheet" href="css/efeitoFade.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
	<!-- CONTROLE DE MSG SE A SENHA FOI ALTERADA COM SUCESSO-->
	    
	    <c:if test="${not empty erro }">
	    	<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width:  30%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${erro }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
	    
	<!-- CONTROLE DE MSG SE A SENHA FOR ALTERADA OU APRESENTAR ALGUM ERRO -->

	<!-- Modal -->
    	<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
        	<div class="modal-dialog" role="document">
            	<div class="modal-content">
                	<div class="modal-header" style="width: 100%">
                		<h5 class="modal-title" id="TituloModalCentralizado" style="margin-left:10.5rem">Excluir conta:</h5>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          				<span aria-hidden="true">&times;</span>
        				</button>
                    </div>
                    <div class="modal-body">
                    	<label for="inputPassword" class="col-form-label" style="margin-top:1rem">Deseja realmente excluir sua conta?</label>
                    </div>
                    <div class="modal-footer">
                    	<form action="controller.do" method="post">
                    		<button type="submit" class="btn btn-primary" name="command" value="ExcluirCliente">Sim</button>
                           	<button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                        </form>
                    </div>
				</dIv>
			</div>
		</div>

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
                            	<h1>${Nome }</h1>
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
                        <div class="senha">
                            <h1>Senha</h1>
                            <h2>É recomendado usar uma senha forte que você não esteja usando em nenhum outro lugar.</h2>
                            <a class="btn btn-primary" data-toggle="modal" data-target="#ModalSenha" data-append-to="body" id="pet">Atualizar senha</a>
                        </div>
                   
        
				        <!-- Modal Alterar senha -->
				        <form action="controller.do">
				        
				       
							<div class="modal fade" id="ModalSenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header" style="width:100%">
				        			<h5 class="modal-title" id="TituloModalCentralizado" style="margin-left:10.2rem">Atualizar senha</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="body">
				          					<label for="inputPassword" class="col-form-label" style="margin-top:1rem">Senha atual:</label>
				        					<input type="password" class="form-control" id="recipient-name" placeholder="Digite a senha atual" required name="senhaAnt" style="margin-bottom:1rem;">
				      					</div>
				      					<div class="modal-body">
				          					<label for="inputPassword" class="col-form-label">Nova senha:</label>
				        					<input minlength="6" maxlength="30" type="password" class="form-control" id="recipient-name" placeholder="Digite a nova senha" required name="senhaN" style="margin-bottom:1rem">
				      					</div>
				      					<div class="modal-body">
					          				<label for="inputPassword" class="col-form-label">Repita a nova senha:</label>
				        					<input minlength="6" maxlength="30" type="password" class="form-control" id="recipient-name" placeholder="Digite a nova senha" required name="rSenhaN" style="margin-bottom:1rem">
				      					</div>
				      					<div class="footer"  style="margin-top:0.5rem; padding-bottom:2rem">
				        					<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				        					<button type="submit" class="btn btn-primary" name="command" value="AlterarSenha">Salvar</button>
				      					</div>
							    </div>
							  </div>
							</div>
						</form>
			
			
			
			
			              
					
                        <div class="conta">
                            <h1>Excluir conta</h1>
                            <h2>Ao excluir a sua conta, você não poderá mais acessar seu histórico de pedidos ou fazer login no PetBack </h2>
                            <a class="btn btn-primary" id="pet" target="_parent" data-toggle="modal" data-target="#delete-modal">Excluir conta</a>
                        </div>
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
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout(function(){
			$(".alert").alert('close');
		}, 5000);	
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