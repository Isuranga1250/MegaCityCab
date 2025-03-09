<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">

    
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mega - City Cab</title>
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
</head>

<body>

<!-- ======= Header ======= -->
  <!-- ======= Header ======= -->
<header id="header" class="header fixed-top">
  <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

    <a href="index.jsp" class="logo d-flex align-items-center">
      <img src="CSS/img/car.png" alt="">
      <span><b>Mega - City Cab</b></span>
    </a>

 <%
        // Retrieve session attributes safely
        Integer User_ID = (Integer) session.getAttribute("User_ID");
        String User_Username = (String) session.getAttribute("User_Username");
        Integer User_Telephone_Number = (Integer) session.getAttribute("User_Telephone_Number");
        String User_Address = (String) session.getAttribute("User_Address");
        Integer Driver_ID = (Integer) session.getAttribute("Driver_ID");
        String Driver_Name = (String) session.getAttribute("Driver_Name");
    %>

        

    <c:choose>
        
      <c:when test="${not empty User_Username && not empty User_ID}">
      
       <nav id="navbar" class="navbar">
          <ul>
          	<li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
            <li><a class="nav-link scrollto" href="about.jsp">About</a></li>
            <li><a class="nav-link scrollto" href="shop.jsp">Cabs</a></li>
            <li><a class="nav-link scrollto" href="services.jsp">Services</a></li>
            <li><a class="nav-link scrollto" href="contact.jsp">Contact</a></li>
            <li><a class="nav-link scrollto" href="help.jsp">Help</a></li>
            <li><a class="nav-link scrollto" href="javascript:void(0);" onclick="confirmLogout()">LOGOUT</a></li>
          </ul>
          
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- Display navbar2 and user content if logged in -->
        
        <nav id="navbar" class="navbar">
          <ul>
            <li><a class="nav-link scrollto" href="CabBookingsCustomer.jsp">MY CAB BOOKINGS</a></li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
       <div class="position-absolute top-0 end-0 m-3 text-primary">
    <h5 class="text-muted">WELCOME ${User_Username}</h5>
</div>


      </c:when>

      <c:when test="${not empty Driver_Name && not empty Driver_ID}">
      
       <nav id="navbar" class="navbar">
          <ul>
            <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
            <li><a class="nav-link scrollto" href="about.jsp">About</a></li>
            <li><a class="nav-link scrollto" href="services.jsp">Services</a></li>
            
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- Display navbar2 and driver content if logged in -->
        <nav id="navbar" class="navbar2">
          <ul>
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
        
      </c:when>

      <c:otherwise>
        <!-- Default navigation for non-logged-in users -->
        <nav id="navbar" class="navbar">
          <ul>
            <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
            <li><a class="nav-link scrollto" href="about.jsp">About</a></li>
            <li><a class="nav-link scrollto" href="shop.jsp">Cabs</a></li>
            <li><a class="nav-link scrollto" href="services.jsp">Services</a></li>
            <li><a class="nav-link scrollto" href="contact.jsp">Contact</a></li>
            <li><a class="nav-link scrollto" href="help.jsp">Help</a></li>
            <li><a class="nav-link scrollto" href="register.jsp"><button type="button" class="btn btn-info"><b>Sign Up</b></button></a></li>
            <li><a class="nav-link scrollto" href="DriverRegister.jsp"><button type="button" class="btn btn-info"><b>Sign Up Driver</b></button></a></li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
      </c:otherwise>
    </c:choose>

  </div>
