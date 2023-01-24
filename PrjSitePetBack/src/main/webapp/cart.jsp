<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="model.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
<title>Pet Shop: PetBack, o maior Pet Shop da América latina</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/cart.css"
	media="screen" />
<link rel="stylesheet" href="css/efeitoFade.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<script src="https://kit.fontawesome.com/d3d2efc2cc.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>

	<c:import url="include/menu.jsp?nome=${Nome }"></c:import>

	<c:if test="${not empty sucessoCompra }">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" style="width: 30%; float: right; margin: 10px 20px"
			id="FadeIn">
			<span><c:out value="${sucessoCompra }" /></span>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<!--Controler de informação da finalização da compra p/ o cliente-->
	<main>

		<div class="conteiner" id="carrinho">
			<div class="conteiner">
				<form action="controller.do" method="get">
					<div class="content" style="padding: 15px">


						<div class="mb-4 mt-4 mr-4" style="background: white">
							<h5 class="d-flex justify-content"
								style="text-transform: capitalize; font-size: 28px; color: #464747; font-weight: 400">Carrinho</h5>
						</div>

						<table class="table table-hover" style="text-align: center">
							<thead>
								<tr>
									<th scope="col">ID Produto</th>
									<th scope="col">Produto</th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col">Imagem Produto</th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col">Preço</th>
									<th scope="col">Quantidade</th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col">Cancelar</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="li" items="${carrinho }">

									<tr>

										<td scope="row">${li.idProd }</td>
										<td>${li.nome }</td>
										<td></td>
										<td></td>
										<td><img alt="Foto de ${li.nome }"
											src="ImgsProd/${li.imageProd }.png" width="100px"></td>
										<td></td>
										<td></td>
										<td><fmt:setLocale value="pt-BR" /> <fmt:formatNumber
												value="${li.preco*li.qtd}" minFractionDigits="2"
												type="currency" /></td>
										<td>
											<div class="dropdown">
												<button class="btn dropdown-toggle" type="button"
													id="dropdownMenuButton" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false">
													${li.qtd }</button>

												<div class="dropdown-menu"
													aria-labelledby="dropdownMenuButton">
													<c:forEach var="i" begin="1" end="${li.qtdProd }" step="1">

														<a class="dropdown-item"
															href="controller.do?command=Quantidade&Quantidade=${i}&id=${li.id}&idProd=${li.idProd}"><c:out
																value="${i }"></c:out></a>

													</c:forEach>
												</div>
											</div>
										</td>
										<td></td>
										<td></td>
										<td></td>

										<td>
											<form action="controller.do" method="post">
												<input type="hidden" value="${li.qtd }" name="Quantidade">
												<input type="hidden" value="${li.idProd}" name="idProduto" />
												<input type="hidden" value="${li.idCliente}"
													name="idCliente" />
												<button class="btn btn" type="submit"
													value="ExcluirProdutoTemp" name="command">&times;</button>
											</form>
										</td>

									</tr>

								</c:forEach>


							</tbody>
						</table>
						<c:if test="${empty carrinho }">
							<h3
								style="font-size: 35px; margin: 1rem auto; font-family: Arial; color: black; text-align: center;">
								<br> Não há produtos em seu carrinho!!
							</h3>

						</c:if>


						<div class="container-fluid">
							<%
					 ArrayList<Temp> listaPed = (ArrayList<Temp>)request.getSession().getAttribute("carrinho");
						PedidoDao pd = new PedidoDao();
						double sum = pd.getTotalCartPreco(listaPed);
					%>


							<div class="media p-3">
								<c:set var="salary" scope="session" value="<%=sum %>" />

								<div class="media-body">
									<h5 class="mt-2"
										style="display: inline-block; font-family: 'Inter', serif">Valor
										Total da compra:</h5>
									<p class="text mt-1"
										style="display: block; font-size: 42px; text-transform: capitalize; font-weight: bold; font-family: 'Inter', serif; color: gray">
										<fmt:setLocale value="pt-BR" />
										<fmt:formatNumber value="${salary}" minFractionDigits="2"
											type="currency" />
									</p>
								</div>

								<div class="float-right">
									<%
									Cliente cl = (Cliente) request.getSession().getAttribute("Dados");
								
									ClienteDao CD = new ClienteDao();
									
									Cliente cli = CD.getCliente(cl);
								
									String pagamento = cli.getPagamento();
									
								
								%>

									<c:set var="pagamento" scope="session" value="<%=pagamento %>"></c:set>


									<c:if test="${empty carrinho }">
										<span class="d-inline-block" tabindex="0"
											data-toggle="tooltip" title="Indisponível">
											<button style="pointer-events: none" type="submit" name="command" value="ConfirmarCompra"
												class="btn btn-success mt-3" disabled>Confirmar
												Compra</button>
										</span>
									</c:if>

									<c:if test="${not empty carrinho }">

										<c:if test="${not empty pagamento && pagamento != null}">
											<button type="submit" name="command" value="ConfirmarCompra"
												class="btn btn-success mt-3">Confirmar Compra</button>
										</c:if>

										<c:if test="${empty pagamento && pagamento == null}">
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-success mt-3"
												data-toggle="modal" data-target="#exampleModalCenter">
												Confirmar Compra</button>

											<!-- Modal -->
											<div class="modal fade" id="exampleModalCenter" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalCenterTitle"
												aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header" style="width: 100%">
															<h5 class="modal-title" id="exampleModalLongTitle"
																style="margin-left: 9rem">Forma de pagamento</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">


															<div class="form-row align-items-center">
																<div class="col-auto my-1">
																	<label class="mr-sm-2 sr-only"
																		for="inlineFormCustomSelect">Preferência</label> <select
																		class="custom-select mr-sm-2"
																		id="inlineFormCustomSelect" name="cartao" required>
																		<option selected disabled value="">Escolher...</option>
																		<option value="1">Cartão de Crédito</option>
																		<option value="2">Cartão de Débito</option>

																	</select>
																</div>

																<div class="col-auto my-1">
																	<div class="form-group">
																		<br> <input min="0" type="number"
																			class="form-control" id="exampleInputEmail1"
																			name="Ncartao" aria-describedby="emailHelp"
																			placeholder="Nº do cartão" required> <small
																			id="emailHelp" class="form-text text-muted">Nunca
																			vamos compartilhar seu cartão com ninguém.</small>
																	</div>
																</div>
															</div>




														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Close</button>
															<button type="submit" class="btn btn-primary"
																name="command" value="CadastrarCartao">Save
																changes</button>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</c:if>

								</div>
				</form>
			</div>


		</div>

		</div>
		</div>
		</div>

	</main>

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
		}, 10000);	
	});
	
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
	})
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
</html>