<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.entity.*"%>
<%@page import="controller.PMF"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="java.util.List"%>

<%
	Course current = (Course) request.getAttribute("course");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>IE</title>
<link href="/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="/css/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="/css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="index.html">Bienvenidos a la IE</a>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link" href="/index2.html"> <i
						class="fa fa-fw fa-circle"></i> <span class="nav-link-text">Work
							Board</span>
				</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link nav-link-collapse collapsed"
					data-toggle="collapse" href="#coll0" aria-expanded="false"> <i
						class="fa fa-fw fa-comments"></i> <span class="nav-link-text">Nivel</span>
				</a>
					<ul class="sidenav-second-level collapse" id="coll0">
						<li><a href="/level">List</a></li>
						<li><a href="/level/add">Add</a></li>
					</ul>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link nav-link-collapse collapsed"
					data-toggle="collapse" href="#coll2" aria-expanded="false"> <i
						class="fa fa-fw fa-list"></i> <span class="nav-link-text">Course</span>
				</a>
					<ul class="sidenav-second-level collapse" id="coll2">
						<li><a href="/course">List</a></li>
						<li><a href="/course/add">Add</a></li>
					</ul>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right">
					<a class="nav-link nav-link-collapse collapsed"
					data-toggle="collapse" href="#coll3" aria-expanded="false"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Matricula</span>
				</a>
					<ul class="sidenav-second-level collapse" id="coll3">
						<li><a href="/enroll">List</a></li>
						<li><a href="/enroll/add">Add</a></li>
					</ul>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-envelope"></i> <span
						class="d-lg-none">Messages <span
							class="badge badge-pill badge-primary">12 New</span>
					</span> <span class="indicator text-primary d-none d-lg-block"> <i
							class="fa fa-fw fa-circle"></i>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="messagesDropdown">
						<h6 class="dropdown-header">New Messages:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>Jhon Smith</strong>
							<span class="small float-right text-muted">11:21 AM</span>
							<div>Hey this page web is fun!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>Jane
								Potato</strong> <span class="small float-right text-muted">11:21
								AM</span>
							<div>Thanks for your effort!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>Nose
								Meocurre</strong> <span class="small float-right text-muted">11:21
								AM</span>
							<div>This is a demo :v.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#">View all messages</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-bell"></i> <span
						class="d-lg-none">Alerts <span
							class="badge badge-pill badge-warning">6 New</span>
					</span> <span class="indicator text-warning d-none d-lg-block"> <i
							class="fa fa-fw fa-circle"></i>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="alertsDropdown">
						<h6 class="dropdown-header">New Alerts:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up fa-fw"></i>Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div>This is an automated server response message. All
								available later</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-danger">
								<strong> <i class="fa fa-long-arrow-down fa-fw"></i>Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div>This is an automated server response message. Coming
								Soon</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up fa-fw"></i>Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div>This is an automated server response message. All
								systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#">View all alerts</a>
					</div></li>
				<li class="nav-item">
					<form class="form-inline">
						<div class="input-group">
							<input class="form-control" type="text"
								placeholder="Search for..."> <span
								class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
				</li>
				<li class="nav-item"><a class="nav-link" href="/user/login">
						<i class="fa fa-fw fa-sign-in"></i>Login
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/logout">
						<i class="fa fa-sign-out"></i>Logout
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<div class="container-fluid">
			<form action="/user/edit" method="get"
				class="form-horizontal text-left">
				<div class="form-group">
					<input type="hidden" name="ID" value="<%=current.getId()%>">
				</div>
				<%
					if (current.getLevelId() == null) {
						PersistenceManager pm = PMF.get().getPersistenceManager();
						String query = "select from " + Level.class.getName();
						List<Level> res = (List<Level>) pm.newQuery(query).execute();
				%>
				<div class="form-group">
					<label>Este cuadro solo aparecera una vez debido a que se
						elimino su nivel</label> <select name="levelId">
						<%
							if (res.size() > 0) {
									for (int i = 0; i < res.size(); i++) {
						%>
						<option value="<%=res.get(i).getId()%>"><%=res.get(i).getName()%></option>
						<%
							}
								}
						%>
					</select>
				</div>
				<%
					}
				%>
				<div class="form-group">
					<label class="control-label col-sm-2">Nombre</label> <input
						type="text" name="name" value="<%=current.getName()%>" required>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Departamento</label> <select
						name="dep">
						<option>Letras</option>
						<option>Matematica</option>
						<option>Sociales</option>
						<option>Psicomotriz</option>
						<option value="CTA">Ciencia Tecnologia y Ambiente</option>
						<option>Artes</option>
						<option>Psicologia</option>
						<option>Religion</option>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Nombre del docente</label> <input
						type="text" name="teacher" value="<%=current.getTeacher()%>"
						required>
				</div>
				<div class="form-group">
					<input type="submit" value="Registrar" />
				</div>
			</form>
		</div>
		<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
					<small>Copyright © Cristhian Ramirez 2018</small>
				</div>
			</div>
		</footer>
		<script src="/js/jquery/jquery.min.js"></script>
		<script src="/js/bootstrap/bootstrap.bundle.min.js"></script>
		<script src="/js/jquery-easing/jquery.easing.min.js"></script>
	</div>
</body>

</html>