</header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero d-flex align-items-center">

    <div class="container"> <!-- ---------------------------- -->
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center"> <!-- ---------------------------- -->
          <h1 class="pt-5" data-aos="fade-up">Expert Mega City Cab Service</h1>
          <h2 data-aos="fade-up" data-aos-delay="400">Our company specializes in delivering exceptional car rental services meticulously designed to ensure that every aspect of your journey is convenient. </h2>
          <div data-aos="fade-up" data-aos-delay="600">
            <div class="text-center text-lg-start">
              <a href="about.jsp" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center ">
                <span>Get Started</span>
                <i class="bi bi-arrow-right"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="col-lg-6 hero-img pt-5" data-aos="zoom-out" data-aos-delay="200">
          <img src="CSS/img/car.png" class="img-fluid" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

  <main id="main">
    <!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">  <!-- ---------------------------- -->
        <div class="row gx-0">

          <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
            <div class="content">
              <h3>Who We Are</h3>
              <h2>Book today and experience the difference with a trusted car rental partner!</h2>
              <p>
                At Mega City Cab, we redefine car rentals by offering an unparalleled experience tailored to your needs. Whether you’re looking for a quick ride across town or a long-term rental for an extended trip, we’ve got you covered. Our fleet includes a wide range of vehicles, from sleek compact cars to spacious SUVs, ensuring you find the perfect ride for every journey.
              </p>
              <div class="text-center text-lg-start">
                <a href="about.jsp" class="btn-read-more d-inline-flex align-items-center justify-content-center align-self-center">
                  <span>Read More</span>
                  <i class="bi bi-arrow-right"></i>
                </a>
              </div>
            </div>
          </div>

          <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
            <img src="CSS/img/redca.png" class="img-fluid" alt="">
          </div>

        </div>
      </div>

    </section><!-- End About Section -->

   
    <!-- ======= Car Rental Pricing Section ======= -->
<section id="pricing" class="pricing">

  <div class="container" data-aos="fade-up">

    <header class="section-header">
      <h2>Our vehicle fleet</h2>
      <p>Find cheap car hire in Your Area.</p>
    </header>

    <div class="row">

      <!-- Mini Car -->
      <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
        <div class="box">
          <img src="CSS/img/suzuki_wagonr.webp" class="img-fluid" alt="Mini Car">
          <h3>𝐌𝐢𝐧𝐢</h3>
          <p>4-5 doors | 1-4 passengers | 3 bags</p>
          <p class="price">LKR 11,657 <span>per day</span></p>
          <a href="shop.jsp" class="btn btn-primary">Book Now</a>
        </div>
      </div>

      <!-- Economy Car -->
      <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="400">
        <div class="box">
          <img src="CSS/img/toyota_corolla_fielder.webp" class="img-fluid" alt="Economy Car">
          <h3>𝐄𝐜𝐨𝐧𝐨𝐦𝐲</h3>
          <p>4-5 doors | 1-4 passengers | 2 bags</p>
          <p class="price">LKR 15,719 <span>per day</span></p>
          <a href="shop.jsp" class="btn btn-primary">Book Now</a>
        </div>
      </div>

      <!-- Intermediate Car -->
      <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="600">
        <div class="box">
          <img src="CSS/img/car3.jpg" class="img-fluid" alt="Intermediate Car">
          <h3>𝐈𝐧𝐭𝐞𝐫𝐦𝐞𝐝𝐢𝐚𝐭𝐞</h3>
          <p>4-5 doors | 1-5 passengers | 4 bags</p>
          <p class="price">LKR 19,186 <span>per day</span></p>
          <a href="shop.jsp" class="btn btn-primary">Book Now</a>
        </div>
      </div>

      <!-- Compact Car -->
      <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="800">
        <div class="box">
          <img src="CSS/img/toyota_prado.webp" class="img-fluid" alt="Compact Car">
          <h3>𝐂𝐨𝐦𝐩𝐚𝐜𝐭</h3>
          <p>4-5 doors | 1-4 passengers | 3 bags</p>
          <p class="price">LKR 32,952 <span>per day</span></p>
          <a href="shop.jsp" class="btn btn-primary">Book Now</a>
        </div>
      </div>


     <!-- Show More Button -->
             <div class="text-center mt-4">
               <a href="shop.jsp" class="btn btn-outline-primary">Show more car hire deals</a>
            </div>

    </div>

  </div>

