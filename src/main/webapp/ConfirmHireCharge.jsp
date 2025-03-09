<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mega - City Cab</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link rel="shortcut icon" href="./CSS/img/carlogo.png" type="image/">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="CSS/Vendor/aos/aos.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="CSS/Vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="CSS/Vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="CSS/Vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="CSS/css/style.css" rel="stylesheet">
  
  <!-- Custom CSS -->
  <style>
    :root {
      --primary-color: #4154f1;
      --secondary-color: #6c757d;
      --accent-color: #e91e63;
      --success-color: #2eca6a;
      --info-color: #0dcaf0;
      --warning-color: #ffc107;
      --danger-color: #dc3545;
      --light-color: #f8f9fa;
      --dark-color: #212529;
    }
    
    body {
      background-color: #f7f8fa;
      color: #444444;
    }
    
    .form-container {
      max-width: 900px;
      margin: 3rem auto;
      padding: 0;
      background: transparent;
    }
    
    .card {
      border: none;
      border-radius: 12px;
      box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
      overflow: hidden;
      transition: all 0.3s ease;
    }
    
    .card:hover {
      box-shadow: 0 8px 35px rgba(0, 0, 0, 0.12);
      transform: translateY(-5px);
    }
    
    .card-header {
      background: linear-gradient(135deg, var(--primary-color), #2a2af1);
      padding: 1.5rem;
      border-bottom: none;
    }
    
    .card-header h3 {
      margin-bottom: 0;
      font-weight: 700;
      letter-spacing: 0.5px;
    }
    
    .card-body {
      padding: 2rem;
    }
    
    .form-label {
      font-size: 0.9rem;
      margin-bottom: 0.5rem;
      color: var(--secondary-color);
    }
    
    .form-control {
      padding: 0.8rem 1rem;
      border-radius: 8px;
      border: 1px solid #e0e0e0;
      font-size: 1rem;
      transition: all 0.3s;
    }
    
    .form-control:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 0 0.25rem rgba(65, 84, 241, 0.15);
    }
    
    .form-control[readonly] {
      background-color: #f8f9fa;
      cursor: not-allowed;
    }
    
    .text-danger {
      color: var(--accent-color) !important;
    }
    
    .btn-primary {
      background: linear-gradient(135deg, var(--primary-color), #2a2af1);
      border: none;
      padding: 12px 20px;
      font-weight: 600;
      letter-spacing: 0.5px;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(65, 84, 241, 0.25);
      transition: all 0.3s;
    }
    
    .btn-primary:hover {
      background: linear-gradient(135deg, #3a46d1, #2020d8);
      box-shadow: 0 6px 15px rgba(65, 84, 241, 0.35);
      transform: translateY(-2px);
    }
    
    .section-header {
      text-align: center;
      margin-bottom: 3rem;
    }
    
    .section-header h2 {
      font-size: 32px;
      font-weight: 700;
      color: var(--dark-color);
    }
    
    .section-header p {
      margin-top: 10px;
      color: var(--secondary-color);
    }
    
    /* Field groups */
    .field-group {
      background-color: rgba(248, 249, 250, 0.7);
      border-radius: 10px;
      padding: 1.25rem;
      margin-bottom: 1.5rem;
      border-left: 4px solid var(--primary-color);
    }
    
    .price-field {
      background-color: rgba(248, 249, 250, 0.7);
      border-radius: 10px;
      padding: 1.25rem;
      margin: 1.5rem 0;
      border-left: 4px solid var(--accent-color);
    }
    
    .input-with-icon {
      position: relative;
    }
    
    .input-with-icon .form-control {
      padding-left: 3rem;
    }
    
    .input-icon {
      position: absolute;
      left: 1rem;
      top: 50%;
      transform: translateY(-50%);
      color: var(--secondary-color);
    }
    
    .section-title {
      font-size: 1.1rem;
      font-weight: 600;
      margin-bottom: 1rem;
      color: var(--primary-color);
    }
    
    /* Animation */
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .animate-fadeIn {
      animation: fadeIn 0.5s ease forwards;
    }
    
    /* Total amount display */
    .total-amount-container {
      background: linear-gradient(135deg, #f8f9fa, #ffffff);
      border-radius: 10px;
      padding: 1.5rem;
      margin-top: 1.5rem;
      border: 2px dashed var(--accent-color);
      text-align: center;
    }
    
    .total-amount-label {
      font-size: 1rem;
      color: var(--secondary-color);
      margin-bottom: 0.5rem;
    }
    
    .total-amount {
      font-size: 2.2rem;
      font-weight: 700;
      color: var(--accent-color);
    }
    
    /* Improved responsive design */
    @media (max-width: 768px) {
      .card-body {
        padding: 1.5rem;
      }
      
      .field-group, .price-field {
        padding: 1rem;
      }
      
      .total-amount {
        font-size: 1.8rem;
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
          <li><a class="nav-link scrollto" href="about.jsp">About</a></li>
          <li><a class="nav-link scrollto" href="shop.jsp">Cabs</a></li>
          <li><a class="nav-link scrollto" href="services.jsp">Services</a></li>
          <li><a class="nav-link scrollto" href="contact.jsp">Contact</a></li>
          <li><a class="nav-link scrollto" href="help.jsp">Help</a></li>
          <c:if test="${not empty Driver_Name}">
            <li class="dropdown">
              <a href="#"><span>Welcome ${Driver_Name}</span> <i class="bi bi-chevron-down"></i></a>
              <ul>
                <li><a href="EnterHireCharge.jsp">Enter Hire Charge</a></li>
                <li><a href="FinishJourney.jsp">Finish Journey</a></li>
                <li><a href="CabBookingsDriver.jsp">My Cab Rides</a></li>
                <li><a href="javascript:void(0);" onclick="confirmLogout()">Logout</a></li>
              </ul>
            </li>
          </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
    </div>
  </header><!-- End Header -->

  <main id="main" class="py-5 mt-5">
    <div class="container">
      <div class="form-container animate-fadeIn">
        <div class="section-header">
          <h2>Enter Hire Charge</h2>
          <p>Please enter the hire charge for the current booking</p>
        </div>
        
        <%
          try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");
            String bookingId = request.getParameter("Booking_ID");

            String query = "SELECT booking_table.Booking_ID, booking_table.User_Username, booking_table.User_Telephone_Number, " +
                           "booking_table.User_Address, booking_table.User_Current_Location, booking_table.User_Destination, " +
                           "booking_table.Booked_Date, booking_table.Booked_Time, booking_table.Driver_ID, booking_table.Driver_Name, " +
                           "booking_table.Driver_Telephone_Number, booking_table.Car_Booking_Price " +
                           "FROM booking_table " +
                           "WHERE booking_table.Booking_ID = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, bookingId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
        %>
        <form action="updateHCandTPA" method="post" onsubmit="return formValidation();">
          <div class="card shadow">
            <div class="card-header">
              <h3 class="card-title text-center text-white">Booking #<%= rs.getInt("Booking_ID") %></h3>
            </div>
            <div class="card-body">
              <!-- Booking Info -->
              <input type="hidden" name="Booking_ID" value="<%= rs.getInt("Booking_ID") %>">
              
              <!-- Customer Information -->
              <div class="field-group">
                <div class="section-title"><i class="bi bi-person-fill me-2"></i>Customer Information</div>
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label class="form-label">Customer Name</label>
                    <div class="input-with-icon">
                      <i class="bi bi-person input-icon"></i>
                      <input type="text" class="form-control" name="User_Username" value="<%= rs.getString("User_Username") %>" readonly>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label class="form-label">Telephone Number</label>
                    <div class="input-with-icon">
                      <i class="bi bi-telephone input-icon"></i>
                      <input type="text" class="form-control" name="User_Telephone_Number" value="<%= rs.getInt("User_Telephone_Number") %>" readonly>
                    </div>
                  </div>
                </div>
                <div class="mb-3">
                  <label class="form-label">Address</label>
                  <div class="input-with-icon">
                    <i class="bi bi-house input-icon"></i>
                    <input type="text" class="form-control" name="User_Address" value="<%= rs.getString("User_Address") %>" readonly>
                  </div>
                </div>
              </div>
              
              <!-- Driver Information -->
              <div class="field-group">
                <div class="section-title"><i class="bi bi-person-badge-fill me-2"></i>Driver Information</div>
                <div class="row">
                  <div class="col-md-4 mb-3">
                    <label class="form-label">Driver ID</label>
                    <div class="input-with-icon">
                      <i class="bi bi-credit-card input-icon"></i>
                      <input type="text" class="form-control" name="Driver_ID" value="<%= rs.getInt("Driver_ID") %>" readonly>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <label class="form-label">Driver Name</label>
                    <div class="input-with-icon">
                      <i class="bi bi-person input-icon"></i>
                      <input type="text" class="form-control" name="Driver_Name" value="<%= rs.getString("Driver_Name") %>" readonly>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <label class="form-label">Telephone Number</label>
                    <div class="input-with-icon">
                      <i class="bi bi-telephone input-icon"></i>
                      <input type="text" class="form-control" name="Driver_Telephone_Number" value="<%= rs.getInt("Driver_Telephone_Number") %>" readonly>
                    </div>
                  </div>
                </div>
              </div>
              
              <!-- Trip Information -->
              <div class="field-group">
                <div class="section-title"><i class="bi bi-geo-alt-fill me-2"></i>Trip Information</div>
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label class="form-label">Pickup Location</label>
                    <div class="input-with-icon">
                      <i class="bi bi-geo input-icon"></i>
                      <input type="text" class="form-control" name="User_Current_Location" value="<%= rs.getString("User_Current_Location") %>" readonly>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label class="form-label">Destination</label>
                    <div class="input-with-icon">
                      <i class="bi bi-geo-alt input-icon"></i>
                      <input type="text" class="form-control" name="User_Destination" value="<%= rs.getString("User_Destination") %>" readonly>
                    </div>
                  </div>
                </div>
              </div>
              
              <!-- Price Information -->
              <div class="price-field">
                <div class="section-title"><i class="bi bi-currency-dollar me-2"></i>Price Information</div>
                <div class="row">
                  <div class="col-md-4 mb-3">
                    <label class="form-label">Booking Price (LKR)</label>
                    <div class="input-with-icon">
                      <i class="bi bi-cash input-icon"></i>
                      <input type="text" class="form-control fw-bold" name="Car_Booking_Price" id="txtCarBookingPrice" value="<%= rs.getDouble("Car_Booking_Price") %>" readonly>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <label class="form-label">Hire Charge (LKR) <span class="text-danger">*</span></label>
                    <div class="input-with-icon">
                      <i class="bi bi-plus-circle input-icon"></i>
                      <input type="number" class="form-control fw-bold" name="Hire_Charge" id="txtHireCharge" onchange="calculateTotal()" min="1" required>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <label class="form-label">Total Amount (LKR)</label>
                    <div class="input-with-icon">
                      <i class="bi bi-calculator input-icon"></i>
                      <input type="text" class="form-control fw-bold text-danger" name="Total_Payable_Amount" id="txtTotalPayableAmount" readonly>
                    </div>
                  </div>
                </div>
                
                <!-- Total Display -->
                <div class="total-amount-container">
                  <div class="total-amount-label">TOTAL PAYABLE AMOUNT</div>
                  <div class="total-amount" id="displayTotal">0.00 LKR</div>
                </div>
              </div>
              
              <!-- Submit Button -->
              <div class="d-grid mt-4">
                <button type="submit" class="btn btn-primary btn-lg">
                  <i class="bi bi-check-circle me-2"></i>Confirm Hire Charge
                </button>
              </div>
            </div>
          </div>
        </form>
        <%
            } else {
        %>
          <div class="alert alert-danger text-center" role="alert">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            No booking found with the provided ID.
          </div>
        <%
            }
            con.close();
          } catch (Exception e) {
            e.printStackTrace();
        %>
          <div class="alert alert-danger text-center" role="alert">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            An error occurred while processing your request. Please try again.
          </div>
        <%
          }
        %>
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
  
  <!-- Custom Scripts -->
  <script>
    function calculateTotal() {
      const cabBookingPrice = parseFloat(document.getElementById('txtCarBookingPrice').value);
      const hireCharge = parseFloat(document.getElementById('txtHireCharge').value);
      
      if (isNaN(hireCharge) || hireCharge < 1) {
        document.getElementById('txtHireCharge').value = 1;
        calculateTotal();
        return;
      }
      
      const totalAmount = cabBookingPrice + hireCharge;
      document.getElementById('txtTotalPayableAmount').value = totalAmount.toFixed(2);
      document.getElementById('displayTotal').textContent = totalAmount.toFixed(2) + " LKR";
    }

    function formValidation() {
      const hireCharge = document.getElementById('txtHireCharge').value;
      if (hireCharge < 1) {
        alert("Hire charge must be at least 1.");
        return false;
      }
      return true;
    }

    function confirmLogout() {
      if (confirm("Are you sure you want to log out?")) {
        window.location.href = "LogoutProcess.jsp";
      }
    }

    window.onload = function () {
      document.getElementById('txtHireCharge').value = 1;
      calculateTotal();
    };
  </script>
</body>
</html>