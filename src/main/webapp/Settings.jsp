<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings - Car Rental Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="css/admin.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
                <div class="position-sticky pt-3">
                    <div class="d-flex align-items-center pb-10 mb-3 link-light text-decoration-none border-bottom">
                        <i class="bi bi-car-front me-2"></i>
                        <span class="fs-5 fw-semibold">Car Rental Admin</span>
                    </div>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link link-light" href="AdminDashboard.jsp">
                                <i class="bi bi-speedometer2 me-2"></i>
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link-light" href="ManageUsers.jsp">
                                <i class="bi bi-people me-2"></i>
                                Manage Users
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link-light" href="ManageCars.jsp">
                                <i class="bi bi-car-front-fill me-2"></i>
                                Manage Cars
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link-light" href="ManageBookings.jsp">
                                <i class="bi bi-calendar-check me-2"></i>
                                Manage Bookings
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link-light" href="reports.jsp">
                                <i class="bi bi-bar-chart me-2"></i>
                                Reports
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active text-white" href="Settings.jsp" aria-current="page">
                                <i class="bi bi-gear me-2"></i>
                                Settings
                            </a>
                        </li>
                    </ul>
                    <div class="border-top pt-3 mt-auto">
                        <a class="nav-link link-light" href="javascript:void(0);" onclick="confirmLogout()">
                            Logout
                        </a>
                    </div>
                </div>
            </nav>

            <!-- Main content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Settings</h1>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle me-1"></i> Admin
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="AdminDashboard.jsp">Profile</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="Logout.jsp"></a></li>
                        </ul>
                    </div>
                </div>

                <!-- Alert message about contacting dealer -->
                <div class="alert alert-info alert-dismissible fade show" role="alert">
                    <strong>Note:</strong> For advanced settings configuration, please contact your dealer.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

               

                <!-- Contact Dealer Card -->
                <div class="card mb-4">
                    <div class="card-header bg-secondary text-white">
                        <h4 class="mb-0"><i class="bi bi-headset me-2"></i>Need Help?</h4>
                    </div>
                    <div class="card-body">
                        <h5>Contact Your Dealer</h5>
                        <p>For technical assistance or advanced configuration options, please contact your dealer.</p>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <div class="d-flex align-items-center mb-2">
                                    <i class="bi bi-envelope me-2 text-primary"></i>
                                    <span>support@carrentalsystem.com</span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-center mb-2">
                                    <i class="bi bi-telephone me-2 text-primary"></i>
                                    <span>(555) 123-4567</span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-center mb-2">
                                    <i class="bi bi-clock me-2 text-primary"></i>
                                    <span>Mon-Fri, 9:00 AM - 5:00 PM</span>
                                </div>
                            </div>
                        </div>
                        <a href="contact.jsp" class="btn btn-outline-primary">
                            <i class="bi bi-chat-dots me-1"></i> Contact Dealer
                        </a>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    
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