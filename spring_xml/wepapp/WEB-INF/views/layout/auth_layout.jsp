<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<tiles:insertAttribute name="headerInclude"/>
</head>
<body>
	<tiles:insertAttribute name="body"/>			
	<tiles:insertAttribute name="script"/>
</body>
</html>

