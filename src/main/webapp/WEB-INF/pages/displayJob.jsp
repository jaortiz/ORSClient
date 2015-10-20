<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>${job.jobName}</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="custom.css" />
	</head>
	<body>
		<jsp:include page="includes/header.jsp" />
		<div style="margin-top:5%"/>
	
		<div class="container" style="width:55%">
			<header>
				<h1>${job.jobName}</h1>
			</header>
			<br>
			
			<div class="col-md-9" style="margin-left: 10px;">
	            
	            <div class="tab-content col-md-12">
	                <div class="tab-pane fade in active">
	                    <div class="col-md-6">
	                        <h4>
	                            <b>Description:</b>
	                        </h4>
	                        <div class="details-column">
	                            ${job.description}
	                        </div>
	                        <h4>
	                             <b>Position:</b>
	                        </h4>
	                        <div class="details-column">
	                            ${job.position}
	                        </div>
	                        <h4>
	                        	<b>Closing Date:</b> 
	                        </h4>
	                        <div class="details-column">
	                            ${job.closingDate}
	                        </div>
	                    </div>
	                    <div class="col-md-6">
	                        <h4>
	                            <b>Location:</b>
	                        </h4>
                	        <div class="details-column">
	                            ${job.location}
	                        </div>
	                        <h4>
								<b>Salary:</b>
	                        </h4>
	                        <div class="details-column">
								${job.salary}
	                        </div>
	                        <h4>
								<b>Status:</b>
	                        </h4>
	                        <div class="details-column">
								${job.status}
	                        </div>
	                    </div>
	                </div>
                	<c:choose>
			           	<c:when test="${user != null}">
			           		<c:if test="${user.role eq 'manager'}">
								<form action="archive" method="get">
									<input type="hidden" name="jobID" value="${job.jobId}">
									<input class="btn btn-sm btn-primary" type="submit" value="Archive Job">
								</form>
								<br>
								<br>
								<div class="container">
									<form method="post" action="updateJob" class="form-add">
										<div class="col-md-6">
											<label> Job Name: </label>
											<input placeholder="job name" maxlength=100 class="form-add-control" name="jobName" type="text" required="">
											<label> Closing Date:</label>
											<input placeholder="closing date" class="form-add-control" name="closingDate" type="text" required="">
											<label> Salary: </label>
											<input placeholder="salary" class="form-add-control" name="salary" type="number" required="">
											<label> Position: </label>
											<input placeholder="position" class="form-add-control" name="position" type="text" required="">
										</div>
										<div class="col-md-6">
											<label> Location: </label>
											<input placeholder="location" class="form-add-control" name="location" type="text" required="">
											<label> Description: </label>
											<textarea rows="4" cols="20" maxlength=1000 class="form-add-control" name="description" required=""></textarea>
										</div>
									    <div class="row">
									    	<div class="col-sm-8">
									       		<label></label>
									       	</div>
									       	<div class="col-sm-4">
									       		<input type="hidden" name="jobID" value="${job.jobId}">
									       		
									       		<input type="submit" name="updateJob" value="update Job" class="btn btn-primary"> 
									       	</div>
									   </div>
									</form>
								</div>
							</c:if>
			           	</c:when>
			           	<c:otherwise>
			                <div class="controls" align="CENTER">
			        	        <a href="apply?jobid=${job.jobId}" class="btn btn-success">Apply</a>
			            	</div>
		            	</c:otherwise>
	            	</c:choose>
	            </div>
            </div>
	
		</div>
	</body>
</html>