</section>
             <!-- End Car Rental Pricing Section -->

    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts">
      <div class="container" data-aos="fade-up">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6">
            <div class="count-box">
              <i class="bi bi-emoji-smile"></i>
              <div>
                <span data-purecounter-start="0" data-purecounter-end="10000" data-purecounter-duration="1" class="purecounter"></span>
                <p>Happy Clients</p>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="count-box">
              <i class="bi bi-journal-richtext" style="color: #ee6c20;"></i>
              <div>
                <span data-purecounter-start="0" data-purecounter-end="3000" data-purecounter-duration="1" class="purecounter"></span>
                <p>Car Rental</p>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="count-box">
              <i class="bi bi-headset" style="color: #15be56;"></i>
              <div>
                <span data-purecounter-start="0" data-purecounter-end="5000" data-purecounter-duration="1" class="purecounter"></span>
                <p>Hours Of Support</p>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="count-box">
              <i class="bi bi-check" style="color: #bb0852;"></i>
              <div>
                <span data-purecounter-start="0" data-purecounter-end="34" data-purecounter-duration="1" class="purecounter"></span>
                <p>Years Completed</p>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Counts Section -->

    <!-- ======= Features Section ======= -->
    <section id="features" class="features">

      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h2>Why choose us?</h2>
          <p>𝐑𝐞𝐚𝐬𝐨𝐧𝐬 𝐰𝐡𝐲 𝐰𝐞 𝐚𝐫𝐞 𝐭𝐡𝐞 𝐛𝐞𝐬𝐭 𝐜𝐚𝐫 𝐫𝐞𝐧𝐭𝐚𝐥 𝐜𝐨𝐦𝐩𝐚𝐧𝐲 𝐢𝐧 𝐒𝐫𝐢 𝐋𝐚𝐧𝐤𝐚.</p>
        </header>

        <div class="row">

          <div class="col-lg-6">
            <img src="CSS/img/rentt.jpg" class="img-fluid" alt="">
          </div>

          <div class="col-lg-6 mt-5 mt-lg-0 d-flex">
            <div class="row align-self-center gy-4">

              <div class="col-md-6" data-aos="zoom-out" data-aos-delay="200">
                <div class="feature-box d-flex align-items-center">
                  <i class="bi bi-journal-bookmark-fill"></i>
                  <h3>Easy and secure online booking capability</h3>
                </div>
              </div>

              <div class="col-md-6" data-aos="zoom-out" data-aos-delay="300">
                <div class="feature-box d-flex align-items-center">
                  <i class="bi bi-journals"></i>
                  <h3>Free cancellation and booking amendments</h3>
                </div>
              </div>

              <div class="col-md-6" data-aos="zoom-out" data-aos-delay="400">
                <div class="feature-box d-flex align-items-center">
                  <i class="bi bi-speedometer2"></i>
                  <h3>Unlimited Mileage for complete freedom</h3>
                </div>
              </div>

              <div class="col-md-6" data-aos="zoom-out" data-aos-delay="500">
                <div class="feature-box d-flex align-items-center">
                  <i class="bi bi-headset"></i>
                  <h3>Trusted positive reviews by our customers</h3>
                </div>
              </div>

              <div class="col-md-6" data-aos="zoom-out" data-aos-delay="600">
                <div class="feature-box d-flex align-items-center">
                   <i class="bi bi-ev-front-fill"></i>
                  <h3>Lowest collision damage waiver rates</h3>
                </div>
              </div>

              <div class="col-md-6" data-aos="zoom-out" data-aos-delay="700">
                <div class="feature-box d-flex align-items-center">
                  <i class="bi bi-file-earmark-person"></i>
                  <h3>24/7 customer support and breakdown assistance</h3>
                </div>
              </div>

            </div>
          </div>

        </div> <!-- / row -->

        <!-- Feature Tabs
        <div class="row feture-tabs" data-aos="fade-up">
          <div class="col-lg-6">
            <h3>Neque officiis dolore maiores et exercitationem quae est seda lidera pat claero</h3>

            Tabs
            <ul class="nav nav-pills mb-3">
              <li>
                <a class="nav-link active" data-bs-toggle="pill" href="#tab1">Saepe fuga</a>
              </li>
              <li>
                <a class="nav-link" data-bs-toggle="pill" href="#tab2">Voluptates</a>
              </li>
              <li>
                <a class="nav-link" data-bs-toggle="pill" href="#tab3">Corrupti</a>
              </li>
            </ul> End Tabs

            Tab Content
            <div class="tab-content">

              <div class="tab-pane fade show active" id="tab1">
                <p>Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem.</p>
                <div class="d-flex align-items-center mb-2">
                  <i class="bi bi-check2"></i>
                  <h4>Repudiandae rerum velit modi et officia quasi facilis</h4>
                </div>
                <p>Laborum omnis voluptates voluptas qui sit aliquam blanditiis. Sapiente minima commodi dolorum non eveniet magni quaerat nemo et.</p>
                <div class="d-flex align-items-center mb-2">
                  <i class="bi bi-check2"></i>
                  <h4>Incidunt non veritatis illum ea ut nisi</h4>
                </div>
                <p>Non quod totam minus repellendus autem sint velit. Rerum debitis facere soluta tenetur. Iure molestiae assumenda sunt qui inventore eligendi voluptates nisi at. Dolorem quo tempora. Quia et perferendis.</p>
              </div>End Tab 1 Content

              <div class="tab-pane fade show" id="tab2">
                <p>Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem.</p>
                <div class="d-flex align-items-center mb-2">
                  <i class="bi bi-check2"></i>
                  <h4>Repudiandae rerum velit modi et officia quasi facilis</h4>
                </div>
                <p>Laborum omnis voluptates voluptas qui sit aliquam blanditiis. Sapiente minima commodi dolorum non eveniet magni quaerat nemo et.</p>
                <div class="d-flex align-items-center mb-2">
                  <i class="bi bi-check2"></i>
                  <h4>Incidunt non veritatis illum ea ut nisi</h4>
                </div>
                <p>Non quod totam minus repellendus autem sint velit. Rerum debitis facere soluta tenetur. Iure molestiae assumenda sunt qui inventore eligendi voluptates nisi at. Dolorem quo tempora. Quia et perferendis.</p>
              </div>End Tab 2 Content

              <div class="tab-pane fade show" id="tab3">
                <p>Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem.</p>
                <div class="d-flex align-items-center mb-2">
                  <i class="bi bi-check2"></i>
                  <h4>Repudiandae rerum velit modi et officia quasi facilis</h4>
                </div>
                <p>Laborum omnis voluptates voluptas qui sit aliquam blanditiis. Sapiente minima commodi dolorum non eveniet magni quaerat nemo et.</p>
                <div class="d-flex align-items-center mb-2">
                  <i class="bi bi-check2"></i>
                  <h4>Incidunt non veritatis illum ea ut nisi</h4>
                </div>
                <p>Non quod totam minus repellendus autem sint velit. Rerum debitis facere soluta tenetur. Iure molestiae assumenda sunt qui inventore eligendi voluptates nisi at. Dolorem quo tempora. Quia et perferendis.</p>
              </div>End Tab 3 Content -

            </div>

          </div>

          <div class="col-lg-6">
            <img src="assets/img/features-2.png" class="img-fluid" alt="">
          </div>

        </div> End Feature Tabs -->

        <!-- Feature Icons
        <div class="row feature-icons" data-aos="fade-up">
          <h3>Ratione mollitia eos ab laudantium rerum beatae quo</h3>

          <div class="row">

            <div class="col-xl-4 text-center" data-aos="fade-right" data-aos-delay="100">
              <img src="assets/img/features-3.png" class="img-fluid p-4" alt="">
            </div>

            <div class="col-xl-8 d-flex content">
              <div class="row align-self-center gy-4">

                <div class="col-md-6 icon-box" data-aos="fade-up">
                  <i class="ri-line-chart-line"></i>
                  <div>
                    <h4>Corporis voluptates sit</h4>
                    <p>Consequuntur sunt aut quasi enim aliquam quae harum pariatur laboris nisi ut aliquip</p>
                  </div>
                </div>

                <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="100">
                  <i class="ri-stack-line"></i>
                  <div>
                    <h4>Ullamco laboris nisi</h4>
                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt</p>
                  </div>
                </div>

                <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="200">
                  <i class="ri-brush-4-line"></i>
                  <div>
                    <h4>Labore consequatur</h4>
                    <p>Aut suscipit aut cum nemo deleniti aut omnis. Doloribus ut maiores omnis facere</p>
                  </div>
                </div>

                <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="300">
                  <i class="ri-magic-line"></i>
                  <div>
                    <h4>Beatae veritatis</h4>
                    <p>Expedita veritatis consequuntur nihil tempore laudantium vitae denat pacta</p>
                  </div>
                </div>

                <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="400">
                  <i class="ri-command-line"></i>
                  <div>
                    <h4>Molestiae dolor</h4>
                    <p>Et fuga et deserunt et enim. Dolorem architecto ratione tensa raptor marte</p>
                  </div>
                </div>

                <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="500">
                  <i class="ri-radar-line"></i>
                  <div>
                    <h4>Explicabo consectetur</h4>
                    <p>Est autem dicta beatae suscipit. Sint veritatis et sit quasi ab aut inventore</p>
                  </div>
                </div>

              </div>
            </div>

          </div>

        </div> End Feature Icons -->

      </div>

    </section><!-- End Features Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">

      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h2>Our Services</h2>
          <p>Empowering Journeys, Delivering Excellence.</p>
        </header>

        <div class="row gy-4">

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <div class="service-box blue">
              <i class="ri-discuss-line icon"></i>
              <h3>𝐒𝐞𝐥𝐟-𝐝𝐫𝐢𝐯𝐞 𝐯𝐞𝐡𝐢𝐜𝐥𝐞𝐬</h3>
              <p>Explore Sri Lanka with  𝗠𝗲𝗴𝗮 - 𝗖𝗶𝘁𝘆 𝗖𝗮𝗯’𝘀 affordable self-drive options, insured vehicles, and convenient pick-up/drop-off services across major cities for a seamless travel experience.</p>
              <a href="services.html" class="read-more"><span>Read More</span> <i class="bi bi-arrow-right"></i></a>
            </div>
          </div>
          

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <div class="service-box orange">
              <i class="ri-discuss-line icon"></i>
              <h3>𝐖𝐢𝐭𝐡-𝐝𝐫𝐢𝐯𝐞𝐫 𝐯𝐞𝐡𝐢𝐜𝐥𝐞𝐬</h3>
              <p>Relax and enjoy your journey with 𝗠𝗲𝗴𝗮 - 𝗖𝗶𝘁𝘆 𝗖𝗮𝗯’𝘀 professional chauffeur-driven vehicle service. Travel in comfort and style across Sri Lanka while leaving the driving to our experienced drivers.</p>
              <a href="services.html" class="read-more"><span>Read More</span> <i class="bi bi-arrow-right"></i></a>
            </div>
          </div>

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
            <div class="service-box red">
              <i class="ri-discuss-line icon"></i>
              <h3>𝐑𝐨𝐚𝐝-𝐬𝐢𝐝𝐞 𝐚𝐬𝐬𝐢𝐬𝐭𝐚𝐧𝐜𝐞</h3>
              <p>𝗠𝗲𝗴𝗮 - 𝗖𝗶𝘁𝘆 𝗖𝗮𝗯’𝘀 ensures a worry-free journey with 24/7 roadside assistance. Whether it’s a flat tire, engine trouble, or any unexpected issue, our team is ready to provide quick support anywhere in Sri Lanka.</p>
              <a href="services.html" class="read-more"><span>Read More</span> <i class="bi bi-arrow-right"></i></a>
            </div>
          </div>

        </div>

      </div>

    </section><!-- End Services Section -->

    
    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials">

      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h2>Testimonials</h2>
          <p>What they are saying about us</p>
        </header>

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="200">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
               Absolutely phenomenal! The service provided by Mega City Cab was exceptional. Their seamless booking process, well-maintained vehicles, and friendly staff made my journey comfortable and stress-free. I highly recommend them for anyone looking for a reliable car rental experience!                </p>
                <div class="profile mt-auto">
                  <img src="CSS/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                  <h3>Alex R.</h3>
                  <h4>Ceo &amp; Founder</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
              Booking with Mega City Cab was so easy and hassle-free. Their website is user-friendly, and the entire process took just a few minutes. The car was ready on time, and the drive was smooth. Will definitely use them again!                </p>
                <div class="profile mt-auto">
                  <img src="CSS/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                  <h3>Jessica W.</h3>
                  <h4>Designer</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
              The team at Mega City Cab is amazing! They helped me choose the perfect car for my family vacation, and their 24/7 support was a lifesaver when I had questions during my trip. Truly a customer-first company!                </p>
                <div class="profile mt-auto">
                  <img src="CSS/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                  <h3>Daniel M.</h3>
                  <h4>Store Owner</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
            As a frequent traveler, I rely on Mega City Cab for all my business trips. Their premium cars are always in excellent condition, and their punctuality is unmatched. A trusted partner for professionals!                </p>
                <div class="profile mt-auto">
                  <img src="CSS/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                  <h3>Lauren S.</h3>
                  <h4>Freelancer</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
           We rented a spacious SUV for our family trip, and it was perfect! Mega City Cab made sure we had everything we needed, including child seats. Their attention to detail and friendly service made our journey unforgettable.                </p>
                 <div class="profile mt-auto">
                  <img src="CSS/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                  <h3>Mark L.</h3>
                  <h4>Entrepreneur</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>

    </section><!-- End Testimonials Section -->

   
    <!-- ======= F.A.Q Section ======= -->
    <section id="faq" class="faq">

      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h2>F.A.Q</h2>
          <p>Frequently Asked Questions</p>
        </header>

        <div class="row">
          <div class="col-lg-6">
            <!-- F.A.Q List 1-->
            <div class="accordion accordion-flush" id="faqlist1">
              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                     How much does it cost to hire a car in Sri Lanka?
                  </button>
                </h2>
                <div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  <div class="accordion-body">
