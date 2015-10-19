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
	                <div class="controls" align="CENTER">
	        	        <a href="apply?jobid=${job.jobId}" class="btn btn-success">Apply</a>
	            	</div>
	            </div>
            </div>
	
		</div>
	</body>
</html>