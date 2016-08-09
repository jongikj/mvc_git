<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>한빛아카데미</title>
<link rel="stylesheet" href="${css}/global.css" />
<script>
    function showAlert() {
        alert('you click third!');
    }
    
    function clickme() {
        document.getElementsByTagName('button')[0].onclick = showAlert;
    }
    
    window.onload = clickme;
</script>
</head>
<body>