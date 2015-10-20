<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Application</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="custom.css" />
	</head>
	<body>
		<jsp:include page="includes/header.jsp" />
		<div style="margin-top:10%"/>
		<c:choose>
			<c:when test="${app != null}">
			<div class="container" style="width:55%">
				<header>
					<h1>Application ${app.appId}</h1>
				</header>
				<br>
				
				<div class="col-md-9" style="margin-left: 10px;">
		            
		            <div class="tab-content col-md-12">
		                <div class="tab-pane fade in active">
		                    <div class="col-md-6">
		                        <h4>
		                            <b>Name:</b>
		                        </h4>
		                        <div class="details-column">
		                            ${app.firstName} ${app.lastName}
		                        </div>
		                        <h4>
		                             <b>Drivers Licence:</b>
		                        </h4>
		                        <div class="details-column">
		                            ${app.driversLicence}
		                        </div>
		                        <h4>
		                        	<b>Email:</b> 
		                        </h4>
		                        <div class="details-column">
		                            ${app.email}
		                        </div>
		                        <h4>
		                        	<b>Phone Number:</b> 
		                        </h4>
		                        <div class="details-column">
		                            ${app.phoneNumber}
		                        </div>
		                        <h4>
		                        	<b>Post Code:</b> 
		                        </h4>
		                        <div class="details-column">
		                            ${app.postcode}
		                        </div>
		                    </div>
		                    <div class="col-md-6">
		                        <h4>
		                            <b>Cover Letter:</b>
		                        </h4>
	                	        <div class="details-column">
		                            ${app.coverLetter}
		                        </div>
		                        <h4>
									<b>Resume:</b>
		                        </h4>
		                        <div class="details-column">
									${app.resume}
		                        </div>
		                        <h4>
									<b>Status:</b>
		                        </h4>
		                        <div class="details-column">
									${app.status}
		                        </div>
		                    </div>
		                </div>
		            </div>
		            
		            <div class="controls">
	        	        <c:choose>
		       				<c:when test="${user == null && review == null}">
		       					<div class="container">
									<form method="post" action="updateApplication" class="form-add">
										<div class="col-md-6">
											<input type="hidden" name="appID" value="${app.appId}">
											<label> First Name: </label>
											<input placeholder="First Name" maxlength=100 class="form-add-control" name="firstName" type="text" required="">
											<label> Surname:</label>
											<input placeholder="Surname" class="form-add-control" name="surname" type="text" required="">
											<label> Drivers Licence: </label>
											<input placeholder="Drivers Licence" class="form-add-control" name="licence" type="number" required="">
											<label> Email: </label>
											<input placeholder="Email" class="form-add-control" name="email" type="text" required="">
										</div>
										<div class="col-md-6">
											<label> Phone Number: </label>
											<input placeholder="Phone Number" class="form-add-control" name="phone" type="text" required="">
											<label> Post Code: </label>
											<input placeholder="Post Code" class="form-add-control" name="postcode" min=0 type="number" required="">
											<label> Cover Letter: </label>
											<textarea rows="4" cols="20" maxlength=1000 class="form-add-control" name="cover" required=""></textarea>
											<label> Resume: </label>
											<textarea rows="4" cols="20" maxlength=1000 class="form-add-control" name="resume" required=""></textarea>
										</div>
									    <div class="row">
									    	<div class="col-sm-8">
									       		<label></label>
									       	</div>
									       	<div class="col-sm-4">
									       		<input type="submit" name="addItem" value="Update Application" class="btn btn-primary"> 
									       	</div>
									   </div>
									</form>
								</div>
		            
		       					
		       					<div align="CENTER">
		       						<c:choose>
			       						<c:when test="${review != null}">
				       						<h4> Your Application has been reviewed</h4>
				       						<label>Comments by reviewer:</label>
				       						<p> ${review.comments} </p>
				       						<label>Their decision was: </label>
				       						<p> ${review.decision}</p>
				       						<c:if test="${review.decision eq 'shortlist'  && app.status != 'job accepted' && app.status != 'job rejected'}">
				       							<div class="row">
				       								<form method="post" action="jobInvResponse" class="form-add">
				       									<input type="hidden" name="appid" value="<c:out value="${app.appId}"/>"/>
					       								<label> Decision: </label>
						       							<input type="radio" name="decision" value="job accepted">Accept
														<input type="radio" name="decision" value="job rejected">Reject<br>
														<input type="submit" name="Submit" value="Submit" class="btn btn-success">
				       								</form>
				       							</div>
			       							</c:if>
										</c:when>
									</c:choose>
								</div>
		       				</c:when>
		       				<c:when test="${user.role eq 'reviewer' && user.department eq assApp.department}">
		       					<c:if test="${autocheck != null && autocheck.result != null}">
		       						<label>Auto Check Results:</label> <br>
		       						<p>${autocheck.result}</p>
		       					</c:if>
		       					<label> Comment about application:</label>
		       					<form method="post" action="submitReview" class="form-add">
		       						<input type="hidden" name="appid" value="<c:out value="${app.appId}"/>"/>
		       						<input type="hidden" name="uid" value="<c:out value="${user.uId}"/>"/>
		       						<textarea rows="4" cols="20" maxlength=1000 class="form-add-control" name="comment" required=""></textarea>
		       						<div class="row">
		       							<label> Decision: </label>
		       							<input type="radio" name="decision" value="shortlisted">Shortlist
										<input type="radio" name="decision" value="rejected by reviewer">Reject<br>
									</div>
		       						<input type="submit" name="Submit" value="Submit" class="btn btn-success">
		       					</form>	
		       				</c:when>
		       				<c:when test="${user.role eq 'manager'}">
		       					<form method="get" action="processApplication" class="form-add">
		       						<div class="row">
		       							<label> Assign to team: </label>
		       							<c:if test="${userList != null}">
			       							<c:forEach var="user" items="${userList}" varStatus="i">
			       								<c:if test="${user.role eq 'reviewer'}">
				       								<input type="radio" name="team" value="<c:out value="${user.department}"/>">${user.department}
				       							</c:if>
											</c:forEach>
										</c:if>
									</div>
		       						<input type="hidden" name="appid" value="<c:out value="${app.appId}"/>"/>
		       						<input type="submit" name="Submit" value="Send to Processing" class="btn btn-success">
		       					</form>
		       				</c:when>
		       			</c:choose>
	        	        
	            	</div>
	            </div>
		
			</div>
			</c:when>
			<c:otherwise>
				<h2> There is no application with that id</h2>
			</c:otherwise>
		</c:choose>
	</body>
</html>