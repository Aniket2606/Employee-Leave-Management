<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EMS Admin</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            /* Custom styles */
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }

            .sidebar {
                height: 100vh;
                background-color: #333; /* Dark background color */
                color: #fff; /* Text color */
            }
            .navbar-text-center .navbar-brand {
                float: none;
            }
            .notification-buttons {
                position: absolute;
                top: 6px;
                right: -3px;
            }
            .square{
                height: 70px;
                width: 70px;
            }
            .number{
                margin-top:-5px;
            }
            .btn-scale:hover {
                transform: scale(1.1);
                transition: transform 0.3s ease;
            }
        </style>
    </head>