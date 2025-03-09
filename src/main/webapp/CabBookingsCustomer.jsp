<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Mega City Cab - Booking List">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mega City Cab - My Bookings</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="./CSS/img/carlogo.png" type="image/x-icon">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    
    <!-- Custom CSS -->
    <link href="CSS/css/style.css" rel="stylesheet">
    
    <style>
        /* Custom Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
        }
        
        .header {
            background-color: #ffffff;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        
        .logo img {
            height: 40px;
            margin-right: 10px;
        }
        
        .card {
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .table {
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .table th {
            background-color: #0d6efd;
            color: white;
            font-weight: 500;
        }
        
        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .btn-primary {
            background-color: #0d6efd;
            border: none;
            border-radius: 5px;
            padding: 8px 20px;
        }
        
        .btn-primary:hover {
            background-color: #0b5ed7;
        }
        
        .search-bar {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }
        
        .booking-title {
            color: #0d6efd;
            font-weight: 700;
            position: relative;
            margin-bottom: 30px;
        }
        
        .booking-title:after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: -10px;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background-color: #0d6efd;
        }
        
        footer {
            background-color: #212529;
            color: white;
        }
        
        /* Print Styles */
        @media print {
            body * {
                visibility: hidden;
            }
            .modal-content * {
                visibility: visible;
            }
            .modal {
                position: absolute;
                left: 0;
                top: 0;
                margin: 0;
                padding: 0;
                overflow: visible!important;
            }
            .modal-dialog {
                width: 100%;
                max-width: 100%;
                margin: 0;
            }
            .modal-header .btn-close, .modal-footer {
                display: none !important;
            }
            .print-header {
                display: block !important;
                text-align: center;
                margin-bottom: 20px;
            }
        }
        
        .print-header {
            display: none;
        }
    </style>
</head>

