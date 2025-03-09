<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Finished Hires - Mega City Cab</title>
  <meta content="View your finished cab hire history" name="description">
  <meta content="cab, taxi, hire, driver, history" name="keywords">

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
  
  <!-- Custom CSS for this page -->
  <style>
    .table-responsive {
      overflow-x: auto;
    }
    
    .table th {
      background-color: #4154f1;
      color: white;
      white-space: nowrap;
    }
    
    .table-hover tbody tr:hover {
      background-color: rgba(65, 84, 241, 0.05);
    }
    
    .search-container {
      position: relative;
      max-width: 600px;
      margin: 0 auto;
    }
    
    .search-container .form-control {
      padding-right: 50px;
      border-radius: 50px;
      box-shadow: 0 0 30px rgba(1, 41, 112, 0.1);
    }
    
    .search-container .btn {
      position: absolute;
      right: 5px;
      top: 5px;
      border-radius: 50px;
    }
    
    .section-title {
      text-align: center;
      padding-bottom: 30px;
    }
    
    .section-title h2 {
      font-size: 32px;
      font-weight: bold;
      text-transform: uppercase;
      margin-bottom: 20px;
      padding-bottom: 20px;
      position: relative;
      color: #012970;
    }
    
    .section-title h2::before {
      content: '';
      position: absolute;
      display: block;
      width: 120px;
      height: 1px;
      background: #ddd;
      bottom: 1px;
      left: calc(50% - 60px);
    }
    
    .section-title h2::after {
      content: '';
      position: absolute;
      display: block;
      width: 40px;
      height: 3px;
      background: #4154f1;
      bottom: 0;
      left: calc(50% - 20px);
    }
    
    .breadcrumbs {
      padding: 15px 0;
      background: #f6f9ff;
      margin-top: 85px;
    }
    
    .breadcrumbs h2 {
      font-size: 24px;
      font-weight: 600;
      color: #012970;
    }
    
    .breadcrumbs ol {
      display: flex;
      flex-wrap: wrap;
      list-style: none;
      padding: 0 0 10px 0;
      margin: 0;
      font-size: 14px;
    }
    
    .breadcrumbs ol li + li {
      padding-left: 10px;
    }
    
    .breadcrumbs ol li + li::before {
      display: inline-block;
      padding-right: 10px;
      color: #6c757d;
      content: "/";
    }
    
    .driver-actions .btn {
      margin: 5px;
    }
    
    @media (max-width: 768px) {
      .breadcrumbs .d-flex {
        display: block !important;
      }
      .breadcrumbs ol {
        display: block;
      }
      .breadcrumbs ol li {
        display: inline-block;
      }
    }
    
    /* Custom styles for the search results label */
    .search-results-label {
      font-style: italic;
      text-align: center;
      margin-top: 10px;
      color: #012970;
    }
  </style>
