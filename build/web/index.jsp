<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Leave Management System </title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
      <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        /* Additional Custom CSS */
        body {
            background-image: url('Assets/bk.jpg'); 
            background-size: cover;
            background-position: center;
            height: 100vh; /* Ensure full height */
            
        }
        .container {
            margin-top: 20px;
        }
        .option {
            margin: 20px;
        }
        .btn-scale:hover {
        transform: scale(1.1); 
        transition: transform 0.3s ease; 
    }
    </style>
</head>
<body>
    <!-- Bootstrap Simple Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#EEEEEE; opacity:.9">
        <a class="navbar-brand" href="#"><b>Employee Leave Management System</b></a>
        <ul class="navbar-nav ml-auto">
                <li class="nav-item mr-3">
                    <a class="nav-link btn btn-primary text-white btn-scale" href="loginE.jsp"> <i class="fas fa-user"></i>  Employee Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-success text-white btn-scale" href="loginA.jsp"> <i class="fas fa-user-shield"></i> Admin Login</a>
                </li>
            </ul>
    </nav>

    
</body>
</html>