<body>
    <!-- Header -->
    <header id="header" class="header fixed-top">
        <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
            <a href="index.jsp" class="logo d-flex align-items-center">
                <img src="CSS/img/car.png" alt="Mega City Cab Logo">
                <span class="fw-bold">Mega City Cab</span>
            </a>

            <nav id="navbar" class="navbar">
                <ul class="d-flex align-items-center m-0 p-0">
                    <li><a class="nav-link px-3" href="index.jsp">Home</a></li>
                    <li><a class="nav-link px-3" href="about.jsp">About</a></li>
                    <li><a class="nav-link px-3" href="shop.jsp">Cabs</a></li>
                    <li><a class="nav-link px-3" href="services.jsp">Services</a></li>
                    <li><a class="nav-link px-3" href="contact.jsp">Contact</a></li>
                    <li><a class="nav-link px-3" href="help.jsp">Help</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>
        </div>
    </header>

    <%
        // Retrieve session attributes safely
        Integer User_ID = (Integer) session.getAttribute("User_ID");
        String User_Username = (String) session.getAttribute("User_Username");

        // Check if User_ID exists in session
        if (User_ID == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String searchTerm = request.getParameter("search");
    %>

    <!-- User Navigation Bar -->
    <c:choose>
        <c:when test="${not empty User_Username && not empty User_ID}">
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom shadow-sm mt-5 pt-3">
                <div class="container">
                   
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav2" aria-controls="navbarNav2" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav2">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <button onclick="confirmLogout()" class="btn btn-outline-danger">
                                    <i class="bi bi-box-arrow-right me-1"></i>Logout
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </c:when>
    </c:choose>

    <!-- Main Content -->
    <div class="container py-5 my-5">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h1 class="booking-title"><i class="bi bi-car-front me-2"></i>My Cab Bookings</h1>
            </div>
        </div>

        <!-- Search Bar -->
        <div class="search-bar mb-4">
            <form method="GET" action="" class="d-flex align-items-center">
                <div class="input-group">
                    <span class="input-group-text bg-primary text-white"><i class="fas fa-search"></i></span>
                    <input type="text" name="search" class="form-control" placeholder="Search by date, time, location or destination..." value="<%= searchTerm != null ? searchTerm : "" %>">
                    <button type="submit" class="btn btn-primary">
                        Search
                    </button>
                </div>
            </form>
            <% if (searchTerm != null && !searchTerm.trim().isEmpty()) { %>
                <p class="text-muted mt-3"><i class="bi bi-info-circle me-2"></i>Showing results for "<%= searchTerm %>"</p>
            <% } %>
        </div>

        <%
            try {
                // Load the database driver
                Class.forName("com.mysql.jdbc.Driver");
                // Establish connection
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");

                // SQL query to join booking_table and filter by User_ID
                String query = "SELECT booking_table.Booking_ID, booking_table.Car_Name, booking_table.Car_Brand, " +
                               "booking_table.Car_Number_Plate, booking_table.Car_Colour, booking_table.Driver_Name, booking_table.Driver_Telephone_Number, booking_table.Car_Booking_Price, " +
                               "booking_table.User_Telephone_Number, booking_table.User_Address, booking_table.User_Current_Location, booking_table.User_Destination, " +
                               "booking_table.Booked_Date, booking_table.Booked_Time, booking_table.Hire_Charge, booking_table.Total_Payable_Amount " +
                               "FROM booking_table WHERE User_ID = ?";

                // Add search filtering if searchTerm exists
                if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                    query += " AND (booking_table.Car_Name LIKE ? OR " +
                             "booking_table.Driver_Name LIKE ? OR " +
                             "booking_table.Booked_Date LIKE ? OR " +
                             "booking_table.Booked_Time LIKE ? OR " +
                             "booking_table.User_Current_Location LIKE ? OR " +
                             "booking_table.User_Destination LIKE ?)";
                }

                // Prepare the statement
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, User_ID);

                // Bind search term parameters
                if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                    String searchPattern = "%" + searchTerm + "%";
                    ps.setString(2, searchPattern);
                    ps.setString(3, searchPattern);
                    ps.setString(4, searchPattern);
                    ps.setString(5, searchPattern);
                    ps.setString(6, searchPattern);
                    ps.setString(7, searchPattern);
                }

                // Execute the query
                ResultSet rs = ps.executeQuery();
                boolean hasResults = false;
        %>

        <!-- Booking Table -->
        <div class="card">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover table-striped mb-0">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Car</th>
                                <th>Driver</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Total Amount</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                while (rs.next()) {
                                    hasResults = true;
                            %>
                            <tr>
                                <td>#<%= rs.getString("Booking_ID") %></td>
                                <td>
                                    <strong><%= rs.getString("Car_Brand") %> <%= rs.getString("Car_Name") %></strong><br>
                                    <small class="text-muted"><%= rs.getString("Car_Colour") %>, <%= rs.getString("Car_Number_Plate") %></small>
                                </td>
                                <td>
                                    <%= rs.getString("Driver_Name") %><br>
                                    <small class="text-muted"><i class="bi bi-telephone"></i> <%= rs.getString("Driver_Telephone_Number") %></small>
                                </td>
                                <td><%= rs.getString("User_Current_Location") %></td>
                                <td><%= rs.getString("User_Destination") %></td>
                                <td><%= rs.getString("Booked_Date") %></td>
                                <td><%= rs.getString("Booked_Time") %></td>
                                <td><strong><%= rs.getString("Total_Payable_Amount") %></strong></td>
                                <td>
                                    <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#detailsModal<%= rs.getString("Booking_ID") %>">
                                        <i class="bi bi-info-circle"></i>
                                    </button>
                                    
                                    <!-- Modal for Details -->
                                    <div class="modal fade" id="detailsModal<%= rs.getString("Booking_ID") %>" tabindex="-1" aria-labelledby="detailsModalLabel<%= rs.getString("Booking_ID") %>" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header bg-primary text-white">
                                                    <h5 class="modal-title" id="detailsModalLabel<%= rs.getString("Booking_ID") %>">Booking Details #<%= rs.getString("Booking_ID") %></h5>
                                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="print-header">
                                                        <h2>Mega City Cab - Booking Receipt</h2>
                                                        <p>Booking ID: #<%= rs.getString("Booking_ID") %></p>
                                                        <p>Date: <%= rs.getString("Booked_Date") %> | Time: <%= rs.getString("Booked_Time") %></p>
                                                        <hr>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <h6 class="text-primary">Car Information</h6>
                                                            <ul class="list-group list-group-flush mb-3">
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Car Name:</span>
                                                                    <span class="fw-bold"><%= rs.getString("Car_Name") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Car Brand:</span>
                                                                    <span class="fw-bold"><%= rs.getString("Car_Brand") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Plate Number:</span>
                                                                    <span class="fw-bold"><%= rs.getString("Car_Number_Plate") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Color:</span>
                                                                    <span class="fw-bold"><%= rs.getString("Car_Colour") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Base Price:</span>
                                                                    <span class="fw-bold">$<%= rs.getString("Car_Booking_Price") %></span>
                                                                </li>
                                                            </ul>
                                                            
                                                            <h6 class="text-primary">Driver Information</h6>
                                                            <ul class="list-group list-group-flush mb-3">
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Driver Name:</span>
                                                                    <span class="fw-bold"><%= rs.getString("Driver_Name") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Phone Number:</span>
                                                                    <span class="fw-bold"><%= rs.getString("Driver_Telephone_Number") %></span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        
                                                        <div class="col-md-6">
                                                            <h6 class="text-primary">Trip Information</h6>
                                                            <ul class="list-group list-group-flush mb-3">
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Your Phone:</span>
                                                                    <span class="fw-bold"><%= rs.getString("User_Telephone_Number") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Your Address:</span>
                                                                    <span class="fw-bold"><%= rs.getString("User_Address") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Pickup Location:</span>
                                                                    <span class="fw-bold"><%= rs.getString("User_Current_Location") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Destination:</span>
                                                                    <span class="fw-bold"><%= rs.getString("User_Destination") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Date:</span>
                                                                    <span class="fw-bold"><%= rs.getString("Booked_Date") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Time:</span>
                                                                    <span class="fw-bold"><%= rs.getString("Booked_Time") %></span>
                                                                </li>
                                                            </ul>
                                                            
                                                            <h6 class="text-primary">Payment Information</h6>
                                                            <ul class="list-group list-group-flush">
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Hire Charge:</span>
                                                                    <span class="fw-bold"><%= rs.getString("Hire_Charge") %></span>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between">
                                                                    <span>Total Amount:</span>
                                                                    <span class="fw-bold text-primary"><%= rs.getString("Total_Payable_Amount") %></span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary" onclick="printDetails('detailsModal<%= rs.getString("Booking_ID") %>')">
                                                        <i class="bi bi-printer me-1"></i>Print Details
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                                if (!hasResults) {
                            %>
                            <tr>
                                <td colspan="9" class="text-center py-5">
                                    <div class="text-center">
                                        <i class="bi bi-calendar-x" style="font-size: 3rem; color: #ccc;"></i>
                                        <h5 class="mt-3">No Bookings Found</h5>
                                        <p class="text-muted">You haven't made any bookings yet or no results match your search.</p>
                                        <a href="shop.jsp" class="btn btn-primary mt-2">Browse Available Cabs</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="mt-4 text-center">
            <a href="shop.jsp" class="btn btn-outline-primary">
                <i class="bi bi-plus-circle me-2"></i>Book a New Cab
            </a>
        </div>

        <%
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <div class="alert alert-danger">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            An error occurred while fetching booking data. Please try again later.
        </div>
        <%
            }
        %>
    </div>

    <!-- Footer -->
    <footer id="footer" class="footer mt-5">
        <div class="footer-top py-5">
            <div class="container">
                <div class="row gy-4">
                    <div class="col-lg-4 col-md-12 footer-info">
                        <a href="index.html" class="logo d-flex align-items-center">
                            <img src="CSS/img/car.png" alt="">
                            <span>Mega City Cab</span>
                        </a>
                        <p>At Mega City Cab, we provide reliable and affordable car rentals for seamless travel. Whether exploring Colombo or road-tripping across Sri Lanka, we offer the perfect vehicle for every journey.</p>
                        <div class="social-links mt-3">
                            <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>

                    <div class="col-lg-2 col-6 footer-links">
                        <h4>Useful Links</h4>
                        <ul class="list-unstyled">
                            <li><i class="bi bi-chevron-right"></i> <a href="index.jsp">Home</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="about.jsp">About us</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Services</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-2 col-6 footer-links">
                        <h4>Our Services</h4>
                        <ul class="list-unstyled">
                            <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Daily Car Rentals</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Long-Term Rentals</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Airport Transfers</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Luxury Car Hire</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-4 col-md-12 footer-contact text-md-start">
                        <h4>Contact Us</h4>
                        <p>
                            No 141/2, <br>
                            Galle Rd, Colombo,<br>
                            Sri Lanka <br><br>
                            <strong><i class="bi bi-telephone me-2"></i>Phone:</strong> +001 5589 55488<br>
                            <strong><i class="bi bi-envelope me-2"></i>Email:</strong> info@megacitycab.com<br>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="copyright py-4 text-center">
                &copy; Copyright <strong><span>Mega City Cab</span></strong>. All Rights Reserved
            </div>
        </div>
    </footer>

    <!-- Back to top button -->
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- JavaScript Dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        // Function to confirm logout
        function confirmLogout() {
            var result = confirm("Are you sure you want to log out?");
            
            if (result) {
                window.location.href = "LogoutProcess.jsp";
            } else {
                alert("You are still logged in.");
            }
        }
        
        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
        
        // Mobile Navigation
        document.addEventListener("DOMContentLoaded", function () {
            const menuIcon = document.querySelector(".mobile-nav-toggle");
            const navbar = document.querySelector("#navbar");
            
            if (menuIcon) {
                menuIcon.addEventListener("click", function() {
                    navbar.classList.toggle("navbar-mobile");
                    this.classList.toggle("bi-list");
                    this.classList.toggle("bi-x");
                });
            }
        });
        
        // Function to print the modal details
        function printDetails(modalId) {
            // Get the modal element
            var modal = document.getElementById(modalId);
            
            // Open print dialog
            window.print();
        }
    </script>
</body>
</html>