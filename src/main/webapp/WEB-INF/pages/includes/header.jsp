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
	            <form method="get" action="dispatcher" class="navbar-form navbar-left">
		            <input type="hidden" name="operation" value="searchitems">
		            <div class="form-group">
		                <input placeholder="Search for item" class="form-control" name="name" type="text" />
		            </div>
		            <input type="submit" value="Search" class="btn btn-success" />
		            <a href="advancedSearch.jsp" class="btn btn-link btn-sm">Advanced Search</a>
	            </form>
	            
	            <div class="btn-group navbar-right" style="padding-top: 8px">
	            	<form action="viewLogin" method="get">
						<input class="btn btn-sm btn-primary" type="submit" value="Login">
					</form>
	            </div>
        </div>
        
    </div>
</div>