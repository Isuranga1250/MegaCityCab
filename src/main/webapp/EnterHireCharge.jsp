<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mega - City Cab | Enter Hire Charge</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="CSS/css/Style1.css" rel="stylesheet">
    <link rel="shortcut icon" href="./CSS/img/carlogo.png" type="image/">
    
     <link href="CSS/Vendor/aos/aos.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="CSS/Vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="CSS/Vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="CSS/Vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="CSS/css/style.css" rel="stylesheet">
    
    
    <style>
        :root {
            --primary-color: #4154f1;
            --secondary-color: #012970;
            --accent-color: #0ea2bd;
            --light-bg: #f6f9ff;
            --table-hover: rgba(65, 84, 241, 0.05);
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-bg);
            color: #444444;
        }
        
        .logo span {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--secondary-color);
        }
        
        .header {
            background: white;
            box-shadow: 0px 2px 20px rgba(1, 41, 112, 0.1);
        }
        
        .navbar a {
            color: var(--secondary-color);
            font-weight: 500;
            transition: 0.3s;
        }
        
        .navbar a:hover, 
        .navbar .active {
            color: var(--primary-color);
        }
        
        .page-title {
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
        }
        
        .main-content {
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(1, 41, 112, 0.1);
            padding: 2rem;
            margin-bottom: 3rem;
        }
        
        .search-bar {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(1, 41, 112, 0.1);
            margin-bottom: 2rem;
        }
        
        .table {
            vertical-align: middle;
        }
        
        .table thead th {
            background-color: var(--secondary-color);
            color: white;
            font-weight: 600;
            vertical-align: middle;
        }
        
        .table tbody tr:hover {
            background-color: var(--table-hover);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }
        
        .btn-success {
            transition: all 0.3s;
        }
        
        .btn-success:hover {
            transform: translateY(-2px);
        }
        
        .footer {
            background-color: white;
            border-top: 1px solid #e0e0e0;
            padding: 2rem 0;
            text-align: center;
            color: #777;
        }
        
        .badge-pending {
            background-color: #ffd700;
            color: #333;
        }
        
        .page-header {
            position: relative;
            text-align: center;
            padding-top: 100px;
            padding-bottom: 30px;
        }
        
        .icon-service {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        @media (max-width: 992px) {
            .table-responsive {
                overflow-x: auto;
            }
        }
    </style>
</head>

<body>

<!-- ======= Header ======= -->
 <header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="index.jsp" class="logo d-flex align-items-center">
        <img src="CSS/img/car.png" alt="Mega City Cab Logo">
        <span class="ms-2 fw-bold">Mega - City Cab</span>
      </a>

      <nav id="navbar" class="navbar">
        <ul class="d-flex align-items-center">
          <li><a class="nav-link scrollto" href="index.jsp">Home</a></li>
          <li><a class="nav-link scrollto" href="contact.jsp">Contact</a></li>
          <c:if test="${not empty Driver_Name}">
            <li class="dropdown">
              <a href="#"><span>Welcome ${Driver_Name}</span> <i class="bi bi-chevron-down"></i></a>
              <ul>
                <li><a href="EnterHireCharge.jsp">Enter Hire Charge</a></li>
                <li><a href="FinishJourney.jsp">Finish Journey</a></li>
                <li><a href="CabBookingsDriver.jsp">My Cab Rides</a></li>
                <li><a href="AssignedCab.jsp">Assigned Cab</a></li>
                <li><a href="javascript:void(0);" onclick="confirmLogout()">Logout</a></li>
              </ul>
            </li>
          </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
    </div>
  </header><!-- End Header -->

<%
    // Retrieve session attributes safely
    Integer Driver_ID = (Integer) session.getAttribute("Driver_ID");
    String Driver_Name = (String) session.getAttribute("Driver_Name");

    // Check if Driver_ID exists in session
    if (Driver_ID == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String searchTerm = request.getParameter("search");
%>

<!-- Main Content -->
<div class="container mt-5 pt-5">
    <div class="page-header mb-4">
        <div class="icon-service">
            <i class="fas fa-taxi"></i>
        </div>
        <h1 class="page-title">Enter Hire Charge</h1>
        <p class="text-muted">Manage your pending hire charges</p>
    </div>

    <!-- Search Bar -->
    <div class="search-bar">
        <form method="GET" action="" class="d-flex align-items-center gap-3">
            <div class="flex-grow-1">
                <div class="input-group">
                    <span class="input-group-text bg-light border-0">
                        <i class="fas fa-search text-muted"></i>
                    </span>
                    <input type="text" name="search" class="form-control border-0 shadow-none" placeholder="Search by booking details..." value="<%= searchTerm != null ? searchTerm : "" %>">
                </div>
            </div>
            <button type="submit" class="btn btn-primary px-4">
                Search
            </button>
        </form>
        <% if (searchTerm != null && !searchTerm.trim().isEmpty()) { %>
            <div class="mt-2">
                <span class="badge bg-light text-dark p-2">
                    <i class="fas fa-filter me-1"></i> Showing results for "<%= searchTerm %>"
                    <a href="EnterHireCharge.jsp" class="ms-2 text-danger text-decoration-none"><i class="fas fa-times-circle"></i></a>
                </span>
            </div>
        <% } %>
    </div>

    <!-- Booking Table -->
    <div class="main-content">
        <div class="table-responsive">
            <table class="table align-middle table-hover">
                <thead>
                    <tr>
                        <th class="text-center" width="120">Actions</th>
                        <th>Booking ID</th>
                        <th>Vehicle</th>
                        <th>Customer</th>
                        <th>Route</th>
                        <th>Schedule</th>
                        <th>Payment Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            // Load the database driver
                            Class.forName("com.mysql.jdbc.Driver");
                            // Establish connection
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");

                            // SQL query to join booking_table and filter by Driver_ID
                            String query = "SELECT booking_table.Booking_ID, booking_table.Car_Name, booking_table.Car_Brand, " +
                                        "booking_table.Car_Number_Plate, booking_table.Car_Colour, booking_table.Driver_Name, booking_table.Driver_Telephone_Number, booking_table.Car_Booking_Price, " +
                                        "booking_table.User_Telephone_Number, booking_table.User_Username, booking_table.User_Address, booking_table.User_Current_Location, booking_table.User_Destination, " +
                                        "booking_table.Booked_Date, booking_table.Booked_Time, booking_table.Hire_Charge, booking_table.Total_Payable_Amount " +
                                        "FROM booking_table WHERE Driver_ID = ? AND Hire_Charge = 'Will be Notified Soon' AND Total_Payable_Amount = 'Will be Notified Soon'";

                            // Add search filtering if searchTerm exists
                            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                query += " AND (booking_table.Car_Name LIKE ? OR " +
                                        "booking_table.User_Username LIKE ? OR " +
                                        "booking_table.Booked_Date LIKE ? OR " +
                                        "booking_table.Booked_Time LIKE ? OR " +
                                        "booking_table.User_Current_Location LIKE ? OR " +
                                        "booking_table.User_Destination LIKE ?)";
                            }

                            // Prepare the statement
                            PreparedStatement ps = con.prepareStatement(query);
                            ps.setInt(1, Driver_ID);

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

                            // Loop through the result set
                            while (rs.next()) {
                                hasResults = true;
                    %>
                    <tr>
                        <td class="text-center">
                            <a href='ConfirmHireCharge.jsp?Booking_ID=<%= rs.getInt("Booking_ID") %>' class='btn btn-sm btn-success'>
                                <i class="fas fa-dollar-sign me-1"></i> Set Price
                            </a>
                        </td>
                        <td>
                            <span class="fw-bold">#<%= rs.getString("Booking_ID") %></span>
                        </td>
                        <td>
                            <div class="d-flex flex-column">
                                <span class="fw-medium"><%= rs.getString("Car_Brand") %> <%= rs.getString("Car_Name") %></span>
                                <small class="text-muted"><%= rs.getString("Car_Number_Plate") %>, <%= rs.getString("Car_Colour") %></small>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex flex-column">
                                <span class="fw-medium"><%= rs.getString("User_Username") %></span>
                                <small class="text-muted"><i class="fas fa-phone-alt me-1"></i><%= rs.getString("User_Telephone_Number") %></small>
                                <small class="text-muted text-truncate" style="max-width: 150px;"><i class="fas fa-map-marker-alt me-1"></i><%= rs.getString("User_Address") %></small>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex flex-column">
                                <div class="mb-1">
                                    <span class="badge bg-info text-dark">From</span>
                                    <span class="ms-1"><%= rs.getString("User_Current_Location") %></span>
                                </div>
                                <div>
                                    <span class="badge bg-success text-white">To</span>
                                    <span class="ms-1"><%= rs.getString("User_Destination") %></span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex flex-column">
                                <div><i class="far fa-calendar-alt me-1"></i> <%= rs.getString("Booked_Date") %></div>
                                <div><i class="far fa-clock me-1"></i> <%= rs.getString("Booked_Time") %></div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex flex-column">
                                <div class="mb-1">
                                    <span class="badge rounded-pill bg-warning text-dark">
                                        <i class="fas fa-exclamation-circle me-1"></i> Pending Charge
                                    </span>
                                </div>
                                <small class="text-muted">Base Price: $<%= rs.getString("Car_Booking_Price") %></small>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                            // If no results are found, display a message
                            if (!hasResults) {
                    %>
                    <tr>
                        <td colspan="7" class="text-center py-5">
                            <div class="d-flex flex-column align-items-center">
                                <i class="fas fa-search fa-3x text-muted mb-3"></i>
                                <h5 class="text-muted">No pending hire charges found</h5>
                                <p class="text-muted">All your bookings have prices set or no bookings are available</p>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                            // Close resources
                            rs.close();
                            ps.close();
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                    %>
                    <tr>
                        <td colspan="7" class="text-center py-4">
                            <div class="alert alert-danger">
                                <i class="fas fa-exclamation-triangle me-2"></i>
                                An error occurred while fetching data. Please try again later.
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

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row gy-4">
          <div class="col-lg-4 col-md-12 footer-info">
            <a href="index.jsp" class="logo d-flex align-items-center">
              <img src="CSS/img/car.png" alt="">
              <span>𝐂𝐢𝐭𝐲 𝐂𝐚𝐛</span>
            </a>
            <p>At Mega City Cab, we provide reliable and affordable car rentals for seamless travel. Whether exploring Colombo or road-tripping across Sri Lanka, we offer the perfect vehicle for every journey.
                           Our fleet includes compact cars for city driving and spacious SUVs for family trips. With easy booking, 24/7 support, and well-maintained vehicles, we ensure every trip is safe, comfortable, and memorable.</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
              <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
              <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
              <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
            </div>
          </div>

          <div class="col-lg-2 col-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="index.jsp">Home</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="about.jsp">About us</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Services</a></li>
              
            </ul>
          </div>

          <div class="col-lg-2 col-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Daily Car Rentals</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Long-Term Rentals</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Airport Transfers</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Skill Development</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Luxury Car Hire</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">24/7 Roadside Assistance</a></li>
            </ul>
          </div>

          <div class="col-lg-2 col-6 footer-links">
            <h4>Other Links</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="privacy.jsp">Privacy Policy</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="terms.jsp">Terms & Conditions</a></li>
              
            </ul>
          </div>

          <div class="col-lg-2 col-md-12 footer-contact text-center text-md-start">
            <h4>Contact Us</h4>
            <p>
              No 141/2, <br>
              Galle Rd, Colombo,<br>
              Sri Lanka <br><br>
              <strong>Phone:</strong> +001 5589 55488<br>
              <strong>Email:</strong> info@megacitycab.com<br>
            </p>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Mega City Cab</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/flexstart-bootstrap-startup-template/ -->
        Designed by Pasindu Isuranga
      </div>
    </div>
  </footer><!-- End Footer -->

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Set current year in footer
        document.querySelector('.current-year').textContent = new Date().getFullYear();
        
        // Mobile navigation toggle
        const mobileNavToggle = document.querySelector('.mobile-nav-toggle');
        if (mobileNavToggle) {
            mobileNavToggle.addEventListener('click', function() {
                document.querySelector('#navbar').classList.toggle('navbar-mobile');
                this.classList.toggle('bi-list');
                this.classList.toggle('bi-x');
            });
        }
    });

    // Function to confirm logout
    function confirmLogout() {
        Swal.fire({
            title: 'Logout Confirmation',
            text: "Are you sure you want to log out?",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, logout'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "LogoutProcess.jsp";
            }
        });
    }
    
    // Fallback if SweetAlert is not available
    if (typeof Swal === 'undefined') {
        function confirmLogout() {
            if (confirm("Are you sure you want to log out?")) {
                window.location.href = "LogoutProcess.jsp";
            }
        }
    }
</script>

</body>
</html>