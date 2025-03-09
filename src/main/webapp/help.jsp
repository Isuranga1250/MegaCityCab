<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>  
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mega - City Cab</title>
  <meta content="Help and user guide for Mega City Cab services" name="description">
  <meta content="cab, taxi, rental, help, guide" name="keywords">

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
    .help-icon {
      font-size: 2rem;
      color: #0d6efd;
      margin-bottom: 15px;
    }
    
    .help-card {
      transition: transform 0.3s, box-shadow 0.3s;
      border-radius: 10px;
      overflow: hidden;
      margin-bottom: 25px;
    }
    
    .help-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }
    
    .card-header {
      border-radius: 10px 10px 0 0 !important;
      padding: 15px 20px;
    }
    
    .help-header {
      background: linear-gradient(135deg, #0d6efd, #0a58ca);
      color: white;
    }
    
    .manual-header {
      background: linear-gradient(135deg, #6c757d, #5c636a);
      color: white;
    }
    
    .faq-header {
      background: linear-gradient(135deg, #198754, #157347);
      color: white;
    }
    
    .list-group-item {
      padding: 15px 20px;
      border-left: 0;
      border-right: 0;
    }
    
    .list-group-item:first-child {
      border-top: 0;
    }
    
    .list-group-item-action:hover {
      background-color: #f8f9fa;
    }
    
    .list-group-numbered {
      counter-reset: step-counter;
    }
    
    .breadcrumbs {
      padding: 15px 0;
      background-color: #f8f9fa;
    }
    
    .page-title {
      position: relative;
      margin-bottom: 40px;
      padding-bottom: 15px;
    }
    
    .page-title:after {
      content: '';
      position: absolute;
      display: block;
      width: 50px;
      height: 3px;
      background: #0d6efd;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
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
          <li><a class="nav-link scrollto" href="index.jsp">Home</a></li>
          <li><a class="nav-link scrollto" href="about.jsp">About</a></li>
          <li><a class="nav-link scrollto" href="shop.jsp">Cabs</a></li>
          <li><a class="nav-link scrollto" href="services.jsp">Services</a></li>
          <li><a class="nav-link scrollto" href="contact.jsp">Contact</a></li>
          <li><a class="nav-link scrollto active" href="help.jsp">Help</a></li>
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
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
          <li class="breadcrumb-item active">Help</li>
        </ol>
        <h2 class="fw-bold">Help & Support</h2>
      </div>
    </section><!-- End Breadcrumbs -->
    
    <!-- Help Page Content -->
    <section class="py-5">
      <div class="container">
        <h1 class="text-center page-title">Welcome to Mega City Cab</h1>
        
        <div class="row">
          <!-- How to Get the Car Section -->
          <div class="col-lg-6 mb-4">
            <div class="card help-card shadow-sm h-100">
              <div class="card-header help-header">
                <div class="d-flex align-items-center">
                  <i class="bi bi-car-front help-icon me-3"></i>
                  <h2 class="mb-0 fs-4">How to Get the Cab</h2>
                </div>
              </div>
              <div class="card-body">
                <ol class="list-group list-group-flush">
                  <li class="list-group-item d-flex align-items-start">
                    <div class="ms-2 me-auto">
                      <div class="fw-bold">Create an Account</div>
                      Visit the <a href="index.jsp" class="text-primary">Home Page</a> and click on "Sign Up" to create your account.
                    </div>
                  </li>
                  <li class="list-group-item d-flex align-items-start">
                    <div class="ms-2 me-auto">
                      <div class="fw-bold">Browse Available Cabs</div>
                      Explore our selection in the <a href="shop.jsp" class="text-primary">Cabs</a> section.
                    </div>
                  </li>
                  <li class="list-group-item d-flex align-items-start">
                    <div class="ms-2 me-auto">
                      <div class="fw-bold">Select Your Vehicle</div>
                      Choose your desired car and rental period that fits your needs.
                    </div>
                  </li>
                  <li class="list-group-item d-flex align-items-start">
                    <div class="ms-2 me-auto">
                      <div class="fw-bold">Complete Booking</div>
                      Fill out the booking form with your details.
                    </div>
                  </li>
                  <li class="list-group-item d-flex align-items-start">
                    <div class="ms-2 me-auto">
                      <div class="fw-bold">Secure Payment</div>
                      Make payment through our secure payment gateway.
                    </div>
                  </li>
                  <li class="list-group-item d-flex align-items-start">
                    <div class="ms-2 me-auto">
                      <div class="fw-bold">Confirmation</div>
                      Receive a confirmation email with pickup details.
                    </div>
                  </li>
                  <li class="list-group-item d-flex align-items-start">
                    <div class="ms-2 me-auto">
                      <div class="fw-bold">Pick Up Your Cab</div>
                      Visit the pickup location with your ID and confirmation to get your car.
                    </div>
                  </li>
                </ol>
              </div>
            </div>
          </div>

          <!-- Website Manual Section -->
          <div class="col-lg-6 mb-4">
            <div class="card help-card shadow-sm h-100">
              <div class="card-header manual-header">
                <div class="d-flex align-items-center">
                  <i class="bi bi-book help-icon me-3"></i>
                  <h2 class="mb-0 fs-4">User Manual</h2>
                </div>
              </div>
              <div class="card-body">
                <p class="lead">Navigate our website easily with this guide:</p>
                <div class="list-group list-group-flush">
                  <a href="index.jsp" class="list-group-item list-group-item-action d-flex align-items-center">
                    <i class="bi bi-house-door fs-4 me-3 text-primary"></i>
                    <div>
                      <div class="fw-bold">Home</div>
                      View an overview of our services and promotions
                    </div>
                  </a>
                  <a href="about.jsp" class="list-group-item list-group-item-action d-flex align-items-center">
                    <i class="bi bi-info-circle fs-4 me-3 text-primary"></i>
                    <div>
                      <div class="fw-bold">About</div>
                      Learn more about our company and mission
                    </div>
                  </a>
                  <a href="shop.jsp" class="list-group-item list-group-item-action d-flex align-items-center">
                    <i class="bi bi-car-front fs-4 me-3 text-primary"></i>
                    <div>
                      <div class="fw-bold">Cabs</div>
                      Browse our selection of available vehicles
                    </div>
                  </a>
                  <a href="services.jsp" class="list-group-item list-group-item-action d-flex align-items-center">
                    <i class="bi bi-gear fs-4 me-3 text-primary"></i>
                    <div>
                      <div class="fw-bold">Services</div>
                      Explore our different service offerings
                    </div>
                  </a>
                  <a href="register.jsp" class="list-group-item list-group-item-action d-flex align-items-center">
                    <i class="bi bi-person-plus fs-4 me-3 text-primary"></i>
                    <div>
                      <div class="fw-bold">Sign Up</div>
                      Create an account to access booking features
                    </div>
                  </a>
                  <a href="contact.jsp" class="list-group-item list-group-item-action d-flex align-items-center">
                    <i class="bi bi-chat-dots fs-4 me-3 text-primary"></i>
                    <div>
                      <div class="fw-bold">Contact</div>
                      Get in touch with us for assistance
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
          
          <!-- FAQ Section -->
          <div class="col-12 mb-4">
            <div class="card help-card shadow-sm">
              <div class="card-header faq-header">
                <div class="d-flex align-items-center">
                  <i class="bi bi-question-circle help-icon me-3"></i>
                  <h2 class="mb-0 fs-4">Frequently Asked Questions</h2>
                </div>
              </div>
              <div class="card-body">
                <div class="accordion" id="faqAccordion">
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        What documents do I need to rent a car?
                      </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                      <div class="accordion-body">
                        You'll need a valid driver's license, proof of identity (passport or national ID), and a credit card for security deposit. International visitors may also need an International Driving Permit.
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        How do I cancel my booking?
                      </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                      <div class="accordion-body">
                        You can cancel your booking by logging into your account, going to "My Bookings," and selecting the "Cancel" option. Cancellations made 24 hours before pickup are eligible for a full refund.
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        Is there a security deposit?
                      </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
                      <div class="accordion-body">
                        Yes, we require a security deposit which varies depending on the vehicle type. The deposit is fully refundable upon return of the vehicle in its original condition.
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        What happens if I return the car late?
                      </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
                      <div class="accordion-body">
                        Late returns incur additional charges calculated at an hourly rate. If you know you'll be late, please contact us as soon as possible to make arrangements.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Contact Support Section -->
          <div class="col-lg-12">
            <div class="card help-card bg-light shadow-sm">
              <div class="card-body p-4 text-center">
                <h3 class="mb-4">Need More Help?</h3>
                <p class="lead mb-4">Our customer support team is available 24/7 to assist you with any questions</p>
                <div class="row justify-content-center">
                  <div class="col-md-4 mb-3">
                    <div class="card h-100 border-0 shadow-sm">
                      <div class="card-body text-center p-4">
                        <i class="bi bi-telephone-fill fs-1 text-primary mb-3"></i>
                        <h5>Call Us</h5>
                        <p class="mb-0">+001 5009 52488</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <div class="card h-100 border-0 shadow-sm">
                      <div class="card-body text-center p-4">
                        <i class="bi bi-envelope-fill fs-1 text-primary mb-3"></i>
                        <h5>Email Us</h5>
                        <p class="mb-0">info@megacitycab.com</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <a href="contact.jsp" class="text-decoration-none">
                      <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body text-center p-4">
                          <i class="bi bi-chat-dots-fill fs-1 text-primary mb-3"></i>
                          <h5>Live Chat</h5>
                          <p class="mb-0">Chat with a support agent</p>
                        </div>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
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

    <!-- Template Main JS File -->
    <script src="CSS/js/main.js"></script>
  </main>
</body>
</html>