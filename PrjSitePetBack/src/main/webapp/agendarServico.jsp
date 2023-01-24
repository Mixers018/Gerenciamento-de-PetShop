<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="dao.ServicoDao"%>
<%@ page import="model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.DecimalFormatSymbols"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="Favicon/favicon.ico" />
<title>PetBack - Serviços</title>
<link rel="stylesheet" type="text/css" href="css/agendarServicos.css"
	media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/d3d2efc2cc.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>

	<c:import url="include/menu.jsp?nome=${nome }"></c:import>

	<c:if test="${not empty sucessoAgenda }">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" style="width: 30%; float: right; margin: 10px 20px"
			id="FadeIn">
			<span><c:out value="${sucessoAgenda }" /></span>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<!--Controler de informação do serviço agendado p/ o cliente-->

	<c:if test="${not empty erroAgenda }">
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert" style="width: 39%; float: right; margin: 10px 20px"
			id="FadeIn">
			<span><c:out value="${erroAgenda }" /></span>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<!--Controler de informação do serviço não agendado p/ o cliente-->

	<c:if test="${not empty sucessoAddPet }">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" style="width: 30%; float: right; margin: 10px 20px"
			id="FadeIn">
			<span><c:out value="${sucessoAddPet }" /></span>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<!--Controler de informação do Pet cadastrado p/ o cliente-->

	<c:if test="${not empty erroAddPet }">
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert" style="width: 30%; float: right; margin: 10px 20px"
			id="FadeIn">
			<span><c:out value="${erroAddPet }" /></span>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<!--Controler de informação do pet já cadastrado p/ o cliente-->
	<!-- Detalhes do serviço início -->
	<main>

		<c:forEach var="s" items="${listaServico }">
			<div class="conteiner">
				<div class="conteiner" data-aos="fade-left">

					<div style="display: flex">

						<div
							style="margin: left; text-align: center; margin-top: 5rem; margin-bottom: 3rem; width: 50%;">

							<c:choose>

								<c:when test="${s.nome == 'Banho'}">
									<img class="img-thumbnail" src="img_ServicoF/banhoPet.png"
										alt="Imagem de um ${s.nome}"
										style="width: 60%; border: none; padding: 0px; border-radius: 50%" />
								</c:when>

								<c:when test="${s.nome == 'Tosa'}">
									<img class="img-thumbnail" src="img_ServicoF/tosaPet.png"
										alt="Imagem de um ${s.nome}"
										style="width: 60%; border: none; padding: 0px; border-radius: 50%" />
								</c:when>

								<c:when test="${s.nome == 'Adestramento'}">
									<img class="img-thumbnail"
										src="img_ServicoF/adestramentoPet.png"
										alt="Imagem de um ${s.nome}"
										style="width: 60%; border: none; padding: 0px; border-radius: 50%" />
								</c:when>

								<c:when test="${s.nome == 'Corte de Unha'}">
									<img class="img-thumbnail" src="img_ServicoF/corteUnhaPet.png"
										alt="Imagem de um ${s.nome}"
										style="width: 60%; border: none; padding: 0px; border-radius: 50%" />
								</c:when>

								<c:when test="${s.nome == 'Hidratação'}">
									<img class="img-thumbnail" src="img_ServicoF/hidratacaoPet.png"
										alt="Imagem de um ${s.nome}"
										style="width: 60%; border: none; padding: 0px; border-radius: 50%" />
								</c:when>

								<c:when test="${s.nome == 'Passeio'}">
									<img class="img-thumbnail" src="img_ServicoF/passeioPet.png"
										alt="Imagem de um ${s.nome}"
										style="width: 60%; border: none; padding: 0px; border-radius: 50%" />
								</c:when>

							</c:choose>

						</div>


						<div style="margin: left; margin-top: 10vw; width: 50%">
							<h3
								style="font-family: var(- -FontTexto); font-size: 32px; font-weight: 400; color: #262626">
								<c:out value="${s.nome }"></c:out>
							</h3>
							<p
								style="font-size: 22px; font-family: var(- -FontTexto); font-weight: 400; color: #171717">
								<c:out value="${s.descricao }"></c:out>
							</p>
						</div>

					</div>

				</div>
			</div>
		</c:forEach>
	</main>

	<!-- Lista pet 
    -->
	<div class="mt-3 mb-2"
		style="widht: 100%; background: #FBBD44; padding: 3rem; padding-top: 1.5rem">
		<main>
			<h3
				style="font-size: 35px; margin-top: 1rem; font-family: 'Inter'; color: white; text-shadow: black 0.1em 0.1em 0.2em; text-align: center">
				Faça agora o seu agendamento!<br>Veja seus pets cadastrados!
			</h3>

			<c:forEach var="s" items="${listaServico }">
			
			
			<c:if test="${empty  listaPet}">
				<h3
				style="font-size: 35px; margin: 1rem auto; font-family: 'Inter'; color: white; text-align: center;"><br>
					Você não tem Pets cadastrados!!
				</h3>
				<small id="emailHelp" class="form-text" style="color: white;text-align: center; font-size: 20px; font-family: 'Inter'; text-shadow: black 0.1em 0.1em 0.2em;"><a data-toggle="modal" data-target=".bd-example-modal-xl" style="color: blue; text-decoration: underline ">Clique aqui para adicionar.</a> </small>
				
			</c:if>
			
			
			
			<c:if test="${not empty listaPet}">
				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">

					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="cards-wrapper">
							
							
								<c:forEach var="p" items="${listaPet }" begin="0" end="2"
									step="1">


									<div class="card">

										<c:choose>

											<c:when test="${p.especie == 'Gato' && p.sexo == 'Feminino'}">
												<img class="card-img-top" src="img_Agendar/gatoF.png"
													alt="Gato Fêmea" style="width: 100px">
											</c:when>

											<c:when
												test="${p.especie == 'Gato' && p.sexo == 'Masculino' }">
												<img class="card-img-top" src="img_Agendar/gatoM.png"
													alt="Gato Macho" style="width: 100px">
											</c:when>


											<c:when
												test="${p.especie  == 'Cachorro' && p.sexo == 'Feminino'}">
												<img class="card-img-top" src="img_Agendar/cachorroF.png"
													alt="Cachorro Fêmea" style="width: 100px">
											</c:when>

											<c:when
												test="${p.especie  == 'Cachorro' && p.sexo == 'Masculino'}">
												<img class="card-img-top" src="img_Agendar/cachorroM.png"
													alt="Cachorro Macho" style="width: 100px">
											</c:when>

										</c:choose>

										<div class="card-body">
											<h5 class="card-title">
												<c:out value="${p.nome }"></c:out>
											</h5>
											<p class="card-text">
												<c:out value="${p.especie }"></c:out>
												(
												<c:out value="${p.sexo }"></c:out>
												) -
												<c:out value="${p.raca }"></c:out>
											</p>
											<form action="controller.do" method="post"
												style="text-align: right; width: 100%; padding: 5px 10px">
												<input class="form-check-input" type="hidden" name="idPet"
													value="${p.id }"> <input class="form-check-input"
													type="hidden" name="idServico" value="${s.id }">
												<button class="fechar" type="submit" value="ExcluirPet"
													name="command"></button>
											</form>
										</div>
									</div>



								</c:forEach>
							</div>
						</div>

						<c:if test="${listaPet.size() > 3 }">
							<div class="carousel-item">
								<div class="cards-wrapper">
									<c:forEach var="p" items="${listaPet }" begin="3" end="5"
										step="1">

										<div class="card">

											<c:choose>

												<c:when
													test="${p.especie == 'Gato' && p.sexo == 'Feminino'}">
													<img class="card-img-top" src="img_Agendar/gatoF.png"
														alt="Gato Fêmea" style="width: 100px">
												</c:when>

												<c:when
													test="${p.especie == 'Gato' && p.sexo == 'Masculino' }">
													<img class="card-img-top" src="img_Agendar/gatoM.png"
														alt="Gato Macho" style="width: 100px">
												</c:when>


												<c:when
													test="${p.especie  == 'Cachorro' && p.sexo == 'Feminino'}">
													<img class="card-img-top" src="img_Agendar/cachorroF.png"
														alt="Cachorro Fêmea" style="width: 100px">
												</c:when>

												<c:when
													test="${p.especie  == 'Cachorro' && p.sexo == 'Masculino'}">
													<img class="card-img-top" src="img_Agendar/cachorroM.png"
														alt="Cachorro Macho" style="width: 100px">
												</c:when>

											</c:choose>

											<div class="card-body">
												<h5 class="card-title">
													<c:out value="${p.nome }"></c:out>
												</h5>
												<p class="card-text">
													<c:out value="${p.especie }"></c:out>
													(
													<c:out value="${p.sexo }"></c:out>
													) -
													<c:out value="${p.raca }"></c:out>
												</p>
												<form action="controller.do" method="post"
													style="text-align: right; width: 100%; padding: 5px 10px">
													<input class="form-check-input" type="hidden" name="idPet"
														value="${p.id }"> <input class="form-check-input"
														type="hidden" name="idServico" value="${s.id }">
													<button class="fechar" type="submit" value="ExcluirPet"
														name="command"></button>
												</form>
											</div>
										</div>

									</c:forEach>
								</div>

							</div>
						</c:if>

						<a class="carousel-control-prev" href="#carouselExampleControls"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Anterior</span>
						</a> <a class="carousel-control-next" href="#carouselExampleControls"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Próximo</span>
						</a>
					</div>
				</div>
			</c:if>
			</c:forEach>
		</main>
	</div>










	<!-- Formulário AddAgendamento -->
	<main>
		<form class="mb-3" action="controller.do" method="post">
			<h3
				style="font-size: 32px; margin: 2rem 2.4rem; margin-bottom: 1rem; margin-top: 4rem; font-family: 'Inter'; color: #403d3d;">Continue
				para marcar uma consulta!!</h3>

			<br> <br>
			<div class="form-group">
				<label style="margin-left: 2.4rem;" for="exampleFormControlSelect2">Escolha
					seu pet:</label> <select style="margin-left: 2.4rem;" class="form-control"
					id="exampleFormControlSelect1" name="idPet" required>
					<option value="" selected disabled>Selecione</option>
					<c:forEach var="p" items="${listaPet }">
						<option value="${p.id }"><c:out value="${p.nome }"></c:out></option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label style="margin-left: 2.4rem;" for="exampleFormControlInput1">Datas:</label>
				<input style="margin-left: 2.4rem;" type="date" class="form-control"
					id="exampleFormControlInput1" min="2023-01-02" max="2023-12-29"
					name="data" required>
			</div>
			<div class="form-group">
				<label style="margin-left: 2.4rem;" for="exampleFormControlSelect1">Horários:</label>
				<select style="margin-left: 2.4rem" class="form-control"
					id="exampleFormControlSelect1" name="hora" required>
					<option selected disabled value="">Selecione</option>
					<option value="8:00">8:00</option>
					<option value="10:00">10:00</option>
					<option value="13:00">13:00</option>
					<option value="15:00">15:00</option>
					<option value="17:00">17:00</option>
				</select>
			</div>
			<div class="form-group">
				<label style="margin-left: 2.4rem; padding-right: 2.4rem"
					for="exampleFormControlTextarea1">Observações adicionais</label>
				<textarea style="margin-left: 2.4rem;" class="form-control"
					id="exampleFormControlTextarea1" rows="3"
					placeholder="Informe aqui..." name="descricao"></textarea>
				<br>
			</div>
			<c:forEach var="s" items="${listaServico }">
				<input class="form-check-input" type="hidden" name="idServico"
					value="${s.id }">
				<input class="form-check-input" type="hidden" name="valor"
					value="${s.preco }">
				<button style="float: right;" class="btn btn-success" type="submit"
					value="Agendar" name="command">Finalizar</button>
			</c:forEach>
		</form>


		<!-- Mapa -->
		<br>
		<hr style="margin: 3rem; margin-left: 6rem; margin-top: 3.3rem">
		<div class="mt-5 mb-5">
			<h3
				style="font-size: 32px; margin: 2rem 2rem; font-family: 'Inter'; color: #403d3d; text-shadow: #171717 0 0 0 50px">Venha
				nos visitar!!</h3>
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3658.0811010019297!2d-46.63476628502287!3d-23.52958528469861!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce585fbb047051%3A0x1ad799a7c61cd5f3!2sETEC%20de%20S%C3%A3o%20Paulo!5e0!3m2!1spt-BR!2sbr!4v1665549932728!5m2!1spt-BR!2sbr"
				width="100%" height="500" style="border: 0; margin-left: 2rem;"
				allowfullscreen="" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>


		<!-- Btn dropdown -->
		<button
			style="position: fixed; bottom: 5rem; right: 5rem; padding: 15px; background: #5D50E0; outline: none; border: none; border-radius: 15px"
			type="button" id="dropdownMenuButton" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false">
			<i class="fa-solid fa-plus"></i>
		</button>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			
			<a class="dropdown-item" data-toggle="modal" data-target=".bd-example-modal-xl"> Adicionar Pet </a> 

			<a class="dropdown-item" href="controller.do?command=GetDetalhesAgenda">
				<c:if test="${not empty lstAgenda }">
					<span class="badge badge-pill badge-danger">${lstAgenda.size() }</span> 
					</c:if>Ver Agendamentos 
		</a>
			
		</div>

		<!-- Modal AddPet -->
		<div class="modal fade bd-example-modal-xl" tabindex="-1"
			role="dialog" aria-labelledby="myExtraLargeModalLabel"
			aria-hidden="true" id="modal">
			<div class="modal-dialog modal-xl">
				<div class="modal-content" style="padding: 1.5rem 1.5rem">
					<h4 class="display-4 mb-3">Insira seu pet</h4>
					<h4 class="col-form-label">Preencha os campos a seguir:</h4>
					<br>
					<form action="controller.do" method="post">

						<div class="form-group row">
							<label for="inputPassword" class="col-sm-2 col-form-label">Nome</label>
							<div class="col-sm-10">
								<input maxlength="50" type="text" class="form-control"
									id="inputPassword" placeholder="Nome do seu pet" name="nome"
									required>
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-2 col-form-label">Raça</label>
							<div class="col-sm-10">
								<input maxlength="50" type="text" class="form-control"
									id="inputPassword" placeholder="Raça" name="raca" required>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-4">
								<input class="form-check-input" type="radio" name="especie"
									id="inlineRadio1" value="Gato" required> <label
									class="form-check-label" for="inlineRadio1">Gato</label>
							</div>
							<div class="col-sm-5">
								<input class="form-check-input" type="radio" name="especie"
									id="inlineRadio2" value="Cachorro" required> <label
									class="form-check-label" for="inlineRadio2">Cachorro</label>
							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-4">
								<input class="form-check-input" type="radio" name="sexo"
									id="inlineRadio3" value="Masculino" required> <label
									class="form-check-label" for="inlineRadio3">Macho</label>
							</div>
							<div class="col-sm-5">
								<input class="form-check-input" type="radio" name="sexo"
									id="inlineRadio3" value="Feminino" required> <label
									class="form-check-label" for="inlineRadio3">Fêmea</label>
							</div>
						</div>

						<div class="modal-footer"></div>

						<div class="form-group row">
							<div class="col-sm-5">
								<button type="submit" class="btn btn-primary" value="SalvarPet"
									name="command">Cadastrar</button>
							</div>
							<div class="col-sm-5">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancelar</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</main>

	<c:import url="include/footer.jsp"></c:import>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout(function() {
			$(".alert").alert('close');
		}, 10000);
	});

	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})
</script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>

<script>
	AOS.init({
		duration : 1500,
	});

	var btn = document.querySelector("#button");
	button.addEventListener("click", function() {
		var div = document.querySelector("#menu");

		if (div.style.display === "none") {
			div.style.display = "flex";
		} else {
			div.style.display = "none";
		}
	});
</script>


<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
	integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
	crossorigin="anonymous"></script>
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