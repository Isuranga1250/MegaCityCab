<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*, java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Book your cab - Mega City Cab">
    <meta name="keywords" content="cab, taxi, rental, booking">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Book Cab - Mega City Cab</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    
    <!-- CSS Links -->
    <link href="CSS/Vendor/aos/aos.css" rel="stylesheet">
    <link href="CSS/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="CSS/Vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="CSS/Vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="CSS/Vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="CSS/Vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="CSS/css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="./CSS/img/carlogo.png" type="image/">

    <style>
        .booking-container {
            padding-top: 120px;
            padding-bottom: 60px;
            background-color: #f8f9fa;
        }
        
        .booking-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            padding: 2.5rem;
            margin-bottom: 2rem;
            transition: all 0.3s ease;
        }
        
        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.15);
        }
        
        .car-image-container {
            position: relative;
            overflow: hidden;
            border-radius: 12px;
            margin-bottom: 1.5rem;
        }
        
        .car-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .car-image-container:hover .car-image {
            transform: scale(1.05);
        }
        
        .section-title {
            position: relative;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            text-align: center;
            font-weight: 700;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            display: block;
            width: 50px;
            height: 3px;
            background: #4154f1;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .price-highlight {
            font-size: 1.5rem;
            color: #4154f1;
            font-weight: 700;
        }
        
        .form-control {
            padding: 0.75rem 1.25rem;
            border-radius: 8px;
        }
        
        .form-control[readonly] {
            background-color: #f8f9fa;
            border-color: #dee2e6;
        }
        
        .form-label {
            font-weight: 600;
            color: #444;
            margin-bottom: 0.5rem;
        }
        
        .section-divider {
            display: flex;
            align-items: center;
            margin: 2rem 0;
        }
        
        .section-divider h5 {
            margin-bottom: 0;
            margin-right: 1rem;
            font-weight: 700;
            color: #4154f1;
        }
        
        .section-divider .line {
            flex-grow: 1;
            height: 1px;
            background-color: #e0e0e0;
        }
        
        .btn-book-now {
            padding: 0.75rem 2rem;
            font-weight: 600;
            border-radius: 50px;
            transition: all 0.3s ease;
            background: linear-gradient(to right, #4154f1, #5969f3);
            border: none;
        }
        
        .btn-book-now:hover {
            background: linear-gradient(to right, #3143e0, #485ae2);
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(65, 84, 241, 0.3);
        }
        
        .info-box {
            margin-top: 2rem;
            padding: 1.5rem;
            border-radius: 10px;
            background-color: #f0f6ff;
            border-left: 5px solid #4154f1;
        }
        
        .breadcrumbs {
            padding: 15px 0;
            background: #012970;
            min-height: 40px;
            margin-top: 82px;
            color: #fff;
        }
        
        .breadcrumbs h2 {
            font-size: 28px;
            font-weight: 500;
        }
        
        .breadcrumbs ol {
            display: flex;
            flex-wrap: wrap;
            list-style: none;
            padding: 0 0 10px 0;
            margin: 0;
            font-size: 14px;
        }
        
        .breadcrumbs ol a {
            color: #fff;
            transition: 0.3s;
        }
        
        .breadcrumbs ol a:hover {
            text-decoration: underline;
        }
        
        .breadcrumbs ol li + li {
            padding-left: 10px;
        }
        
        .breadcrumbs ol li + li::before {
            display: inline-block;
            padding-right: 10px;
            color: #8894f6;
            content: "/";
        }
    </style>
</head>

<body>
    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top">
        <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
            <a href="index.jsp" class="logo d-flex align-items-center">
                <img src="CSS/img/car.png" alt="">
                <span>Mega - City Cab</span>
            </a>

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link scrollto" href="index.jsp">Home</a></li>
                    <li><a class="nav-link scrollto" href="about.jsp">About</a></li>
                    <li><a class="nav-link scrollto active" href="shop.jsp">Cabs</a></li>
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
                            <li><a class="nav-link scrollto" href="register.jsp"><button type="button" class="btn btn-info"><b>Sign Up</b></button></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>
        </div>
    </header>

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
        <div class="container">
            <ol>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="shop.jsp">Cabs</a></li>
                <li>Book Cab</li>
            </ol>
            <h2>Book Your Cab</h2>
        </div>
    </section>

    <main id="main">
        <section class="booking-container">
            <div class="container" data-aos="fade-up">
                <div class="booking-card">
                    <h2 class="section-title">Complete Your Booking</h2>
                    
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");
                            String carId = request.getParameter("Car_ID");
                            
                            String query = "SELECT car_table.*, driver_table.Driver_Name, driver_table.Driver_Telephone_Number " +
                                         "FROM car_table LEFT JOIN driver_table ON car_table.Driver_ID = driver_table.Driver_ID " +
                                         "WHERE car_table.Car_ID = ?";
                            
                            PreparedStatement ps = con.prepareStatement(query);
                            ps.setString(1, carId);
                            ResultSet rs = ps.executeQuery();
                            
                            if (rs.next()) {
                                byte[] imgData = rs.getBytes("Car_Image");
                                String base64Image = null;
                                if (imgData != null) {
                                    base64Image = Base64.getEncoder().encodeToString(imgData);
                                }
                    %>
                    
                    <form action="addBooking" method="post">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="car-image-container">
                                    <% if (base64Image != null) { %>
                                        <img class="car-image" src="data:image/jpeg;base64,<%= base64Image %>" alt="Car Image">
                                    <% } else { %>
                                        <img class="car-image" src="CSS/img/car-placeholder.jpg" alt="Car Image">
                                    <% } %>
                                </div>
                                
                                <div class="info-box">
                                    <h5><i class="bi bi-info-circle me-2"></i>Booking Information</h5>
                                    <p class="mb-0">Please review all the details carefully before confirming your booking. The exact hire charge and total amount will be confirmed after your booking request is processed.</p>
                                </div>
                            </div>
                            
                            <div class="col-lg-6">
                                <div class="row g-3">
                                    <!-- Car Details Section -->
                                    <div class="col-12">
                                        <div class="section-divider">
                                            <h5><i class="bi bi-car-front me-2"></i>Vehicle Details</h5>
                                            <div class="line"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Car ID</label>
                                        <input type="text" class="form-control" name="Car_ID" readonly value="<%= rs.getInt("Car_ID") %>">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Car Name</label>
                                        <input type="text" class="form-control" name="Car_Name" readonly value="<%= rs.getString("Car_Name") %>"> 
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Brand</label>
                                        <input type="text" class="form-control" name="Car_Brand" readonly value="<%= rs.getString("Car_Brand") %>">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Color</label>
                                        <input type="text" class="form-control" name="Car_Colour" readonly value="<%= rs.getString("Car_Colour") %>">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Number Plate</label>
                                        <input type="text" class="form-control" name="Car_Number_Plate" readonly value="<%= rs.getString("Car_Number_Plate") %>">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Daily Price (LKR)</label>
                                        <input type="text" class="form-control price-highlight" name="Car_Booking_Price" readonly 
                                              value="<%= rs.getDouble("Car_Booking_Price") %>">
                                    </div>
                                    
                                    <!-- Driver Details Section -->
                                    <div class="col-12">
                                        <div class="section-divider">
                                            <h5><i class="bi bi-person me-2"></i>Driver Details</h5>
                                            <div class="line"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Driver ID</label>
                                        <input type="text" class="form-control" name="Driver_ID" readonly value="<%= rs.getInt("Driver_ID") %>">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Driver Name</label>
                                        <input type="text" class="form-control" name="Driver_Name" readonly value="<%= rs.getString("Driver_Name") %>">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Driver Contact</label>
                                        <input type="text" class="form-control" name="Driver_Telephone_Number" readonly value="<%= rs.getInt("Driver_Telephone_Number") %>">
                                    </div>
                                    
                                    <!-- User Details Section -->
                                    <div class="col-12">
                                        <div class="section-divider">
                                            <h5><i class="bi bi-person-badge me-2"></i>Your Details</h5>
                                            <div class="line"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Name</label>
                                        <input type="text" class="form-control" readonly value="${User_Username}" name="User_Username">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">User ID</label>
                                        <input type="text" class="form-control" readonly value="${User_ID}" name="User_ID">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Contact Number</label>
                                        <input type="text" class="form-control" readonly value="${User_Telephone_Number}" name="User_Telephone_Number">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Address</label>
                                        <input type="text" class="form-control" readonly value="${User_Address}" name="User_Address">
                                    </div>
                                    
                                    <!-- Trip Details Section -->
                                    <div class="col-12">
                                        <div class="section-divider">
                                            <h5><i class="bi bi-geo-alt me-2"></i>Trip Information</h5>
                                            <div class="line"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Pickup Location</label>
                                        <input type="text" class="form-control" name="User_Current_Location" required placeholder="Enter your pickup location">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Destination</label>
                                        <input type="text" class="form-control" name="User_Destination" required placeholder="Enter your destination">
                                    </div>
                                    
                                    <!-- Payment Information -->
                                    <div class="col-12">
                                        <div class="section-divider">
                                            <h5><i class="bi bi-credit-card me-2"></i>Payment Information</h5> 
                                            <br><h9>After you have booked a cab and completed the journey you can get your payment charge by visiting <b>my cab booking</b>.</h9>
                                            <div class="line"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Hire Charge</label>
                                        <input type="text" class="form-control" readonly value="Will be Notified Soon" name="Hire_Charge">
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Total Payable Amount</label>
                                        <input type="text" class="form-control" readonly value="Will be Notified Soon" name="Total_Payable_Amount">
                                    </div>
                                    
                                    <!-- Submit Button -->
                                    <div class="col-12 mt-4">
                                        <button type="submit" class="btn btn-primary btn-book-now w-100">
                                            <i class="bi bi-car-front me-2"></i> Confirm Booking
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <%
                            } else {
                                out.println("<div class='alert alert-danger'>No cab found with the provided ID</div>");
                            }
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </div>
            </div>
        </section>
    </main>

    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row gy-4">
                    <div class="col-lg-4 col-md-12 footer-info">
                        <a href="index.html" class="logo d-flex align-items-center">
                            <img src="CSS/img/car.png" alt="">
                            <span>𝐂𝐢𝐭𝐲 𝐂𝐚𝐛</span>
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
                            <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">Luxury Car Hire</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="services.jsp">24/7 Roadside Assistance</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-4 col-md-12 footer-contact text-center text-md-start">
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
    </footer>

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Scripts -->
    <script src="CSS/Vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="CSS/Vendor/aos/aos.js"></script>
    <script src="CSS/Vendor/glightbox/js/glightbox.min.js"></script>
    <script src="CSS/Vendor/swiper/swiper-bundle.min.js"></script>
    <script src="CSS/js/main.js"></script>

    <script>
        function confirmLogout() {
            if (confirm("Are you sure you want to log out?")) {
                window.location.href = "LogoutProcess.jsp";
            }
        }
        
        // Initialize AOS
        AOS.init({
            duration: 1000,
            easing: "ease-in-out",
            once: true,
            mirror: false
        });
    </script>
</body>
</html>