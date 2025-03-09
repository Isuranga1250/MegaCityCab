<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
<%@page import="java.sql.*, java.util.Base64, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Your Assigned Cab - Mega City Cab</title>
  <meta content="View your assigned cab details as a driver" name="description">
  
  <!-- Favicons -->
  <link rel="shortcut icon" href="./CSS/img/carlogo.png" type="image/">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Montserrat:400,500,600,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="CSS/Vendor/aos/aos.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="CSS/Vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="CSS/Vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="CSS/Vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="CSS/css/style.css" rel="stylesheet">
  
  <style>
    /* Updated modern styles for Assigned Cab page */
    :root {
      --primary-color: #4361ee;
      --secondary-color: #3a0ca3;
      --success-color: #2ec4b6;
      --warning-color: #ff9f1c;
      --danger-color: #e71d36;
      --light-color: #f8f9fa;
      --dark-color: #212529;
      --gray-color: #6c757d;
    }
    
    body {
      font-family: 'Poppins', sans-serif;
      color: #444;
      background-color: #fcfcfc;
    }
    
    /* Header styling */
    #header {
      box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
      background: #fff;
    }
    
    #header .logo {
      text-decoration: none;
    }
    
    #header .logo span {
      color: var(--primary-color);
      font-family: 'Montserrat', sans-serif;
      font-weight: 700;
    }
    
    /* Navbar styling */
    .navbar ul {
      display: flex;
      align-items: center;
    }
    
    .navbar a {
      font-weight: 500;
      transition: color 0.3s;
    }
    
    .navbar a:hover, 
    .navbar .active {
      color: var(--primary-color);
    }
    
    /* Card styling */
    .cab-card {
      background-color: #fff;
      border: none;
      transition: all 0.3s ease;
      margin-bottom: 30px;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    }
    
    .cab-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    }
    
    .cab-img-container {
      height: 280px;
      overflow: hidden;
      position: relative;
    }
    
    .cab-img-container img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.8s;
    }
    
    .cab-card:hover .cab-img-container img {
      transform: scale(1.05);
    }
    
    .cab-badge {
      position: absolute;
      top: 15px;
      right: 15px;
      z-index: 2;
    }
    
    .badge {
      padding: 8px 12px;
      font-weight: 600;
      font-size: 0.8rem;
      letter-spacing: 0.5px;
      border-radius: 30px;
    }
    
    .bg-primary {
      background-color: var(--primary-color) !important;
    }
    
    .cab-details {
      padding: 30px;
    }
    
    .cab-title {
      color: var(--dark-color);
      font-weight: 700;
      margin-bottom: 20px;
      font-size: 1.8rem;
      font-family: 'Montserrat', sans-serif;
    }
    
    .cab-info {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
    }
    
    .cab-info i {
      color: var(--primary-color);
      margin-right: 15px;
      font-size: 1.25rem;
      width: 25px;
      text-align: center;
    }
    
    .cab-info span {
      font-size: 1.05rem;
    }
    
    .cab-info strong {
      font-weight: 600;
    }
    
    .cab-status {
      font-weight: 600;
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 0.9rem;
    }
    
    .status-available {
      color: #fff;
      background-color: var(--success-color);
    }
    
    .status-unavailable {
      color: #fff;
      background-color: var(--danger-color);
    }
    
    .status-pending {
      color: #fff;
      background-color: var(--warning-color);
    }
    
    /* Driver header styling */
    .driver-header {
      background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
      padding: 20px 0;
      margin-top: 70px;
    }
    
    .driver-name {
      color: white;
      margin-bottom: 0;
      font-size: 1.5rem;
      font-weight: 600;
    }
    
    .btn-light {
      background-color: rgba(255, 255, 255, 0.9);
      border: none;
      padding: 10px 20px;
      border-radius: 30px;
      font-weight: 500;
      transition: all 0.3s;
    }
    
    .btn-light:hover {
      background-color: #fff;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    
    /* Driver menu styling */
    .driver-menu {
      background-color: #fff;
      padding: 0;
      margin-bottom: 50px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
    }
    
    .driver-menu .nav {
      padding: 10px 0;
    }
    
    .driver-menu .nav-link {
      color: var(--dark-color);
      font-weight: 500;
      padding: 12px 20px;
      border-radius: 30px;
      margin: 5px;
      transition: all 0.3s;
    }
    
    .driver-menu .nav-link:hover {
      color: var(--primary-color);
      background-color: rgba(67, 97, 238, 0.1);
      transform: translateY(-2px);
    }
    
    .driver-menu .nav-link.active {
      color: #fff;
      background-color: var(--primary-color);
      box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
    }
    
    .driver-menu .nav-link i {
      margin-right: 8px;
    }
    
    /* Page header styling */
    .page-header {
      padding: 50px 0 30px;
      text-align: center;
    }
    
    .page-title {
      color: var(--dark-color);
      font-weight: 700;
      font-size: 2.5rem;
      margin-bottom: 15px;
      font-family: 'Montserrat', sans-serif;
    }
    
    .text-muted {
      color: var(--gray-color) !important;
      font-size: 1.1rem;
    }
    
    /* No cab message styling */
    .no-cab-message {
      text-align: center;
      padding: 80px 0;
      background-color: #fff;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    }
    
    .no-cab-message i {
      font-size: 5rem;
      color: var(--primary-color);
      margin-bottom: 30px;
      opacity: 0.8;
    }
    
    .no-cab-message h3 {
      font-weight: 700;
      margin-bottom: 15px;
      color: var(--dark-color);
      font-family: 'Montserrat', sans-serif;
    }
    
    .pending-message {
      background-color: #fff;
      border-left: 5px solid var(--warning-color);
      padding: 25px;
      border-radius: 8px;
      margin: 30px 0;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    }
    
    .pending-message h5 {
      font-weight: 600;
      color: var(--dark-color);
      font-family: 'Montserrat', sans-serif;
      margin-bottom: 15px;
    }
    
    /* Button styling */
    .btn {
      padding: 12px 25px;
      font-weight: 600;
      border-radius: 30px;
      transition: all 0.3s;
    }
    
    .btn-primary {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
      box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
    }
    
    .btn-primary:hover {
      background-color: var(--secondary-color);
      border-color: var(--secondary-color);
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(67, 97, 238, 0.4);
    }
    
    .btn-outline-secondary {
      color: var(--gray-color);
      border-color: #ced4da;
    }
    
    .btn-outline-secondary:hover {
      background-color: #f8f9fa;
      color: var(--dark-color);
      transform: translateY(-3px);
    }
    
    /* Footer styling */
    .footer {
      background-color: #f8f9fa;
      padding-top: 50px;
      font-size: 0.95rem;
    }
    
    .footer-top {
      padding-bottom: 40px;
    }
    
    .footer h4 {
      font-size: 1.2rem;
      font-weight: 700;
      margin-bottom: 20px;
      color: var(--dark-color);
      position: relative;
      padding-bottom: 10px;
    }
    
    .footer h4::after {
      content: '';
      position: absolute;
      left: 0;
      bottom: 0;
      height: 3px;
      width: 30px;
      background-color: var(--primary-color);
    }
    
    .footer-links li {
      padding: 7px 0;
    }
    
    .footer-links a {
      color: var(--gray-color);
      transition: all 0.3s;
      text-decoration: none;
    }
    
    .footer-links a:hover {
      color: var(--primary-color);
      padding-left: 5px;
    }
    
    .social-links a {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background-color: rgba(67, 97, 238, 0.1);
      color: var(--primary-color);
      margin-right: 10px;
      transition: all 0.3s;
    }
    
    .social-links a:hover {
      background-color: var(--primary-color);
      color: #fff;
      transform: translateY(-3px);
    }
    
    .copyright {
      text-align: center;
      padding: 20px 0;
      border-top: 1px solid #e9ecef;
      color: var(--gray-color);
    }
    
    /* Animation for pending state */
    @keyframes pulse {
      0% { opacity: 0.6; transform: scale(0.98); }
      50% { opacity: 1; transform: scale(1.02); }
      100% { opacity: 0.6; transform: scale(0.98); }
    }
    
    .pulse-animation {
      animation: pulse 2s infinite ease-in-out;
    }
    
    /* Responsive adjustments */
    @media (max-width: 991px) {
      .driver-name {
        font-size: 1.3rem;
      }
      
      .driver-menu .nav-link {
        padding: 10px 15px;
        font-size: 0.9rem;
      }
      
      .cab-img-container {
        height: 240px;
      }
      
      .cab-title {
        font-size: 1.5rem;
      }
    }
    
    @media (max-width: 767px) {
      .driver-menu .nav {
        flex-wrap: nowrap;
        overflow-x: auto;
        padding: 10px;
        -webkit-overflow-scrolling: touch;
      }
      
      .driver-menu .nav-item {
        flex-shrink: 0;
      }
      
      .page-title {
        font-size: 2rem;
      }
      
      .cab-details {
        padding: 20px;
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


  <c:choose>
    <c:when test="${not empty Driver_Name && not empty Driver_ID}">
      <!-- Driver header when logged in -->
      <div class="driver-header">
        <div class="container">
          <div class="align-items-center">
            <h2 class="driver-name"><i class="fas fa-user-circle me-2"></i> Welcome, ${Driver_Name}</h2>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Driver navigation menu -->
      <div class="driver-menu sticky-top">
        <div class="container">
          <ul class="nav nav-pills justify-content-center">
            <li class="nav-item mx-1">
              <a class="nav-link" href="EnterHireCharge.jsp">
                <i class="fas fa-dollar-sign"></i> Enter Hire Charge
              </a>
            </li>
            <li class="nav-item mx-1">
              <a class="nav-link" href="FinishJourney.jsp">
                <i class="fas fa-flag-checkered"></i> Finish Journey
              </a>
            </li>
            <li class="nav-item mx-1">
              <a class="nav-link" href="CabBookingsDriver.jsp">
                <i class="fas fa-history"></i> Finished Hires
              </a>
            </li>
            <li class="nav-item mx-1">
              <a class="nav-link active" href="AssignedCab.jsp">
                <i class="fas fa-car"></i> Assigned Cab
              </a>
            </li>
          </ul>
        </div>
      </div>
    </c:when>
    
  </c:choose>

  <main id="main">
    <c:if test="${not empty Driver_Name && not empty Driver_ID}">
      <!-- Page header -->
      <div class="page-header">
        <div class="container">
          <h1 class="page-title">Your Assigned Cab</h1>
          <p class="text-muted">View the details of the cab assigned to you</p>
        </div>
      </div>

      <!-- Cab details section -->
      <section class="cab-details-section py-5">
        <div class="container">
          <div class="row justify-content-center">
            <%
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456")) {
              Class.forName("com.mysql.jdbc.Driver");

              String query = "SELECT c.Car_ID, c.Car_Name, c.Car_Brand, c.Car_Number_Plate, " +
                              "c.Car_Colour, c.Car_Image, d.Car_Assignability_Status " +
                              "FROM car_table c " +
                              "LEFT JOIN driver_table d ON c.Driver_ID = d.Driver_ID " +
                              "WHERE c.Driver_ID = ?";
      
              // Retrieve Driver_ID from session or request scope
              Integer driverId = (Integer) session.getAttribute("Driver_ID"); // Assuming it's stored in session
              if (driverId == null) {
                driverId = Integer.parseInt(request.getParameter("Driver_ID")); // Fallback to request parameter if needed
              }

              try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, driverId); // Use the retrieved driverId
                try (ResultSet rs = ps.executeQuery()) {
                  boolean hasResults = false;
                  while (rs.next()) {
                    hasResults = true;
                    byte[] imgData = rs.getBytes("Car_Image");
                    String base64Image = (imgData != null) ? Base64.getEncoder().encodeToString(imgData) : "";
                    String status = rs.getString("Car_Assignability_Status");
                    String statusClass = "status-pending";
                    String statusIcon = "fa-clock";
                    
                    if (status != null) {
                      if (status.equalsIgnoreCase("Available")) {
                        statusClass = "status-available";
                        statusIcon = "fa-check-circle";
                      } else if (status.equalsIgnoreCase("Unavailable")) {
                        statusClass = "status-unavailable";
                        statusIcon = "fa-times-circle";
                      }
                    }
            %>
                    <div class="col-lg-8 col-md-10">
                      <div class="cab-card">
                        <div class="cab-img-container">
                          <% if (!base64Image.isEmpty()) { %>
                            <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= rs.getString("Car_Name") %>"/>
                          <% } else { %>
                            <img src="CSS/img/no-image.jpg" alt="No Image Available"/>
                          <% } %>
                          <div class="cab-badge">
                            <span class="badge bg-primary">CAB ID: <%= rs.getInt("Car_ID") %></span>
                          </div>
                        </div>
                        <div class="cab-details">
                          <h3 class="cab-title"><%= rs.getString("Car_Brand") %> <%= rs.getString("Car_Name") %></h3>
                          
                          <div class="cab-info">
                            <i class="fas fa-car"></i>
                            <span>Brand: <strong><%= rs.getString("Car_Brand") %></strong></span>
                          </div>
                          
                          <div class="cab-info">
                            <i class="fas fa-palette"></i>
                            <span>Color: <strong><%= rs.getString("Car_Colour") %></strong></span>
                          </div>
                          
                          <div class="cab-info">
                            <i class="fas fa-id-card"></i>
                            <span>Plate Number: <strong><%= rs.getString("Car_Number_Plate") %></strong></span>
                          </div>
                          
                          <div class="cab-info">
                            <i class="fas <%= statusIcon %>"></i>
                            <span>Status: <strong class="cab-status <%= statusClass %>"><%= status %></strong></span>
                          </div>
                          
                          <div class="mt-4 d-flex flex-wrap gap-2">
                            <button class="btn btn-primary" onclick="window.location.href='index.jsp'">
                              <i class="fas fa-home me-2"></i> Back to Home
                            </button>
                            <button class="btn btn-outline-secondary" onclick="window.print()">
                              <i class="fas fa-print me-2"></i> Print Details
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
            <%
                  }
                  if (!hasResults) {
            %>
                    <div class="col-lg-8 col-md-10">
                      <div class="no-cab-message">
                        <i class="fas fa-car-side pulse-animation"></i>
                        <h3>Cab Assignment Pending</h3>
                        <p class="text-muted">Please wait, your cab assigning process is in progress.</p>
                        <div class="pending-message mt-4">
                          <h5><i class="fas fa-info-circle me-2"></i> What happens next?</h5>
                          <p>Our admin team is currently processing your account and will assign a cab to you soon. This process typically takes 24-48 hours.</p>
                          <p>You'll be notified once a cab has been assigned to your account.</p>
                        </div>
                        <button class="btn btn-primary mt-3" onclick="window.location.href='Home.jsp'">
                          <i class="fas fa-home me-2"></i> Back to Home
                        </button>
                      </div>
                    </div>
            <%
                  }
                }
              }
            } catch (Exception e) {
              e.printStackTrace();
            %>
              <div class="col-lg-8 col-md-10">
                <div class="alert alert-danger border-0 shadow-sm">
                  <i class="fas fa-exclamation-circle me-2"></i>
                  An error occurred while fetching cab details. Please try again later.
                </div>
              </div>
            <%
            }
            %>
          </div>
        </div>
      </section>
    </c:if>
  </main>

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer mt-5">
    <div class="footer-top">
      <div class="container">
        <div class="row gy-4">
          <div class="col-lg-4 col-md-12 footer-info">
            <a href="Home.jsp" class="logo d-flex align-items-center">
              <img src="CSS/img/car.png" alt="">
              <span>MEGA CITY CAB</span>
            </a>
            <p>Get the most strengthful experience with our premium cab service. Safety, comfort, and reliability are our top priorities for every journey.</p>
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
              <li><i class="bi bi-chevron-right"></i> <a href="help.jsp">Help</a></li>
            </ul>
          </div>

          <div class="col-lg-2 col-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Daily Rides</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Airport Transfers</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Long Distance Travel</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Corporate Services</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">24/7 Availability</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-12 footer-contact text-center text-md-start">
            <h4>Contact Us</h4>
            <p>
              No 141/2, <br>
              Galle Rd, Colombo,<br>
              Sri Lanka <br><br>
              <strong>Phone:</strong> +94 775697120<br>
              <strong>Email:</strong> support@megacitycabs.lk<br>
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; 2024 <strong><span>MEGA CITY CABS</span></strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="CSS/Vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="CSS/Vendor/aos/aos.js"></script>
  <script src="CSS/Vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="CSS/Vendor/glightbox/js/glightbox.min.js"></script>
  <script src="CSS/Vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="CSS/Vendor/swiper/swiper-bundle.min.js"></script>
  <script src="CSS/Vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="CSS/js/main.js"></script>



  <!-- Vendor JS Files -->
  <script src="CSS/Vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script>
    function confirmLogout() {
      if (confirm("Are you sure you want to log out?")) {
        window.location.href = "LogoutProcess.jsp";
      }
    }
  </script>
</body>
</html>