</head>
<body>
  <%
    // Retrieve session attributes safely
    Integer Driver_ID = (Integer) session.getAttribute("Driver_ID");
    String Driver_Name = (String) session.getAttribute("Driver_Name");

    // Check if User_ID exists in session
    if (Driver_ID == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String searchTerm = request.getParameter("search");
  %>

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


  <main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>Finished Hires</h2>
          <ol>
            <li><a href="Home.jsp">Home</a></li>
            <li>Finished Hires</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Driver Actions Section ======= -->
    <section class="driver-actions">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center">
            <div class="d-flex flex-wrap justify-content-center">
              <a href="EnterHireCharge.jsp" class="btn btn-primary m-2"><i class="bi bi-cash-coin"></i> Enter Hire Charge</a>
              <a href="FinishJourney.jsp" class="btn btn-success m-2"><i class="bi bi-flag-fill"></i> Finish Journey</a>
              <a href="CabBookingsDriver.jsp" class="btn btn-info m-2 active"><i class="bi bi-journal-check"></i> Finished Hires</a>
              <a href="AssignedCab.jsp" class="btn btn-secondary m-2"><i class="bi bi-car-front-fill"></i> Assigned Cab</a>
              <button onclick="confirmLogout()" class="btn btn-danger m-2"><i class="bi bi-box-arrow-right"></i> Logout</button>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Driver Actions Section -->

    <!-- ======= Finished Hires Section ======= -->
    <section id="finished-hires" class="finished-hires section-bg">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>Your Finished Hires</h2>
          <p>View your complete history of finished journeys and payments</p>
        </div>

        <!-- Search Box -->
        <div class="row mb-5">
          <div class="col-lg-8 mx-auto">
            <form method="GET" action="" class="search-container">
              <input type="text" name="search" class="form-control" placeholder="Search by date, time, location or customer name" value="<%= searchTerm != null ? searchTerm : "" %>">
              <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i></button>
            </form>
            <% if (searchTerm != null && !searchTerm.trim().isEmpty()) { %>
              <p class="search-results-label">Showing results for "<%= searchTerm %>"</p>
            <% } %>
          </div>
        </div>

        <!-- Hires Table -->
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>Booking ID</th>
                        <th>Car Details</th>
                        <th>Customer</th>
                        <th>Journey Details</th>
                        <th>Booked On</th>
                        <th>Payment</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                        boolean hasResults = false;
                        try {
                          // Load the database driver
                          Class.forName("com.mysql.jdbc.Driver");
                          // Establish connection
                          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");

                          // SQL query to join booking_table and filter by User_ID
                          String query = "SELECT booking_table.Booking_ID, booking_table.Car_Name, booking_table.Car_Brand, " +
                                         "booking_table.Car_Number_Plate, booking_table.Car_Colour, booking_table.Driver_Name, booking_table.Driver_Telephone_Number, booking_table.Car_Booking_Price, " +
                                         "booking_table.User_Telephone_Number, booking_table.User_Username, booking_table.User_Address, booking_table.User_Current_Location, booking_table.User_Destination, " +
                                         "booking_table.Booked_Date, booking_table.Booked_Time, booking_table.Hire_Charge, booking_table.Total_Payable_Amount, booking_table.Journey_Status " +
                                         "FROM booking_table WHERE Driver_ID = ? AND booking_table.Journey_Status != 'You are on Journey' AND booking_table.Hire_Charge != 'Will be Notified Soon' AND booking_table.Total_Payable_Amount != 'Will be Notified Soon'";

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
                          
                          // Loop through the result set
                          while (rs.next()) {
                            hasResults = true;
                      %>
                      <tr>
                        <td><span class="badge bg-primary"><%= rs.getString("Booking_ID") %></span></td>
                        <td>
                          <strong><%= rs.getString("Car_Brand") %> <%= rs.getString("Car_Name") %></strong><br>
                          <small class="text-muted">Plate: <%= rs.getString("Car_Number_Plate") %> | Color: <%= rs.getString("Car_Colour") %></small>
                        </td>
                        <td>
                          <strong><%= rs.getString("User_Username") %></strong><br>
                          <small><i class="bi bi-telephone"></i> <%= rs.getString("User_Telephone_Number") %></small>
                        </td>
                        <td>
                          <div><i class="bi bi-geo-alt text-danger"></i> From: <%= rs.getString("User_Current_Location") %></div>
                          <div><i class="bi bi-geo-alt-fill text-success"></i> To: <%= rs.getString("User_Destination") %></div>
                        </td>
                        <td>
                          <div><i class="bi bi-calendar"></i> <%= rs.getString("Booked_Date") %></div>
                          <div><i class="bi bi-clock"></i> <%= rs.getString("Booked_Time") %></div>
                        </td>
                        <td>
                          <div>Base: <strong><%= rs.getString("Car_Booking_Price") %></strong></div>
                          <div>Hire Charge: <strong><%= rs.getString("Hire_Charge") %></strong></div>
                          <div>Total: <strong class="text-success"><%= rs.getString("Total_Payable_Amount") %></strong></div>
                        </td>
                        <td><span class="badge bg-success"><%= rs.getString("Journey_Status") %></span></td>
                      </tr>
                      <%
                          }
                          // Close resources
                          rs.close();
                          ps.close();
                          con.close();
                          
                          // If no results are found, display a message
                          if (!hasResults) {
                      %>
                      <tr>
                        <td colspan="7" class="text-center">
                          <div class="p-4">
                            <i class="bi bi-search" style="font-size: 3rem; color: #ccc;"></i>
                            <p class="mt-3">No finished hires found</p>
                            <% if (searchTerm != null && !searchTerm.trim().isEmpty()) { %>
                              <p class="text-muted">Try different search terms or clear your search</p>
                            <% } else { %>
                              <p class="text-muted">You haven't completed any hires yet</p>
                            <% } %>
                          </div>
                        </td>
                      </tr>
                      <%
                          }
                        } catch (Exception e) {
                          e.printStackTrace();
                      %>
                      <tr>
                        <td colspan="7" class="text-center text-danger">
                          <i class="bi bi-exclamation-triangle"></i> An error occurred while retrieving data. Please try again later.
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
          </div>
        </div>
      </div>
    </section><!-- End Finished Hires Section -->
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row gy-4">
          <div class="col-lg-4 col-md-12 footer-info">
            <a href="index.jsp" class="logo d-flex align-items-center">
              <img src="CSS/img/car.png" alt="">
              <span>Mega City Cab</span>
            </a>
            <p>Providing reliable and affordable car rentals for seamless travel experiences throughout Sri Lanka.</p>
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
              <li><i class="bi bi-chevron-right"></i> <a href="Home.jsp">Home</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="AboutUs.jsp">About us</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="Help.jsp">Help</a></li>
            </ul>
          </div>

          <div class="col-lg-2 col-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Daily Car Rentals</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Long-Term Rentals</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Airport Transfers</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Luxury Car Hire</a></li>
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
        &copy; Copyright <strong><span>Mega City Cab</span></strong>. All Rights Reserved
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
  
  <!-- Custom script for this page -->
  <script>
    // Function to confirm logout
    function confirmLogout() {
      // Show confirmation dialog
      var result = confirm("Are you sure you want to log out?");
      
      if (result) {
        // If user confirms, redirect to logout process
        window.location.href = "LogoutProcess.jsp";
      }
    }
  </script>
</body>
</html>