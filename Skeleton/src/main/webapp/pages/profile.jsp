<%@ page language="java" pageEncoding="UTF-8"
  	contentType="text/html;charset=utf-8"%>  
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  


  <c:import url="template/header.jsp" />  

  <h1>My Profile</h1>
  
	<c:if test="${not empty success}">
		<div class="alert alert-success" role="alert">
			${success}
		</div>
	</c:if>
	
	<c:if test="${not empty error}">
		<div class="alert alert-danger" role="alert">
			${error}
		</div>
	</c:if> 	
 	
<form:form class="form-horizontal" role="form" method="post" modelAttribute="profileForm" action="profileChange"
	id="profileForm" autocomplete="on">
	
	<spring:bind path="email">
		<div class="form-group ${status.error ? 'has-error has-feedback' : ''}">
			<label class="control-label col-sm-3" for="email">E-Mail</label>
			<div class="col-sm-9">
				<form:input path="email" class="form-control" id="email" type="email" maxlength="45" placeholder="E-Mail" value="${loggedInUser.email}"/>
				<form:errors path="email" class="help-block" element="span" />
			</div>
		</div>
	</spring:bind>
	<spring:bind path="firstName">
		<div class="form-group ${status.error ? 'has-error has-feedback' : ''}">
			<label class="control-label col-sm-3" for="firstName">First Name</label>
			<div class="col-sm-9">
				<form:input path="firstName" class="form-control" id="firstName" type="text" maxlength="45" placeholder="First Name" value="${loggedInUser.firstName}"/>
				<form:errors path="firstName" class="help-block" element="span" />
			</div>
		</div>
	</spring:bind>
	<spring:bind path="lastName">
		<div class="form-group ${status.error ? 'has-error has-feedback' : ''}">
			<label class="control-label col-sm-3" for="lastName">Last Name</label>
			<div class="col-sm-9">
				<form:input path="lastName" class="form-control" id="lastName" type="text" maxlength="45" placeholder="Last Name" value="${loggedInUser.lastName}"/>
				<form:errors path="lastName" class="help-block" element="span" />
			</div>
		</div>
	</spring:bind>
	<spring:bind path="password">
		<div class="form-group ${status.error ? 'has-error has-feedback' : ''}">
			<label class="control-label col-sm-3" for="password">Password</label>
			<div class="col-sm-9">
				<form:password path="password" class="form-control" id="password" maxlength="45" placeholder="Password" />
				<form:errors path="password" class="help-block" element="span" />
			</div>
		</div>
	</spring:bind>
	<spring:bind path="passwordConfirm">
		<div class="form-group ${status.error ? 'has-error has-feedback' : ''}">
			<label class="control-label col-sm-3" for="passwordConfirm">Confirm Password</label>
			<div class="col-sm-9">
				<form:password path="passwordConfirm" class="form-control" id="passwordConfirm" maxlength="45" placeholder="Confirm Password" />
				<form:errors path="passwordConfirm" class="help-block" element="span" />
			</div>
		</div>
	</spring:bind>
	<spring:bind path="street">
		<div class="form-group ${status.error ? 'has-error has-feedback' : ''}">
			<label class="control-label col-sm-3" for="street">Street</label>
			<div class="col-sm-9">
				<form:input path="street" class="form-control" id="street" type="text" maxlength="45" placeholder="Street" value="${loggedInUser.address.street}"/>
				<form:errors path="street" class="help-block" element="span" />
			</div>
		</div>
	</spring:bind>
	<spring:bind path="houseNr">
		<div class="form-group ${status.error ? 'has-error has-feedback' : ''}">
			<label class="control-label col-sm-3" for="houseNr">House Number</label>
			<div class="col-sm-9">
				<form:input path="houseNr" class="form-control" id="houseNr" type="text" maxlength="45" placeholder="House Number" value="${loggedInUser.address.houseNr}"/>
				<form:errors path="houseNr" class="help-block" element="span" />
			</div>
		</div>
	</spring:bind>	
	<spring:bind path="zip">
		<div class="form-group ${status.error ? 'has-error has-feedback' : ''}">
			<label class="control-label col-sm-3" for="zip">ZIP-Code</label>
			<div class="col-sm-9">
				<form:input path="zip" class="form-control" id="zip" type="text" maxlength="45" placeholder="ZIP-Code" value="${loggedInUser.address.zip}"/>
				<form:errors path="zip" class="help-block" element="span" />
			</div>
		</div>
	</spring:bind>
	<spring:bind path="city">
		<div class="form-group ${status.error ? 'has-error has-feedback' : ''}">
			<label class="control-label col-sm-3" for="city">City</label>
			<div class="col-sm-9">
				<form:input path="city" class="form-control" id="city" type="text" maxlength="45" placeholder="City" value="${loggedInUser.address.city}"/>
				<form:errors path="city" class="help-block" element="span" />
			</div>
		</div>
	</spring:bind>	
 	
 	<div class="form group">
 		<div class="col-sm-offset-2 col-sm-10">
 			<button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
 			<button class="btn btn-warning" type="reset"><span class="glyphicon glyphicon-remove"></span> Reset</button>
 		</div>
 	</div>
 </form:form>

<c:import url="template/footer.jsp" />