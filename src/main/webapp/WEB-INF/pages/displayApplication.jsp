<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Application ${app.appId}</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="custom.css" />
	</head>
	<body>
		<jsp:include page="includes/header.jsp" />
		<div style="margin-top:5%"/>
	
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
	            <div class="controls" align="CENTER">
        	        <a href="updateApplication?appid=${app.appId}" class="btn btn-success">Update</a>
            	</div>
            </div>
	
		</div>
	</body>
</html>