<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
/*In�cio FOOTER*/
footer {
    width: 100%;
    height: 15rem;
    background-color: var(--corPrima);
    margin: 0;
    position: relative;
}



div.div-img {
    height: 11rem;
    width: 100%;
    background-image: url("../Img-footer/footer2.png");
    background-size: cover;
    background-repeat: no-repeat;
    overflow: hidden;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
}

footer.rodape {
    width: 100%;
    height: 20vw;
    background-color: var(--corPrima);
    overflow: hidden;
    padding: 0rem 5rem
}

div.informacoes {
    width: 100%;
    height: 17vw;
    display: flex;
}

div.linksrapidos {
    flex: 1;
}

div.lista {
    width: 20vw;
    height: 12vw;
    margin: 4vw 0 0 1vw;
    float: left;
}

    div.lista h1 {
        color: #ffffff;
        font-family: var(--FontTexto);
        font-weight: bold;
        font-size: 1.2vw;
        margin-bottom: 0.7vw;
    }

    div.lista ul li {
        color: #ffffff;
        font-size: 1.1vw;
        margin-left: 1.3vw;
    }

    div.lista a {
        text-decoration: none;
        font-family: var(--FontTexto), sans-serif;
        color: #ffffff;
    }

    div.lista ul li a:hover {
        color: rgba( 255, 255, 255, 0.6);
        transition: all .4s;
    }

div.siganos {
    flex: 1;
}

div.sociais {
    width: 10vw;
    height: 2vw;
    margin-top: 4vw;
    float: left;
}

    div.sociais h1 {
        color: #ffffff;
        font-family: var(--FontTexto);
        font-weight: bold;
        font-size: 1.2vw;
        padding-left: 0.8vw;
    }

div.icone {
    width: 30%;
    height: 5vw;
    float: left;
    text-align: center;
    margin-left: 0.2vw;
    margin-top: 0.7vw;
}

div.copyright {
    width: 100%;
    height: 3vw;
    background-color: #230d40;
    border-top: solid 0.1vw #19092e;
}

i {
    color: white;
    padding: .6rem;
    transition: ease-in-out .4s
}

    i:hover,
    i:focus {
        color: rgba( 255, 255, 255, 0.6);
    }




/*fIM FOOTER*/


@media screen and (max-width: 850px) {
	/*Rodap�*/

    footer {
        width: 100%;
        height: 25rem;
    }

    div.div-img {
        height: 4rem;
        width: 100%;
    }

    footer.rodape {
        width: 100%;
        height: 28rem;
        align-items: center;
        padding: 0rem 5rem
    }

    div.informacoes {
        width: 100%;
        height: 28rem;
        align-items: center;
        display: flex;
    }

    div.lista {
        width: 50%;
        height: 12rem;
        margin: 2rem 0 0 1vw;
        float: left;
    }

        div.lista h1 {
            font-size: .9rem;
        }

        div.lista ul li {
            color: #ffffff;
            font-size: 1rem;
            ;
            margin-left: 1.3vw;
        }


    div.siganos {
        flex: 1;
    }

    div.sociais {
        width: 10rem;
    }

        div.sociais h1 {
            font-size: .9rem;
        }


    /*fIM FOOTER*/



}




</style>
<!--Início FOOTER-->
    <footer class="rodape">
            <div class="informacoes">
                <div class="linksrapidos">
                    <div class="lista">
                        <ul>
                            <h1>Serviços</h1>
                            <c:if test="${not empty Dados.nome}">
                            	<li><a href="controller.do?command=MostrarDetalhesServico&ID=4">Adestramento</a></li>
                            	<li><a href="controller.do?command=MostrarDetalhesServico&ID=2">Banho</a></li>
                            	<li><a href="controller.do?command=MostrarDetalhesServico&ID=5">Corte de Unha</a></li>
                            	<li><a href="controller.do?command=MostrarDetalhesServico&ID=6">Hidratação</a></li>
                            	<li><a href="controller.do?command=MostrarDetalhesServico&ID=7">Passeio</a></li>
                            	<li><a href="controller.do?command=MostrarDetalhesServico&ID=3">Tosa</a></li>
                            </c:if>
                            <c:if test="${empty Dados.nome}">
                            	<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Faça login para continuar">	
                            		<li><a href="controller.do?command=MostrarDetalhesServico&ID=4" style="pointer-events: none" disabled>Adestramento</a></li>
                            		<li><a href="controller.do?command=MostrarDetalhesServico&ID=2" style="pointer-events: none" disabled>Banho</a></li>
                            		<li><a href="controller.do?command=MostrarDetalhesServico&ID=5" style="pointer-events: none" disabled>Corte de Unha</a></li>
                            		<li><a href="controller.do?command=MostrarDetalhesServico&ID=6" style="pointer-events: none" disabled>Hidratação</a></li>
                            		<li><a href="controller.do?command=MostrarDetalhesServico&ID=7" style="pointer-events: none" disabled>Passeio</a></li>
                            		<li><a href="controller.do?command=MostrarDetalhesServico&ID=3" style="pointer-events: none" sdisabled>Tosa</a></li>
								</span>
                            </c:if>
                        </ul>
                    </div>

                     <div class="lista">
                        <ul>
                            <h1>Produtos</h1>
                            <li><a href="controller.do?command=GetCategoria&idCategoria=1">Cachorro</a></li>
                            <li><a href="controller.do?command=GetCategoria&idCategoria=2">Gato</a></li>
                            <li><a href="controller.do?command=GetCategoria&idCategoria=3">Pássaro</a></li>
                            <li><a href="controller.do?command=GetCategoria&idCategoria=4">Peixe</a></li>
                            <li><a href="controller.do?command=GetCategoria&idCategoria=5">Hamster</a></li>
                        </ul>
                    </div>
                </div>
                <div class="siganos">
                    <div class="sociais">
                        <h1>Siga-nos</h1>
                        <div class="icone">
                            <a href="https://www.instagram.com/">
                                <i class="fa-brands fa-instagram fa-2xl"></i>
                            </a>
                        </div>
                        <div class="icone">
                            <a href="https://twitter.com/login?lang=pt">
                                <i class="fa-brands fa-twitter fa-2xl"></i>
                            </a>
                        </div>
                        <div class="icone">
                            <a href="https://pt-br.facebook.com/">
                                <i class="fa-brands fa-facebook fa-2xl"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    <div style="width:100%;height: auto; padding: .3rem 5rem; background-color: white "><h1 style="font-family: var(--FontTitulo), serif; color:var(--corPrima); letter-spacing: unset; font-size:22px ">PETBACK</h1></div>

    <!--Fim FOOTER-->

