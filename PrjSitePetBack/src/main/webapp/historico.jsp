<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
    <title>Pet Shop: PetBack, o maior Pet Shop da América latina</title>
    <link rel="stylesheet" type="text/css" href="css/historico3.css" media="screen" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://kit.fontawesome.com/d3d2efc2cc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />

</head>
<body>

	<c:import url="include/menu.jsp?nome=${Nome }"></c:import>

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
                    <div class="conteiner" id="carrinho">
                        <div class="conteiner">
                        
                            <div class="content">
                                
                                <div class="titulo">
                                    <h1>Histórico de Compras</h1>
                                </div>
                                <div id="tabela" style="background-color:white">
                                <table class="table table-hover" style="text-align: center"> 
                                    <thead>
                                        <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Produto</th>
                                        <th scope="col">Quantidade</th>
                                        <th scope="col">Preço</th>
                                        <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                            <c:forEach var="li" items="${historico }">
                                            
                                                <tr>
                                                	<td>${li.ID_Produto }</td>
                                                    <td>${li.nome_Produto }</td>
                                                    <td>${li.quantidade }</td>
                                                    <td>
                                                    	<fmt:setLocale value="pt-BR" />
														<fmt:formatNumber value="${li.preco}" minFractionDigits="2" type="currency" />
                                                    </td>
                                                    <td>
                                                    	<fmt:setLocale value="pt-BR" />
														<fmt:formatNumber value="${li.preco*li.quantidade}" minFractionDigits="2" type="currency" />
                                                    </td>			
                                                </tr>
                                            
                                            </c:forEach>
                                        
                    
                                    </tbody>
                                </table>
                                </div>
            
                            </div>
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