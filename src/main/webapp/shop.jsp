<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Mega City Cab - Book your ride instantly">
    <meta name="keywords" content="cab, taxi, transportation, booking">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mega - City Cab</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&family=Sen:wght@400;700;800&display=swap" rel="stylesheet">

    <!-- CSS Links -->
    <link href="CSS/Vendor/aos/aos.css" rel="stylesheet">
    <link href="CSS/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="CSS/Vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="CSS/Vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="CSS/Vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="CSS/Vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="CSS/css/Style1.css" rel="stylesheet">
    <link href="CSS/css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="./CSS/img/carlogo.png" type="image/">
    
    <style>
        /* Custom Styles - Light Modern Theme */
        body {
            background-color: #f8f9fa;
            color: #333;
        }
        
        .navbar {
            background-color: #ffffff !important;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .logo span {
            color: #333;
        }
        
        .main-container {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 30px;
            margin-top: 100px;
            margin-bottom: 50px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .section-title {
            color: #333;
            font-weight: 700;
            position: relative;
            padding-bottom: 15px;
            margin-bottom: 30px;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            display: block;
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, #ff6b6b, #ffa502);
            bottom: 0;
            left: 0;
        }
        
        .vehicle-card {
            background-color: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            margin-bottom: 25px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: 1px solid #eee;
        }
        
        .vehicle-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15), 0 0 10px rgba(255, 107, 107, 0.1);
            border-color: #ff6b6b;
        }
        
        .vehicle-card img {
            height: 180px;
            object-fit: cover;
            width: 100%;
        }
        
        .vehicle-details {
            padding: 20px;
        }
        
        .vehicle-title {
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
            font-size: 1.25rem;
        }
        
        .vehicle-price {
            font-size: 1.4rem;
            font-weight: 700;
            color: #ff6b6b;
            margin-bottom: 10px;
        }
        
        .vehicle-price:before {
            content: "$";
            font-size: 0.9rem;
            vertical-align: top;
            margin-right: 2px;
        }
        
        .search-sidebar {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: 1px solid #eee;
        }
        
        .search-sidebar h4 {
            color: #333;
            font-weight: 600;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .search-sidebar h4:after {
            content: '';
            position: absolute;
            display: block;
            width: 40px;
            height: 3px;
            background: #ff6b6b;
            bottom: 0;
            left: 0;
        }
        
        .form-control {
            background-color: #f5f5f5;
            border: 1px solid #e0e0e0;
            color: #333;
        }
        
        .form-control:focus {
            background-color: #fff;
            border-color: #ff6b6b;
            box-shadow: 0 0 0 0.25rem rgba(255, 107, 107, 0.25);
            color: #333;
        }
        
        .btn-search {
            background: linear-gradient(90deg, #ff6b6b, #ffa502);
            border: none;
            color: #fff;
            font-weight: 500;
        }
        
        .btn-search:hover {
            background: linear-gradient(90deg, #ff5252, #ff9800);
            transform: translateY(-2px);
        }
        
        .breadcrumb-section {
            background: linear-gradient(90deg, #f8f9fa, #e9ecef);
            padding: 30px 0;
            margin-bottom: 30px;
        }
        
        .breadcrumb-item a {
            color: #ff6b6b;
            text-decoration: none;
        }
        
        .breadcrumb-item.active {
            color: #555;
        }
        
        .breadcrumb-item+.breadcrumb-item::before {
            color: #999;
        }
        
        .features-list {
            list-style: none;
            padding-left: 0;
        }
        
        .features-list li {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
            color: #555;
        }
        
        .features-list li:last-child {
            border-bottom: none;
        }
        
        .features-list i {
            color: #ff6b6b;
            margin-right: 10px;
        }
        
        .btn-book-now {
            background: linear-gradient(90deg, #ff6b6b, #ffa502);
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: 500;
            color: #fff;
            transition: all 0.3s;
        }
        
        .btn-book-now:hover:not(.disabled) {
            background: linear-gradient(90deg, #ff5252, #ff9800);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        }
        
        .btn-book-now.disabled {
            background: #e0e0e0;
            color: #888;
        }
        
        .car-specs {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 15px;
        }
        
        .car-spec {
            background-color: #f5f5f5;
            padding: 5px 10px;
            border-radius: 20px;
            margin-right: 10px;
            margin-bottom: 10px;
            font-size: 0.85rem;
            color: #555;
        }
        
        .car-spec i {
            color: #ff6b6b;
            margin-right: 5px;
        }
        
        .badge-available {
            background-color: #00b894;
            color: #fff;
        }
        
        .badge-unavailable {
            background-color: #d63031;
            color: #fff;
        }
        
        .no-results {
            background-color: #fff;
            border-radius: 12px;
            padding: 40px;
            text-align: center;
            border: 1px solid #eee;
        }
        
        .no-results i {
            font-size: 3rem;
            color: #ff6b6b;
            margin-bottom: 20px;
        }
        
        .no-results h4 {
            color: #333;
            margin-bottom: 15px;
        }
        
        .no-results p {
            color: #777;
            margin-bottom: 20px;
        }
        
        .btn-outline-accent {
            border: 2px solid #ff6b6b;
            color: #ff6b6b;
            background-color: transparent;
        }
        
        .btn-outline-accent:hover {
            background-color: #ff6b6b;
            color: #fff;
        }
        
        .footer {
            background-color: #f8f9fa;
            color: #555;
            border-top: 1px solid #eee;
        }
        
        .footer h4 {
            color: #333;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer h4:after {
            content: '';
            position: absolute;
            display: block;
            width: 30px;
            height: 2px;
            background: #ff6b6b;
            bottom: 0;
            left: 0;
        }
        
        .footer-links a {
            color: #666;
            transition: all 0.3s;
            display: block;
            margin-bottom: 8px;
            text-decoration: none;
        }
        
        .footer-links a:hover {
            color: #ff6b6b;
            transform: translateX(5px);
        }
        
        .social-links a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 38px;
            height: 38px;
            background-color: #f0f0f0;
            border-radius: 50%;
            margin-right: 10px;
            color: #ff6b6b;
            transition: all 0.3s;
        }
        
        .social-links a:hover {
            background-color: #ff6b6b;
            color: #fff;
            transform: translateY(-3px);
        }
        
        .contact-info li {
            margin-bottom: 15px;
            display: flex;
            align-items: flex-start;
        }
        
        .contact-info i {
            color: #ff6b6b;
            margin-right: 15px;
            margin-top: 5px;
        }
        
        /* Text styling for light mode */
        .text-muted {
            color: #777 !important;
        }
        
        h2.text-light {
            color: #333 !important;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .main-container {
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
        <img src="CSS/img/car.png" alt="">
        <span><b>Mega - City Cab</b></span>
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
          <li><a class="nav-link scrollto " href="about.jsp">About</a></li>
          <li><a class="nav-link scrollto" href="shop.jsp">Cabs</a></li>
          <li><a class="nav-link scrollto" href="services.jsp">Services</a></li>
          <li><a class="nav-link scrollto" href="contact.jsp">Contact</a></li>
          <li><a class="nav-link scrollto" href="help.jsp">Help</a></li>
       
                    <c:choose>
                        <c:when test="${not empty User_Username}">
                            <li class="dropdown"><a href="#"><span>Welcome ${User_Username}</span> <i class="bi bi-chevron-down"></i></a>
                                <ul>
                                    <li><a href="CabBookingsCustomer.jsp">My Bookings</a></li>
                                    <li><a href="javascript:void(0);" onclick="confirmLogout()">Logout</a></li>
                                </ul>
                            </li>
                        </c:when>
                        <c:when test="${not empty Driver_Name}">
                            <li class="dropdown"><a href="#"><span>Welcome ${Driver_Name}</span> <i class="bi bi-chevron-down"></i></a>
                                <ul>
                                    <li><a href="CabBookingsDriver.jsp">My Rides</a></li>
                                    <li><a href="javascript:void(0);" onclick="confirmLogout()">Logout</a></li>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li><a class="nav-link scrollto" href="register.jsp">
                                <button type="button" class="btn" style="background: linear-gradient(90deg, #ff6b6b, #ffa502); color: white; border-radius: 20px; padding: 8px 20px;">
                                    <i class="bi bi-person-plus me-2"></i><b>Sign Up</b>
                                </button>
                            </a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>
        </div>
    </header>

    <main id="main">
        <!-- Breadcrumb Section -->
        <section class="breadcrumb-section mt-5 pt-5">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Cab Deals</li>
                    </ol>
                </nav>
                <h2 class="mb-0">Available Cabs</h2>
            </div>
        </section>

        <div class="container main-container">
            <div class="row g-4">
                <!-- Search Sidebar -->
                <div class="col-lg-3 col-md-4">
                    <div class="search-sidebar mb-4">
                        <h4><i class="bi bi-search me-2"></i>Find Your Ride</h4>
                        <form action="" method="GET">
                            <div class="mb-3">
                                <input type="text" name="search" class="form-control" placeholder="Search by name or brand..." value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                            </div>
                            <button type="submit" class="btn btn-search w-100 py-2 mb-3">
                                <i class="bi bi-search me-2"></i>Search
                            </button>
                        </form>
                    </div>
                    
                    <div class="search-sidebar">
                        <h4><i class="bi bi-award me-2"></i>Premium Service</h4>
                        <ul class="features-list">
                            <li><i class="bi bi-check-circle-fill"></i>Professional Drivers</li>
                            <li><i class="bi bi-check-circle-fill"></i>24/7 Customer Support</li>
                            <li><i class="bi bi-check-circle-fill"></i>GPS Monitored Vehicles</li>
                            <li><i class="bi bi-check-circle-fill"></i>Sanitized Interiors</li>
                            <li><i class="bi bi-check-circle-fill"></i>No Hidden Charges</li>
                        </ul>
                    </div>
                </div>

                <!-- Vehicle Grid -->
                <div class="col-lg-9 col-md-8">
                    <h3 class="section-title">Premium Rides For You</h3>
                    
                    <div class="row">
                        <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");
                            String searchTerm = request.getParameter("search");
                            
                            String query = "SELECT car_table.*, driver_table.Driver_Name, driver_table.Driver_Telephone_Number " +
                                           "FROM car_table LEFT JOIN driver_table ON car_table.Driver_ID = driver_table.Driver_ID";
                            
                            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                query += " WHERE car_table.Car_Name LIKE ? OR car_table.Car_Brand LIKE ?";
                            }
                            
                            PreparedStatement ps = con.prepareStatement(query);
                            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                String searchPattern = "%" + searchTerm + "%";
                                ps.setString(1, searchPattern);
                                ps.setString(2, searchPattern);
                            }
                            
                            ResultSet rs = ps.executeQuery();
                            boolean hasResults = false;
                            
                            while (rs.next()) {
                                hasResults = true;
                                byte[] imgData = rs.getBytes("Car_Image");
                                String base64Image = null;
                                if (imgData != null) {
                                    base64Image = java.util.Base64.getEncoder().encodeToString(imgData);
                                }
                        %>
                        <div class="col-md-6 col-lg-4">
                            <div class="vehicle-card">
                                <% if (base64Image != null) { %>
                                    <img src="data:image/jpeg;base64,<%= base64Image %>" class="img-fluid" alt="<%= rs.getString("Car_Name") %>">
                                <% } else { %>
                                    <img src="CSS/img/car-placeholder.jpg" class="img-fluid" alt="Placeholder">
                                <% } %>
                                <div class="vehicle-details">
                                    <h5 class="vehicle-title"><%= rs.getString("Car_Name") %></h5>
                                    <p class="vehicle-price">LKR<%= rs.getDouble("Car_Booking_Price") %></p>
                                    
                                    <div class="car-specs">
                                        <span class="car-spec"><i class="bi bi-car-front"></i><%= rs.getString("Car_Brand") %></span>
                                        <span class="car-spec"><i class="bi bi-palette"></i><%= rs.getString("Car_Colour") %></span>
                                    </div>
                                    
                                    <p class="mb-2"><i class="bi bi-person-circle me-2"></i>Driver: <%= rs.getString("Driver_Name") != null ? rs.getString("Driver_Name") : "Not Assigned" %></p>
                                    
                                    <p class="mb-3">
                                        <span class="badge <%= rs.getString("Car_Status").equals("Available") ? "badge-available" : "badge-unavailable" %> py-2 px-3">
                                            <i class="bi <%= rs.getString("Car_Status").equals("Available") ? "bi-check-circle-fill" : "bi-x-circle-fill" %> me-1"></i>
                                            <%= rs.getString("Car_Status") %>
                                        </span>
                                    </p>
                                    
                                    <a href="BookCab.jsp?Car_ID=<%= rs.getInt("Car_ID") %>" 
                                       class="btn btn-book-now w-100 <%= rs.getString("Car_Status").equals("Available") ? "" : "disabled" %>">
                                        <i class="bi bi-calendar-check me-2"></i>Book Now
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                            if (!hasResults) {
                        %>
                            <div class="col-12">
                                <div class="no-results">
                                    <i class="bi bi-search"></i>
                                    <h4>No cabs matching your search</h4>
                                    <p class="text-muted">We couldn't find any cabs that match your search criteria. Try a different search or browse all available options.</p>
                                    <a href="shop.jsp" class="btn btn-outline-accent">View All Cabs</a>
                                </div>
                            </div>
                        <%
                            }
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </main>

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
              <li><i class="bi bi-chevron-right"></i> <a href="terms.jsp ">Terms and Conditions</a></li>
              
            </ul>
          </div>

          <div class="col-lg-2 col-md-12 footer-contact text-center text-md-start">
            <h4>Contact Us</h4>
            <p>
              No 141/2, <br>
              Galle Rd, Colombo,<br>
              Sri Lanka <br><br>
              <strong>Phone:</strong> +001 5009 52488<br>
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
                Designed by Pasindu Isuranga
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

 

  

    <script>
        function confirmLogout() {
            if (confirm("Are you sure you want to log out?")) {
                window.location.href = "LogoutProcess.jsp";
            }
        }
        
        document.getElementById('currentYear').textContent = new Date().getFullYear();
    </script>
</body>
</html>