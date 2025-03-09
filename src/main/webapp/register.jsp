<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">
    
  <!-- Vendor CSS Files -->
  <link href="CSS/Vendor/aos/aos.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="CSS/Vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="CSS/Vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="CSS/Vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="CSS/Vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="CSS/css/style.css" rel="stylesheet">

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
          <li><a class="nav-link scrollto " href="index.jsp">Home</a></li>
          
          <li><a class="nav-link scrollto" href="contact.jsp">Contact</a></li>
          <li><a class="nav-link scrollto" href="register.jsp"><button type="button" class="btn btn-info"><b>Sign Up</b></button></a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main">
    <!-- Breadcrumbs -->
    <section class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="index.jsp">Home</a></li>
          <li>Sign Up</li>
        </ol>
        <h2>Sign Up</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Sign Up Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">
        <div class="row gx-0">
          <!-- Image Section -->
          <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
            <img src="CSS/img/mission.png" class="img-fluid" alt="">
          </div>

          <!-- Form Section -->
          <div class="col-lg-6 mt-5">
            <form action="addCustomer" method="post" class="registration1" id="registration" onsubmit="return formValidation()">
           <h1 style="font-size: 30px;">Please REGISTRATION</h1>
              <!-- action is connect for servlet class -->
              
              <!-- Registration Number -->
              <div class="form-group">
                <label for="registration" class="mb-2">Registration Number</label>
                <input type="text" class="form-control mb-4" id="registration" required="required" name="User_ID">
              </div>

              <!-- Email Address -->
              <div class="form-group">
                <label for="CustomerFullName" class="mb-2">Customer Name</label>
                <input type="text" class="form-control mb-4" id="CustomerFullName" required="required" name="User_Username">
              </div>

              <!-- email. -->
              <div class="form-group">
                <label for="CustomerEmail" class="mb-2">Email Address</label>
                <input type="email" class="form-control mb-4" id="CustomerEmail" required="required" name="User_Email">
              </div>

              <!-- nic -->
              <div class="form-group">
                <label for="nic" class="mb-2">NIC No.</label>
                <input type="text" class="form-control mb-4" id="nic" required="required" name="User_NIC">
              </div>
              
              <!-- Address -->
              <div class="form-group">
                <label for="Address" class="mb-2">Home Address</label>
                <input type="text" class="form-control mb-4" id="Address" required="required" name="User_Address">
              </div>

              <!-- phone -->
              <div class="form-group">
                <label for="phone" class="mb-2">Phone Number</label>
                <input type="tel" class="form-control mb-4" id="phone" required="required" name="User_Telephone_Number">
              </div>

              <!-- Password -->
              <div class="form-group">
            <div class="icons-container">
            <i class="password-hide-icon fas fa-eye-slash" style="left:357px" onclick="togglePasswordVisibility('customerpassword', this)"></i>
            <i class='i-icons fas fa-lock'></i>
            </div>
                <label for="password" class="mb-2">Password</label>
                <input type="password" class="form-control mb-4" id="password" required="required" name="User_Password">
              </div>
              
               <div class="form-group">
            <div class="icons-container">
            <i class="password-hide-icon fas fa-eye-slash" style="left:357px" onclick="togglePasswordVisibility('confirmCustomerPassword', this)"></i>
            <i class='i-icons fas fa-lock'></i>
            </div>
                <label for="password" class="mb-2">Confirm Password</label>
                <input type="password" class="form-control mb-4" id="confirmCustomerPassword" required="required" name="User_Confirm_Password">
              </div>

              <!-- Submit Button -->
              <button type="submit" class="btn btn-primary mt-4">Submit</button>

              <!-- Sign In Link -->
              <p class="mt-4">Already Have An Account? <a href="login.jsp"><b>Sign In</b></a></p>
            </form>
          </div>
        </div>
      </div>
    </section><!-- End Sign Up Section -->
</main><!-- End #main -->


<script>
      function togglePasswordVisibility(fieldId, toggleIcon) {
        var input = document.getElementById(fieldId);
        var isPasswordVisible = input.type === 'password';
        input.type = isPasswordVisible ? 'text' : 'password';
        toggleIcon.className = isPasswordVisible ? 'password-hide-icon fas fa-eye' : 'password-hide-icon fas fa-eye-slash';
      }
    </script>

    <script type="text/javascript">
      function formValidation() {
        var CustomerFullName = document.getElementById('CustomerFullName').value;
        var CustomerEmail = document.getElementById('CustomerEmail').value;
        var CustomerPassword = document.getElementById('customerpassword').value; 
        var ConfirmCustomerPassword = document.getElementById('confirmCustomerPassword').value;

        if (allLetter(CustomerFullName)) {
          if (ValidateEmail(CustomerEmail)) {
            if (PasswordandConfirmPasswordMatching(CustomerPassword, ConfirmCustomerPassword)) {
              return true;
            }
          }
        }
        return false;
      }

      function allLetter(CustomerFullName) {
        var letters = /^[A-Za-z ]+$/; 
        if (CustomerFullName.match(letters)) {
          return true;
        } else {
          alert('Full Name must have alphabet characters and spaces only');
          return false;
        }
      }

      function ValidateEmail(CustomerEmail) {
        var mailformat = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (CustomerEmail.match(mailformat)) {
          return true;
        } else {
          alert("Invalid email address!");
          return false;
        }
      }

      function PasswordandConfirmPasswordMatching(CustomerPassword, ConfirmCustomerPassword) {
        if (CustomerPassword !== ConfirmCustomerPassword) {
          alert("Password and Confirm Password must be equal");
          return false;
        }
        return true;
      }
    </script>
    <script>
      // Function to update both Plan Price and Plan ID based on the selected plan
      function updatePlanDetails() {
        const select = document.getElementById('Membership_Plan_Selection');
        const selectedOption = select.options[select.selectedIndex];
        document.getElementById('PlanPrice').value = selectedOption.dataset.price || 0;
        document.getElementById('PlanID').value = selectedOption.dataset.id || 0; // Plan ID comes from data-id attribute
      }

      // Ensure the details are set for the initially selected option on page load
      window.onload = function () {
        updatePlanDetails();
      };

      // Add event listener for changes in the dropdown
      document.getElementById('Membership_Plan_Selection').addEventListener('change', updatePlanDetails);
    </script>
    
    
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
              <strong>Email:</strong> info@MegaCityCab.com<br>
            </p>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Mega - City Cab</span></strong>. All Rights Reserved
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
    </script>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>



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

</body>

</html>