<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.DecimalFormatSymbols" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
    <title>Pet Shop: PetBack, o maior Pet Shop da América latina</title>
    <link rel="stylesheet" type="text/css" href="css/mostrarAgendamentos3.css" media="screen" />
    <link rel="stylesheet" href="css/efeitoFade.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://kit.fontawesome.com/d3d2efc2cc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>
	
	<c:import url="include/menu.jsp?nome=${Nome }"></c:import>
	
	<c:if test="${not empty cancelarPedido }">
	    	<div class="alert alert-success alert-dismissible fade show" role="alert" style="width:  40%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${cancelarPedido }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
	     <!--Controler de informação do cancelamento do pedido p/ o cliente-->
	
	<!-- Modal -->
    	<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
        	<div class="modal-dialog" role="document">
            	<div class="modal-content">
                	<div class="modal-header" style="width: 100%">
                		<h5 class="modal-title" id="TituloModalCentralizado" style="margin-left:8rem">Cancelar pedido:</h5>
        				<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          				<span aria-hidden="true">&times;</span>
        				</button>
                    </div>
                    <div class="modal-body">
                    	<label for="inputPassword" class="col-form-label" style="margin-top:1rem">Deseja realmente cancelar o pedido?</label>
                    </div>
                    <div class="modal-footer">
                    	<form action="controller.do" method="post">
                    	    <input type="hidden" name="quantidade" id="quantidade"/>
                    		<input type="hidden" name="idProduto" id="idProduto"/>
                    		<input type="hidden" name="idPedido" id="idPedido"/>
                    		<button type="submit" class="btn btn-primary" name="command" value="ExcluirPedido">Sim</button>
                           	<button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                        </form>
                    </div>
				</dIv>
			</div>
		</div>
	<main>	
		<div class="conteiner" id="carrinho">
			<div class="conteiner">
			
				<div class="content" style="padding: 15px; padding-top: 50px; padding-bottom:70px">
				    
					<div class="mb-4 mt-4 mr-4" style="background:white">
						<h5 class="d-flex justify-content" style=" text-transform: capitalize;font-size: 28px; color:#464747; font-weight: 400; padding-bottom:10px">Seus pedidos</h5>
					</div>
	
                    <div id="tabela">
					<table class="table table-hover" style="text-align: center"> 
						<thead>
							<tr>
								<th scope="col">ID</th>
                                <th scope="col">Produto</th>
                                <th scope="col">Quantidade</th>
                                <th scope="col">Preço</th>
                                <th scope="col">Total</th>
                                <th scope="col">Cancelar</th>
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
                                	<td>
										<button onclick="setaDadosModalProduto('${li.quantidade }','${li.ID_Produto }','${li.ID_Pedido}')" type="button" class="btn btn-outline" data-toggle="modal" data-target="#delete-modal">&times;</button>
									</td>				
                            	</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${empty historico }">
									<h3
										style="font-size: 35px; margin: 1rem auto; font-family: Arial; color: black; text-align: center;"><br>
											Você não tem pedidos!!
										</h3>
								
								</c:if>	
					</div>								
				
				</div>
				
			</div>
			
		</div>
	
	</main>
	
	<c:import url="include/footer.jsp"></c:import>

</body>
<script>
	function setaDadosModalProduto(quantidade,produto,pedido) {
		document.getElementById('quantidade').value = quantidade;
	    document.getElementById('idProduto').value = produto;
	    document.getElementById('idPedido').value = pedido;
	}
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