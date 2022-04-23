<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<jsp:include page="navbarmainmenu.jsp"></jsp:include>
					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">


										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Cad. Usuário</h4>
														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post" id="formUser" enctype="multipart/form-data">

															<input type="hidden" name="acao" id="acao" value="">

															<div class="form-group form-default form-static-label ">

																<input type="text" name="id" id="id"
																	class="form-control" value="${modelLogin.id}">
																<span class="form-bar"></span> <label
																	class="float-label">Id:</label>
															</div>
															
															<div class="form-group form-default input-group mb-4 ">
																
																<img id="fotoembase64" alt="imagem User" src="https://www.centroespiritauniao.com.br/wp-content/uploads/2017/07/boneco-8.jpg"
																 width="70px">
																
																<input id="filefoto" name="filefoto" type="file" accept="image/*" 
																onchange="visualizarImg('fotoembase64','filefoto')" class="form-control-file" 
																style="margin-top: 25px; margin-left: 10px ">
															
															</div>
															
															<div class="form-group form-primary ">
																<input type="text" name="nome" id="nome"
																	class="form-control" required="required"
																	value="${modelLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="email" name="email" id="email"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.email}">
																<span class="form-bar"></span> <label
																	class="float-label">E-mail:</label>
															</div>

															<div class="form-group form-default form-static-label">
																<select class="form-control" name="perfil">
																	<option disabled="disabled">[Selecione o Perfil]</option>
																	
																	<option value="ADMIN" <%
																	ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	
																	if(modelLogin != null && modelLogin.getPerfil().equals("ADMIN")){
																		out.print(" ");
																		out.print("selected=\"selected\"");
																		out.print(" ");
																	} %>>Admin</option>
																	<option value="SECRETARIA" <%
																	 modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	if(modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")){
																		out.print(" ");
																		out.print("selected=\"selected\"");
																		out.print(" ");
																	} %>>Secretária</option>
																	<option value="AUXILIAR" <%
																	modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	if(modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")){
																		out.print(" ");
																		out.print("selected=\"selected\"");
																		out.print(" ");
																	} %>>Auxiliar</option>
																	<option value="PRODUCAO" <%
																	modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	if(modelLogin != null && modelLogin.getPerfil().equals("PRODUCAO")){
																		out.print(" ");
																		out.print("selected=\"selected\"");
																		out.print(" ");
																	} %>>Produção</option>
																	
																</select>
																	<span class="form-bar"></span> <label
																	class="float-label">Perfil:</label>
															</div>

															<div class="form-group form-primary ">
																<input type="text" name="login" id="login"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.login}">
																<span class="form-bar"></span> <label
																	class="float-label">Login:</label>
															</div>
															<div class="form-group form-primary ">
																<input type="password" name="senha" id="senha"
																	autocomplete="off" class="form-control"
																	required="required" value="${modelLogin.senha}">
																<span class="form-bar"></span> <label
																	class="float-label">Senha:</label>
															</div>
															<div class="form-group form-primary">
																<input type="radio" name="sexo" checked="checked" value="MASCULINO"
																<%
																 modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																
																if(modelLogin != null && modelLogin.getSexo().equals("MASCULINO")){
																	out.print(" ");
																	out.print("checked=\"checked\"");
																	out.print(" ");
																}
																%>>
																Masculino</input>
																<input type="radio" name="sexo" value="FEMININO"
																<%
																 modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																
																if(modelLogin != null && modelLogin.getSexo().equals("FEMININO")){
																	out.print(" ");
																	out.print("checked=\"checked\"");
																	out.print(" ");
																}
																%>
																>Feminino</input>
															</div>

															<button type="button"
																class="btn btn-primary waves-effect waves-light"
																onclick="limparForm()">Novo</button>
															<button type="submit"
																class="btn btn-success waves-effect waves-light">Salvar</button>
															<button type="button"
																class="btn btn-danger waves-effect waves-light"
																onclick="criarDeleteComAjax()">Excluir</button>
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-secondary"
																data-toggle="modal" data-target="#exampleModalUsuario">
																Pesquisar</button>
														</form>
													</div>
												</div>
											</div>
										</div>
										<span>${msg}</span>

										<div style="height: 300px; overflow: scroll;">
											<table class="table" id="tabelaResultadosview">
												<thead>
													<tr>
														<th scope="col">Id</th>
														<th scope="col">Nome</th>
														<th scope="col">Sexo</th>
														<th scope="col">Editar</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${modelLogins}" var="ml">
														<tr>
															<td><c:out value="${ml.id}"></c:out></td>
															<td><c:out value="${ml.nome}"></c:out></td>
															<td><c:out value="${ml.sexo}"></c:out></td>
															
															<td>
															<a
																href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}"
																class="btn  btn-success" type="button">Editar
															</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javascriptfile.jsp"></jsp:include>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalUsuario" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						Usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="Digite o Nome" aria-label="name"
							aria-describedby="basic-addon2" id="nomeBuscar">
						<div class="input-group-append">
							<button class="btn  btn-success" type="button"
								onclick="buscarUsuario()">Buscar</button>
						</div>
					</div>
					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="tabelaResultados">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Nome</th>
									<th scope="col">Editar</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
					<span id="totalResultado"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function verEditar(id) {
			var urlAction = document.getElementById("formUser").action;//http://localhost:8080/curso-jsp/ServletUsuarioController

			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;
		}
		function buscarUsuario() {
			var nomeBuscar = document.getElementById("nomeBuscar").value;

			if (nomeBuscar != null && nomeBuscar != ""
					&& nomeBuscar.trim() != '') {/*validando que tem que ter valor pra buscar no banco*/

				var urlAction = document.getElementById("formUser").action;

				$
						.ajax(
								{
									method : "get",
									url : urlAction,
									data : "nomeBuscar=" + nomeBuscar
											+ '&acao=buscarUserAjax',
									success : function(response) {
										var json = JSON.parse(response);

										$('#tabelaResultados > tbody > tr')
												.remove();

										for (var p = 0; p < json.length; p++) {
											$('#tabelaResultados > tbody')
													.append(
															'<tr> <td>'
																	+ json[p].id
																	+ '</td> <td>'
																	+ json[p].nome
																	+ '</td> <td><button type="button" class="btn btn-info" onclick="verEditar('
																	+ json[p].id
																	+ ')">Editar</button></td></tr>')
										}
										document
												.getElementById("totalResultado").textContent = 'Resultados'
												+ json.length;
									}
								}).fail(
								function(xhr, status, errorThrown) {
									alert("Erro ao Buscar usuário por Nome: "
											+ xhr.responseText)
								});
			} else {

			}
		}
		function criarDeleteComAjax() {

			if (confirm("Deseja realmente excluir os dados ? ")) {
				var urlAction = document.getElementById("formUser").action;
				var idUser = document.getElementById("id").value;

				$.ajax({
					method : "get",
					url : urlAction,
					data : "id=" + idUser + '&acao=deletajax',
					success : function(response) {

					}
				}).fail(
						function(xhr, status, errorThrown) {
							alert("Erro ao Deletar usuário por id: "
									+ xhr.responseText)
						});
			}
			limparForm();
		}
		function criarDelete() {
			var nome = document.getElementById("nome").value
			if (confirm("Deseja realmente excluir os dados ? " + nome)) {
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deleta';
				document.getElementById("formUser").submit();
			}
		}

		function limparForm() {
			let elementos = document.getElementById("formUser").elements;

			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = "";
			}
		}
		
		function visualizarImg(fotoembase64, filefoto) {
			var preview = document.getElementById(fotoembase64);// campo IMG html
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();
			reader.onloadend = function(){
				preview.src = reader.result; // Carrega a foto na tela
			};
			
			if(fileUser){
				reader.readAsDataURL(fileUser); //preview da imagem
			}else{
				preview.src = '';
			}
			
		}
	</script>
</body>
</html>