m                    On average a car hire in Sri Lanka costs LKR 9500 per day.
                  </div>
                </div>
              </div>

              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-2">
                    What is the most popular car hire in Sri Lanka?
                  </button>
                </h2>
                <div id="faq-content-2" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  <div class="accordion-body">
                  Standard (Hyundai Santa Fe or similar) is the most frequently booked car hire type in Sri Lanka.

                  </div>
                </div>
              </div>

              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-3">
                    How much does petrol cost in Sri Lanka?
                  </button>
                </h2>
                <div id="faq-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  <div class="accordion-body">
                    You will find that the average price of petrol is 164 LKR (0.93 USD) per liter, or the equivalent of 3.52 USD per gallon, when you rent a car in Sri Lanka. Because petrol is regulated by the government, petrol prices are the same at various petrol stations, so you do not have to shop around. Many of the island’s petrol stations are open 24h and offer self-service.                  </div>
                </div>
              </div>

            </div>
          </div>

          <div class="col-lg-6">

            <!-- F.A.Q List 2-->
            <div class="accordion accordion-flush" id="faqlist2">

              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-1">
                   What are the speed limits in Sri Lanka?
                  </button>
                </h2>
                <div id="faq2-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist2">
                  <div class="accordion-body">
                  When driving on Sri Lankan roads, you will need to follow the national speed limits. In residential areas, the speed limit is 56 km/h (34 mph), and on national roads, you can travel up to 72 km/h (44 mph). On highways, the maximum speed limit is 120 km/h (74 mph).
                  </div>
                </div>
              </div>

              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-2">
                  How much does it cost to hire a car long term for a month?
                  </button>
                </h2>
                <div id="faq2-content-2" class="accordion-collapse collapse" data-bs-parent="#faqlist2">
                  <div class="accordion-body">
                   On average a car hire in Sri Lanka costs ₹ 179,326 per month (₹ 5,978 per day).
                  </div>
                </div>
              </div>

              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-3">
                    Where should I hire a car in Sri Lanka?
                  </button>
                </h2>
                <div id="faq2-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist2">
                  <div class="accordion-body">
                    Based on car searches on KAYAK, the most popular cities to hire a car in Sri Lanka are Colombo (96% of total searches of users looking to hire a car in Sri Lanka) and Negombo (1%).
                  </div>
                </div>
              </div>

            </div>
          </div>

        </div>

      </div>

    </section><!-- End F.A.Q Section -->

  </main><!-- End #main -->

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
  <script type="text/javascript">
        // Function to confirm logout
        function confirmLogout() {
            // Show confirmation dialog
            var result = confirm("Are you sure you want to log out?");
            
            if (result) {
                // If user confirms, clear the session and reload the page (logout on same page)
                // Send a request to logout
                window.location.href = "LogoutProcess.jsp"; // Or directly handle session invalidation
            } else {
                // If user cancels, do nothing
                alert("You are still logged in.");
            }
        }
    </script>

</body>
</html>