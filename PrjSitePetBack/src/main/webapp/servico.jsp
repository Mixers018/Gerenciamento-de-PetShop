<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.ServicoDao" %>
<%@ page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.DecimalFormatSymbols" %>
<%
    ServicoDao sd = new ServicoDao();
    List<Servico> ser = sd.getAllServico() ;
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta http-equiv="Content-Type" content="text/html; charse=UTF-8">
	<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
    <title>PetBack - serviços</title>
    <link rel="stylesheet" type="text/css" href="css/servico5.css" media="screen" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://kit.fontawesome.com/d3d2efc2cc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body class="cor">

   <c:import url="include/menu.jsp?nome=${nome }"></c:import>

    <main>
    	        <div class="row">
    
    	<%
    		if(!ser.isEmpty()){
    			for(Servico s:ser){%>       		
    	        		<div class="servico card-body shadow p-5 mb-5 bg-white" style="background-image: url ;margin: 0 20px">
				            <div class="tipoServico">
				                <h3 class="card-title" style="font-family: 'Inter', sans-serif; text-transform: uppercase; "><%= s.getNome() %></h3>
				            </div>
				            <div class="descrServico m-3">
				                <p class="card-text ml" style="font-size: 20px; font-family: var(--FontDisc);"><%= s.getDescricao() %></p>
				            </div>
				            <div class="precoServico">
				                <h3 class="price">
				                <strong style="font-size: 28px; display: inline;color: #343A40; width:100%; font-weight:100;">R$ 
				                <%
				                	String padrao = "###,##0.00";
				                	DecimalFormat df = new DecimalFormat(padrao);
				                	DecimalFormatSymbols dfs = new DecimalFormatSymbols(new Locale("pt", "Brazil"));
				                	dfs.setDecimalSeparator(',');
				                	dfs.setGroupingSeparator('.');
				                	df = new DecimalFormat(padrao, dfs);
				                	
				                	String preco = df.format(s.getPreco());
								%> 
								
								<%= preco %>
								</strong>
				                </h3>
				            </div>
				            	<div class="btnAgendar">
					                <c:if test="${not empty Dados.nome}">
					                	<a class="btn btn-primary" id="agendar" href="controller.do?command=MostrarDetalhesServico&ID=<%= s.getId()%>">Agendar</a>
					                </c:if>
					                
					                <c:if test="${empty Dados.nome}">
					                	<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Faça Login para continuar">
										  <button id="agendar" class="btn btn-primary" style="pointer-events: none;" type="button" disabled>Agendar</button>
										</span>
					                </c:if>
				                    
				                </div>
				                <div class="avaliacao">
				                    <div class="texto">
				                        <h3 class="card-title">Avaliação</h3>
				                    </div>
				                    <div class="icones">
				                    <ul class="patinhas">
				                        <li class="star-icon" data-avaliacao="1"></li>
				                        <li class="star-icon" data-avaliacao="2"></li>
				                        <li class="star-icon ativo" data-avaliacao="3"></li>
				                        <li class="star-icon" data-avaliacao="4"></li>
				                        <li class="star-icon" data-avaliacao="5"></li>
				                    </ul>
				                    </div>
				                </div>
				        </div>
    	        	
    			<%}
    		}
    	
    	%>
    	        </div>
    </main>


  <!-- Import Footer -->
	<c:import url="include/footer.jsp"></c:import>
	<!-- Import Footer -->
    <script>
              
              $(function () {
            	  $('[data-toggle="tooltip"]').tooltip()
            	});
    </script>

</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>