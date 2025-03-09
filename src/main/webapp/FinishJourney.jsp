<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mega - City Cab </title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link rel="shortcut icon" href="./CSS/img/carlogo.png" type="image/">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="CSS/Vendor/aos/aos.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="CSS/Vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="CSS/Vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="CSS/Vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="CSS/css/style.css" rel="stylesheet">


  <style>
    /* Improved Table Styling */
    .table-responsive {
      max-height: 70vh; /* Adjust as needed */
  overflow-y: auto;
  margin-top: 20px;
  border-radius: 8px;
  overflow-x: auto;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    
    .search-bar {
      max-width: 600px;
      margin: 20px auto 30px;
    }
    
    .search-bar input {
      border-radius: 25px 0 0 25px;
      padding: 10px 20px;
      border: 1px solid #ddd;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    }
    
    .search-bar button {
      border-radius: 0 25px 25px 0;
      padding: 10px 25px;
      background-color: #007bff;
      border-color: #007bff;
      font-weight: 500;
    }
    
    .search-bar button:hover {
      background-color: #0069d9;
    }
    
    .table {
      margin-bottom: 0;
    }
    
    .table th {
      background-color: #007bff;
  color: white;
  font-weight: 600;
  padding: 12px;
  border: none;
  vertical-align: middle;
  white-space: nowrap;
  position: sticky;
  top: 0;
  z-index: 1;
    }
    
    .table td {
      padding: 12px;
      vertical-align: middle;
      border-color: #f0f0f0;
    }
    
    .table tbody tr:hover {
      background-color: #f8f9fa;
    }
    
    .btn-finish {
      background-color: #28a745;
      color: white;
      border: none;
      padding: 7px 15px;
      border-radius: 5px;
      font-weight: 500;
      transition: all 0.3s;
    }
    
    .btn-finish:hover {
      background-color: #218838;
      transform: translateY(-2px);
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    
    .table-striped tbody tr:nth-of-type(odd) {
      background-color: rgba(0, 123, 255, 0.05);
    }
    
    .section-title {
      position: relative;
      margin-bottom: 30px;
      padding-bottom: 15px;
    }
    
    .section-title:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      height: 3px;
      background-color: #007bff;
    }
    
    .text-highlight {
      color: #007bff;
      font-weight: 600;
    }
    
    /* Responsive table styles */
    @media (max-width: 992px) {
      .table {
        min-width: 1000px;
      }
      
      .container {
  padding-bottom: 50px; /* Add extra space at bottom */
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

  <main id="main" class="py-5">
    <div class="container">
      <h1 class="text-center mb-4">.</h1>
    
      <h1 class="text-center section-title">Active Cab Bookings</h1>
      <p class="text-center mb-4">Complete your journeys and provide excellent service to our customers</p>

      <!-- Search Bar -->
      <div class="search-bar">
        <form method="GET" action="">
          <div class="input-group">
            <input type="text" name="search" class="form-control" placeholder="Search by date, time, location or customer name" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
            <button type="submit" class="btn btn-primary">
              <i class="bi bi-search me-1"></i> Search
            </button>
          </div>
        </form>
        <%
          String searchTerm = request.getParameter("search");
          if (searchTerm != null && !searchTerm.trim().isEmpty()) {
        %>
        <p class="text-center mt-2 text-muted"><i class="bi bi-filter me-1"></i> Showing results for "<%= searchTerm %>"</p>
        <%
          }
        %>
      </div>

      <!-- Booking Table -->
      <div class="table-responsive">
        <table class="table table-striped table-bordered">
          <thead>
            <tr>
              <th><i class="bi bi-check-circle me-1"></i> Action</th>
              <th><i class="bi bi-info-circle me-1"></i> Status</th>
              <th><i class="bi bi-tag me-1"></i> ID</th>
              <th><i class="bi bi-car-front me-1"></i> Car Name</th>
              <th><i class="bi bi-building me-1"></i> Car Brand</th>
              <th><i class="bi bi-credit-card me-1"></i> Number Plate</th>
              <th><i class="bi bi-palette me-1"></i> Colour</th>
              <th><i class="bi bi-person me-1"></i> Driver</th>
              <th><i class="bi bi-telephone me-1"></i> Driver Tel.</th>
              <th><i class="bi bi-currency-dollar me-1"></i> Base Price</th>
              <th><i class="bi bi-person-circle me-1"></i> Customer</th>
              <th><i class="bi bi-telephone me-1"></i> Customer Tel.</th>
              <th><i class="bi bi-house me-1"></i> Address</th>
              <th><i class="bi bi-geo-alt me-1"></i> Pickup</th>
              <th><i class="bi bi-geo-alt-fill me-1"></i> Destination</th>
              <th><i class="bi bi-calendar me-1"></i> Date</th>
              <th><i class="bi bi-clock me-1"></i> Time</th>
              <th><i class="bi bi-cash me-1"></i> Hire Charge</th>
              <th><i class="bi bi-receipt me-1"></i> Total</th>
            </tr>
          </thead>
          <tbody>
            <%
              try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");

                String query = "SELECT booking_table.*, car_table.Car_Status " +
                               "FROM booking_table " +
                               "LEFT JOIN car_table ON booking_table.Car_ID = car_table.Car_ID " +
                               "WHERE booking_table.Driver_ID = ? AND booking_table.Journey_Status = 'You are on Journey' " +
                               "AND booking_table.Hire_Charge != 'Will be Notified Soon' " +
                               "AND booking_table.Total_Payable_Amount != 'Will be Notified Soon'";

                if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                  query += " AND (booking_table.Car_Name LIKE ? OR booking_table.User_Username LIKE ? OR " +
                           "booking_table.Booked_Date LIKE ? OR booking_table.Booked_Time LIKE ? OR " +
                           "booking_table.User_Current_Location LIKE ? OR booking_table.User_Destination LIKE ?)";
                }

                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, (Integer) session.getAttribute("Driver_ID"));

                if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                  String searchPattern = "%" + searchTerm + "%";
                  for (int i = 2; i <= 7; i++) {
                    ps.setString(i, searchPattern);
                  }
                }

                ResultSet rs = ps.executeQuery();
                boolean hasResults = false;

                while (rs.next()) {
                  hasResults = true;
            %>
            <tr>
              <td>
                <form action="finishTheJourney" method="POST">
                  <button type="submit" class="btn-finish">
                    <i class="bi bi-flag-fill me-1"></i> Finish
                  </button>
                  <input type="hidden" name="Journey_Status" value="Your Journey is Finished" />
                  <input type="hidden" name="Booking_ID" value="<%= rs.getInt("Booking_ID") %>" />
                  <input type="hidden" name="Car_ID" value="<%= rs.getInt("Car_ID") %>" />
                </form>
              </td>
              <td><span class="badge bg-primary"><%= rs.getString("Car_Status") %></span></td>
              <td><span class="text-highlight">#<%= rs.getInt("Booking_ID") %></span></td>
              <td><%= rs.getString("Car_Name") %></td>
              <td><%= rs.getString("Car_Brand") %></td>
              <td><%= rs.getString("Car_Number_Plate") %></td>
              <td><%= rs.getString("Car_Colour") %></td>
              <td><%= rs.getString("Driver_Name") %></td>
              <td><%= rs.getInt("Driver_Telephone_Number") %></td>
              <td>Rs. <%= rs.getDouble("Car_Booking_Price") %></td>
              <td><%= rs.getString("User_Username") %></td>
              <td><%= rs.getInt("User_Telephone_Number") %></td>
              <td><%= rs.getString("User_Address") %></td>
              <td><%= rs.getString("User_Current_Location") %></td>
              <td><%= rs.getString("User_Destination") %></td>
              <td><%= rs.getDate("Booked_Date") %></td>
              <td><%= rs.getTime("Booked_Time") %></td>
              <td>Rs. <%= rs.getString("Hire_Charge") %></td>
              <td><strong>Rs. <%= rs.getString("Total_Payable_Amount") %></strong></td>
            </tr>
            <%
                }
                if (!hasResults) {
            %>
            <tr>
              <td colspan="19" class="text-center py-4">
                <i class="bi bi-exclamation-circle text-warning me-2"></i>
                No active journeys found. All your ongoing trips will appear here.
              </td>
            </tr>
            <%
                }
                con.close();
              } catch (Exception e) {
                e.printStackTrace();
              }
            %>
          </tbody>
        </table>
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
      document.addEventListener("DOMContentLoaded", function () {
        const menuIcon = document.querySelector(".menu-icon");
        const menuIcon2 = document.querySelector(".menu-icon2");
        const menuContainer = document.querySelector(".menu-container");
        const menuContainer2 = document.querySelector(".menu-container2");
      
        menuIcon.addEventListener("click", () => {
          menuContainer.classList.toggle("active");
        });

        menuIcon2.addEventListener("click", () => {
          menuContainer2.classList.toggle("active");
        });
      });
    </script>.
    333333335
  
  <script>
    function confirmLogout() {
      if (confirm("Are you sure you want to log out?")) {
        window.location.href = "LogoutProcess.jsp";
      }
    }
  </script>
</body>
</html>