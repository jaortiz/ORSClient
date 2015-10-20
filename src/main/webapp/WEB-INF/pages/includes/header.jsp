<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
	        <a href="/ORS_Client" >
	        	<div class="navbar-header navbar-brand">
	          		Home
	        	</div>
        	</a>
        
        <div class="navbar-collapse collapse">
	            <form action="SearchJobs" method="get" class="navbar-form navbar-left">
					<div class="form-group">
		                <input placeholder="Search by job name" class="form-control" name="jobname" type="text" />
		            </div>
		            <input type="submit" value="Search" class="btn btn-success" />
		            <a href="advancedSearch" class="btn btn-link btn-sm">Advanced Search</a>
				</form>
	            
	            
	            
	            
	            <div class="btn-group navbar-right" style="float: right; padding-top: 8px;">
		           	<c:choose>
			           	<c:when test="${user != null}">
			           		<c:if test="${user.role eq 'reviewer'}">
			           			<form action="TeamApplications" method="get">
									<input class="btn btn-sm btn-primary" type="submit" value="Review Applications">
								</form>
							</c:if>
							<c:if test="${user.role eq 'manager'}">
								
								<form action="viewJobs" method="get">
									<input class="btn btn-sm btn-primary" type="submit" value="View Job Postings">
								</form>
								
								<form action="viewApplications" method="get">
									<input class="btn btn-sm btn-primary" type="submit" value="View Applications">
								</form>
								
								<form action="viewCreateJob" method="get">
									<input class="btn btn-sm btn-primary" type="submit" value="Create Job">
								</form>
							</c:if>
			           	</c:when>
			           	<c:otherwise>
			            	<form action="viewLogin" method="get">
								<input class="btn btn-sm btn-primary" type="submit" value="Login">
							</form>
		            	</c:otherwise>
	            	</c:choose>
	            </div>

        </div>
        
    </div>
</div>

	            <c:if test="${user.role eq 'manager'}">
	            <div style="margin-top:10%"/>
	            </c:if>