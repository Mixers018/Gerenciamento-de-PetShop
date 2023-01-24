<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="dao.ProdutoDao" %>
<%@ page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.DecimalFormatSymbols" %>
<%
	String Search = request.getParameter("Search");
%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
    <title>Pet Shop: PetBack, o maior Pet Shop da América latina</title>
    <link rel="stylesheet" href="css/produto4.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/d3d2efc2cc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
</head>
<body>
	    <!--Links-->
	    <c:import url="include/menu.jsp"></c:import>
	    <nav class=" navbar-expand-lg navbar-light" style="background-color: #fbbd44">
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item active">
		        <a class="nav-link" href="controller.do?command=GetCategoria&idCategoria=1" style="color:white; font-weight:bold">Cachorro <input type="hidden" value="AddPedido" name="command"></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="controller.do?command=GetCategoria&idCategoria=2" style="color:white; font-weight:bold">Gato</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="controller.do?command=GetCategoria&idCategoria=3" tabindex="-1" style="color:white; font-weight:bold">Pássaro</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="controller.do?command=GetCategoria&idCategoria=4" tabindex="-1" style="color:white; font-weight:bold">Peixe</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="controller.do?command=GetCategoria&idCategoria=5" tabindex="-1" style="color:white; font-weight:bold">Hamster</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="controller.do?command=GetCategoria&idCategoria=6" tabindex="-1" style="color:white; font-weight:bold">Todos os produtos</a>
		      </li>
		    </ul>
		    
		    
		    
	    <form class="form-inline my-lg-0" action="controller.do?command=GetCategoria&idCategoria=6" method="post">
		    <%
		    	if(Search == null){
		    %>
			    	<input class="form-control mr-sm-5" type="search" placeholder="Procure aqui!" aria-label="Search" name="Search">
		    <%	
		    	}else {
		    %>
		    		<c:set var="pesquisa" scope="session" value="<%=Search%>"></c:set>
		    		<input class="form-control mr-sm-5" type="search" placeholder="Procure aqui!" aria-label="Search" name="Search" value="${pesquisa }">
		    		
		    <%
		    	}
		    %>
	    </form>
		    
		  </div>
		</nav>
		
	    <!--Controler de informação do carrinho p/ o cliente-->
	    
	     <c:if test="${not empty msg }">
	    	<div class="alert alert-success alert-dismissible fade show" role="alert" style="width:  30%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${msg }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
	    
	    
	    <c:if test="${not empty sucesso }">
	    	<div class="alert alert-success alert-dismissible fade show" role="alert" style="width:  30%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${sucesso }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
	    
	    <c:if test="${not empty erro }">
	    	<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width:  30%; float: right; margin: 10px 20px" id="FadeIn">
			 <span><c:out value="${erro }"/></span>
			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	    </c:if>
	     <!--Controler de informação do carrinho p/ o cliente-->
	    

	    <main>
	    
	    
	    <c:if test="${not empty pesquisa && not empty Cate }">
		
			<section class="m-5 p-2"  >
					<h4 style="color: blue; text-transform: uppercase;">Resultados para "<c:out value="${pesquisa }"></c:out>"</h4>
			
			
		    		<c:forEach var="cate" items="${Cate}">
		    			
		    				<h4 class="display-4">${cate.nome }</h4><br>
			    			<p class="lead">${cate.descricao }</p>
		    			
		    		</c:forEach>
		    	</section>
			
		</c:if>
	    
	    
		
		<c:if test="${empty pesquisa && not empty Cate }">
		    	<section>
		    		<c:forEach var="cate" items="${Cate}">
		    			
		    				<h4 class="display-4" id="h4">${cate.nome }</h4><br>
			    			<p class="lead" id="p">${cate.descricao }</p>
			    			</main>
			    			
			    			<section class="MaisComprados shadow mb-5 bg-white rounded d-flex justify-content-center">
				    			<div id="prodMaisComp">
				    	
				    				<c:forEach var="pd" items="${favoritos }">
				    				
				    				
				    					
				    					 <div id="prodMais" class="card Mais">
										    <img class="img mt-2" src="ImgsProd/${pd.imageProd }.png" height="120px" alt="Foto de ${pd.nome }">
										    <div class="card-body">
										      <h5 class="card-title" style="color:#464747">${pd.nome }</h5>
										
										      <small id="emailHelp" class="form-text text-muted m-2">Ano de fabricação:<br>
										      	<span class="badge badge-light"><fmt:formatDate pattern="dd/MM/yyyy" value="${pd.fabricacao}" /></span>
										      	<br><hr><br>Quantidade disponível: <span><c:out value="${pd.quantidade }"></c:out></span>
										      </small>
										    </div>
										    <c:if test="${not empty Nome}">
										    	<c:if test="${pd.quantidade != 0}">
										    		<form action="controller.do?command=AddPedido" method="post">
											  			<input class="form-check-input" type="hidden" name="idCliente" id="inlineRadio3" value="${Dados.id }">											  		
														<input class="form-check-input" type="hidden" name="idProd" id="inlineRadio3" value="${pd.id }">
														<input class="form-check-input" type="hidden" name="idCategoria" id="inlineRadio3" value="6">
														<button class="btn btn-success" type="submit" value="AddPedido" name="command">Add carrinho</button>
											 		</form>
											 	</c:if>
											 	
											 	<c:if test="${pd.quantidade == 0 }">
											 		<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Produto indisponível no momento">
											  			<button class="btn btn-danger" style="pointer-events: none" type="button" disabled>Indisponível</button>
													</span>	
											 	</c:if>
										   </c:if>
										   <c:if test="${empty Nome }">
									            <c:if test="${pd.quantidade != 0 }">
									       			<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Faça login para continuar">
														<button class="btn btn-success" style="pointer-events: none" type="button" disabled>Add carrinho</button>
													</span>
												</c:if>
												<c:if test="${pd.quantidade == 0 }">
													<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Faça login para continuar. Produto indisponível no momento">
											  			<button class="btn btn-danger" style="pointer-events: none" type="button" disabled>Indisponível</button>
													</span>	
												</c:if>
									      </c:if>
										  </div>
										  
				    				</c:forEach>							  			  
								</div>
				    	</section>
			    			<main>
		    			
		    		</c:forEach>
		    	</section>
		</c:if>
		
		
	    
	    </main>
	  
	    	
	    	
	    
	    
	    
	    <main>
	    <h3 class="m-5">Nossos Produtos</h3>
	    	<div class="row p-3 mt-5">
	    	
	    
	    	<c:forEach var="li" items="${listaProd}">
	    		<div class="col-4" id="prod">
							  	<div  class="card normi p-3" id="prodTds" style="border-radius: 10px; color:black;">

								    <img class="img mt-2" src="ImgsProd/${li.imageProd }.png" height="120px" alt="Foto de ${li.nome }">

								    <div class="card-body">
								      <h5 class="card-title" style="color:#464747">${li.nome }</h5>
										
										<small id="emailHelp" class="form-text text-muted m-2"><c:out value="${li.descricao }"/></small>
								      
								      
								      <small id="emailHelp" class="form-text text-muted m-2">Ano de fabricação:<br>
								      	<span class="badge badge-light"><fmt:formatDate pattern="dd/MM/yyyy" value="${li.fabricacao}" /></span>
								      	<br><hr><br>Quantidade disponível: <span><c:out value="${li.quantidade }"></c:out></span>
								      </small>
								      
								      
								      <h3>
								      	<strong style="font-size: 28px; display: inline;color: #46aceb; width:100%; font-weight:100;">
								      	
								      	<!-- CODIGO PARA FORMATAÇÃO DINHEIRO -->
								      	
								      		<fmt:setLocale value="pt-BR" />
											<fmt:formatNumber value="${li.preco}" minFractionDigits="2" type="currency" />
								    	</strong>
								      </h3>

								    </div>
								    <div class="card-body">
									    <c:if test="${Nome != null }">
									    	<c:if test="${li.quantidade != 0}">
										    	<form action="controller.do" method="post">
											  		<button class="btn btn-success" type="submit" value="AddPedido" name="command">Add carrinho</button>
													<input class="form-check-input" type="hidden" name="idCliente" id="inlineRadio3" value="${Dados.id }">											  		
												 	<input class="form-check-input" type="hidden" name="idProd" id="inlineRadio3" value="${li.id }">
												 	<input class="form-check-input" type="hidden" name="idCategoria" id="inlineRadio3" value="${li.idCategoria }">
												</form>
											</c:if>
											<c:if test="${li.quantidade == 0 }">
										 		<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Produto indisponível no momento">
											  		<button class="btn btn-danger" style="pointer-events: none" type="button" disabled>Indisponível</button>
												</span>	
											</c:if>
									    </c:if>
									    <c:if test="${Nome == null }">
									    	<c:if test="${li.quantidade != 0}">
									    		<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Faça login para continuar">
												  	<button class="btn btn-success" style="pointer-events: none" type="submit" disabled>Add carrinho</button>
												</span>
											</c:if>
											
											<c:if test="${li.quantidade == 0 }">
										 		<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Faça login para continuar. Produto indisponível no momento">
											  		<button class="btn btn-danger" style="pointer-events: none" type="button" disabled>Indisponível</button>
												</span>	
											</c:if>
									    </c:if>
									</div>
							  	</div>
						  	</div>
	    	</c:forEach>				
    	</div>
	    </main>
	
	
	<c:import url="include/footer.jsp"></c:import>
	
</body>

<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
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
</html>