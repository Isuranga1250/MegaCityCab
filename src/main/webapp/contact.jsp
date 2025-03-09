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

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
          <li><a class="nav-link scrollto " href="about.jsp">About</a></li>
          <li><a class="nav-link scrollto" href="shop.jsp">Cabs</a></li>
          <li><a class="nav-link scrollto" href="services.jsp">Services</a></li>
          <li><a class="nav-link scrollto active" href="contact.jsp">Contact</a></li>
          <li><a class="nav-link scrollto" href="help.jsp">Help</a></li>
          <li><a class="nav-link scrollto" href="register.jsp"><button type="button" class="btn btn-info"><b>Sign Up</b></button></a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.jsp">Home</a></li>
          <li>Contact</li>
        </ol>
        <h2>Contact</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">

      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h2>Contact</h2>
          <p>Contact Us</p>
        </header>

        <div class="row gy-4">

          <div class="col-lg-6">

            <div class="row gy-4">
              <div class="col-md-6">
                <div class="info-box">
                  <i class="bi bi-geo-alt"></i>
                  <h3>Address</h3>
                  <p>No 141/2,
                    Galle Rd, <br>Colombo,
                    Sri Lanka</p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="info-box">
                  <i class="bi bi-telephone"></i>
                  <h3>Call Us</h3>
                  <p>+001 5589 55488<br>+1 6678 254445 41</p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="info-box">
                  <i class="bi bi-envelope"></i>
                  <h3>Email Us</h3>
                  <p>info@MegaCityCab.com</p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="info-box">
                  <i class="bi bi-clock"></i>
                  <h3>Open Hours</h3>
                  <p>Monday - Friday<br>9:00AM - 06:00PM</p>
                </div>
              </div>
            </div>

          </div>

          <div class="col-lg-6">
            <div>
              <div class="row gy-4">

                <div class="col-md-6">
                  <input type="text" name="name" class="form-control" id="input1" placeholder="Your Name" required>
                </div>

                <div class="col-md-6 ">
                  <input type="text" class="form-control" name="email" id="input2" placeholder="Your Email" required>
                </div>

                <div class="col-md-12">
                  <textarea class="form-control" name="message" rows="6" id="input3" placeholder="Message"
                    required></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <button onclick="save()" class="btn btn-primary">Send Message</button>
                </div>

              </div>
            </div>

          </div>

        </div>

      </div>

    </section><!--End Contact Section -->

  </main><!-- End #main -->

  <script>

    function save() {
      let name = $("#input1").val();
      let email = $("#input2").val();
      let message = $("#input3").val();

      $.ajax({
        method: "POST",
        contentType: "application/json",
        url: "http://localhost:8090/api/v1/contact/savecontact",
        async: true,
        data: JSON.stringify({
          name: name,
          email: email,
          message: message,
        }),
        success: function (data) {
          alert("Message Delivered Successfully");
          window.location.href = '?refresh=true';
        },
        error: function (xhr, exception) {
          alert("Error");
        },
      });
    }
  </script>



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


  <!-- Js Plugins -->
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.nice-select.min.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script src="js/jquery.slicknav.js"></script>
  <script src="js/mixitup.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/main.js"></script>


</body>
</html>