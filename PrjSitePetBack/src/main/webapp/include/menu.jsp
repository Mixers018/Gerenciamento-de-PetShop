<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
@import url('https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@100&family=League+Gothic&display=swap');

:root {
    --FontTitulo: 'League Gothic', sans-serif;
    --FontTexto: 'Kumbh Sans', sans-serif;
    --corPrima: #5D50E0; /*Azul*/
    --corSec: #FBBD44; /*Amrelo*/
    --corBanner: #8473F7 /*Cor do banner azul*/
}

* {
    margin: 0 auto;
    box-sizing: border-box;
    text-decoration: none;
    padding: 0;
    outline: 0;
    list-style: none
}

.header{
    width: 100%;
    height:70px;
    background-color: var(--corPrima);
   	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;

}

div.barra_pesquisa {
    width: 75%;
    top: 0;
    z-index: 3;
    height: 70px;
    justify-content: space-evenly;
    display: flex;
    align-items: center;
    background-color: var(--corPrima);
    flex-direction: row
}

.logo{
    flex:1;
}

.links{
    flex:1;
}

.nomea{
    flex:1;
    display: flex;
    justify-content: flex-end;
    
}

.parte{
    width:27rem;
}

    div.barra_pesquisa a:hover {
        text-decoration: none
    }

    div.barra_pesquisa h1 {
        font-family: var(--FontTitulo);
        color: white;
        text-transform: uppercase;
        font-size: 32px;
        word-break: break-word;
        overflow-wrap: break-word;
        margin-top: 0.4rem;
    }

ul.nav {
    transition: all .5s;
}

.nav-item a {
    color: white;
    font-family: var(--FontTexto);
    font-size: 1.2rem;
    font-weight: 300;
    padding: 1rem 2rem;
    text-transform: capitalize;
    transition: .2s ease-in;
    
}

    .nav-item a:hover {
        color: white;
        text-shadow: black 0.1em 0.1em 0.2em
    }
    .nav-item a:visited{
    	animation-play-state: paused;
    }

.dropdown a{
    margin-top: -0.3rem;
}

a#entrar{
    width: 6rem;
    height: 2.5rem;
    border-radius: .7rem;
    background-color: white;
    color: var(--corPrima);
}

a#entrar:hover{
    background-color: var(--corSec);
    color:white;
}

nav#resp{
    display:none
}




    @media screen and (max-width: 1000px) {


        /*Inï¿½cio - Barra de Pesquisa*/
        
        .links{
            display:none;
        }

        div.barra_pesquisa{
            width:95%;
        }
    
            div.barra_pesquisa ul {
                width: 100%;
                flex-direction: column;
                margin: .7rem 0;
                height: auto;
                background-color: var(--corPrima);
                display: none;
                margin: 0;
                transition: all .5s
            }
    
                div.barra_pesquisa ul li {
                    width: 100%
                }
    
            div.barra_pesquisa h1 {
                font-size: 40px;
                margin: 10px
            }
    
        .nav-item a {
            padding: 1rem 1.5rem;
        }
    
        .barra_pesquisa > ul + a {
            width: 6rem;
            position: absolute;
            top: 20px;
            right: 50px;
            height: 2.5rem;
        }
    
        
    
        /*Fim- Barra de Pesquisa*/
    
        div.main {
            width: 95%;
        }
        
        nav#resp{
        background-color: #8473f7;
        display:flex;
   		box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
    
    }
</style>


<div class="header">
	<div class="barra_pesquisa">
			<div class="logo">
				<a class="logo" href="index.jsp?nome=${Dados.nome }"><h1>PetBack</h1></a>
			</div>
			<div class="links">
				<div class="parte">
				<ul class="nav nav-pills" id="menu">
					<li class="nav-item">
						<a class="nav-link" href="controller.do?command=GetCategoria&idCategoria=6">Produtos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="servico.jsp?id=${Dados.id }">Serviços</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="index.jsp#Area_Contato">Contato</a>
					</li>
				</ul>
				</div>
			</div>
			
			
			<div class="nomea">
				
				<div class="dropdown">
					<c:if test="${not empty Dados.nome}">
						<a class="btn btn-info" href="cart.jsp" style=" background-color:var(--corPrima); border: none; border-radius: 15px;display: inline-block;">
								<img src="carrinho.png" alt="Carrinho" height="30px">
								<c:if test="${not empty carrinho }">
									<span class="badge badge-pill badge-light">${carrinho.size() }</span>
								</c:if>
						</a>
						
						<a class="btn btn-info dropdown" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" 
						aria-expanded="false" style=" background-color:var(--corPrima); border: none; border-radius: 15px">
						<c:if test="${empty Dados.image }">
                        	<img src="perfil.png" alt="Sua Foto" height="30px">
                        </c:if>
                        <c:if test="${not empty Dados.image }">
                           	<img src="img_PerfilF/${Image}.png" alt="Imagem de ${Image }" height="45px">
                        </c:if>
						</a>
				
						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink" style="margin-right:20%">
							<p class="dropdown-header">${Nome}</p>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="conta.jsp?nome=${Nome }&email=${Email}&image=${Image}">Perfil</a>
							<a class="dropdown-item" href="meusPedidos.jsp" >Meus Pedidos</a>
							<a class="dropdown-item" href="controller.do?command=GetDetalhesAgenda">
								<c:if test="${not empty lstAgenda }">
									<span class="badge badge-pill badge-danger">${lstAgenda.size() }</span>
								</c:if>Meus Agendamentos
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="Deslogar">Sair</a>
						</div>
	      			</c:if>
					<c:if test="${empty Dados}">
					  <a href="login.jsp" id="entrar" class="btn" >Entrar</a>
				  	</c:if>
			  </div>
			</div>
			
		</div>
</div>

	<nav id="resp">
		    <div style="flex:1; text-align:center" >
		        <a class="nav-link" href="controller.do?command=GetCategoria&idCategoria=6" style="color: white">Produtos</a>
			</div>
		    <div style="flex:1; text-align:center">
				<a class="nav-link" href="servico.jsp?id=${Dados.id }" style="color: white">Serviços</a>
		    </div>
		    <div style="flex:1; text-align:center">
				<a class="nav-link" href="index.jsp#Area_Contato" style="color: white">Contato</a>
		    </div>
		    
		    
		</nav>