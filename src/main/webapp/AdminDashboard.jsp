<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="./CSS/img/carlogo.png" type="image/x-icon">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #3a86ff;
            --secondary-color: #8338ec;
            --dark-color: #212529;
            --light-color: #f8f9fa;
            --success-color: #38b000;
        }
        
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Sidebar Styling */
        .sidebar {
            height: 100vh;
            width: 280px;
            position: fixed;
            top: 0;
            left: 0;
            background: linear-gradient(135deg, var(--dark-color), #343a40);
            padding-top: 20px;
            transition: all 0.3s ease;
            z-index: 1000;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }

        .sidebar-header {
            padding: 20px 15px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 15px;
        }

        .sidebar a {
            padding: 12px 20px;
            text-decoration: none;
            font-size: 16px;
            color: rgba(255,255,255,0.8);
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
            border-left: 3px solid transparent;
        }

        .sidebar a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .sidebar a:hover, .sidebar a.active {
            color: #fff;
            background-color: rgba(255,255,255,0.1);
            border-left: 3px solid var(--primary-color);
        }

        .sidebar a.logout {
            margin-top: auto;
            border-top: 1px solid rgba(255,255,255,0.1);
        }

        /* Main Content Styling */
        .main-content {
            margin-left: 280px;
            padding: 20px;
            transition: all 0.3s ease;
        }

        /* Navbar Styling */
        .navbar {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 15px 20px;
            margin-bottom: 20px;
            border-radius: 10px;
        }

        .navbar .nav-link {
            color: var(--dark-color);
            font-weight: 500;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .navbar .nav-link:hover {
            background-color: rgba(0,0,0,0.05);
        }

        .navbar .nav-link i {
            font-size: 18px;
        }

        /* Welcome Card Styling */
        .welcome-card {
            background: linear-gradient(135deg, #fff, #f8f9fa);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            text-align: center;
            margin-bottom: 30px;
            border: 1px solid rgba(0,0,0,0.05);
            position: relative;
            overflow: hidden;
        }

        .welcome-card::before {
            content: "";
            position: absolute;
            top: -50px;
            left: -50px;
            width: 100px;
            height: 100px;
            background-color: rgba(58, 134, 255, 0.1);
            border-radius: 50%;
        }

        .welcome-card::after {
            content: "";
            position: absolute;
            bottom: -50px;
            right: -50px;
            width: 100px;
            height: 100px;
            background-color: rgba(131, 56, 236, 0.1);
            border-radius: 50%;
        }

        .welcome-card h1 {
            font-size: 2.5rem;
            color: var(--dark-color);
            margin-bottom: 15px;
            font-weight: 700;
        }

        .welcome-card p {
            font-size: 1.1rem;
            color: #6c757d;
            max-width: 700px;
            margin: 0 auto;
        }

        /* Dashboard Stats */
        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary-color);
        }

        .stat-card:nth-child(2) {
            border-left-color: var(--secondary-color);
        }

        .stat-card:nth-child(3) {
            border-left-color: var(--success-color);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .stat-card .stat-icon {
            font-size: 2rem;
            margin-bottom: 15px;
            color: var(--primary-color);
        }

        .stat-card:nth-child(2) .stat-icon {
            color: var(--secondary-color);
        }

        .stat-card:nth-child(3) .stat-icon {
            color: var(--success-color);
        }

        .stat-card h3 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .stat-card p {
            color: #6c757d;
            margin-bottom: 0;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
                width: 250px;
            }

            .sidebar.open {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .main-content.sidebar-open {
                margin-left: 250px;
            }
        }

        @media (max-width: 576px) {
            .welcome-card {
                padding: 25px;
            }

            .welcome-card h1 {
                font-size: 2rem;
            }

            .dashboard-stats {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
    <!-- Session Check (JSP code) -->
    <%
        HttpSession adminSession = request.getSession(false);
        if (adminSession == null || adminSession.getAttribute("adminLoggedIn") == null) {
            response.sendRedirect("login.jsp"); // Redirect if session is missing
            return;
        }
    %>

    <!-- Sidebar -->
    <div class="sidebar d-flex flex-column" id="sidebar">
        <div class="sidebar-header text-center">
            <i class="fas fa-car-alt fa-2x text-white"></i>
            <h5 class="text-white mt-2 mb-0">Car Rental Admin</h5>
        </div>
        <a href="AdminDashboard.jsp" class="active">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="ManageUsers.jsp">
            <i class="fas fa-users"></i> Manage Users
        </a>
        <a href="ManageCars.jsp">
            <i class="fas fa-car"></i> Manage Cabs
        </a>
        <a href="ManageBookings.jsp">
            <i class="fas fa-calendar-alt"></i> Manage Bookings
        </a>
        <a href="ManageDriver.jsp">
            <i class="fas fa-chart-bar"></i> Manage Drivers
        </a>
        <a href="Settings.jsp">
            <i class="fas fa-cog"></i> Settings
        </a>
        <div class="mt-auto"></div>
        <a href="#" class="logout" onclick="confirmLogout()">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <!-- Main Content -->
    <div class="main-content" id="mainContent">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <button class="btn btn-outline-secondary d-lg-none" type="button" onclick="toggleSidebar()">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                       
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user-circle me-1"></i> Admin
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                                <li><a class="dropdown-item" href="AdminDashboard.jsp">Profile</a></li>
                                <li><a class="dropdown-item" href="Settings.jsp">Settings</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#" onclick="confirmLogout()">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Welcome Card -->
        <div class="welcome-card">
            <h1>Welcome to Admin Dashboard</h1>
            <p>Manage your car rental business efficiently. Monitor bookings, manage users and cars, and keep track of your business metrics all in one place.</p>
        </div>

        <!-- Dashboard Stats -->
        <div class="dashboard-stats">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-users"></i>
                </div>
                <h3>48</h3>
                <p>Total Users</p>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-car"></i>
                </div>
                <h3>22</h3>
                <p>Available Cars</p>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <h3>56</h3>
                <p>Active Bookings</p>
            </div>
        </div>

      
    <!-- Bootstrap JS and Dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

    <!-- Custom Scripts -->
    <script>
        // Toggle Sidebar Functionality
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('mainContent');
            sidebar.classList.toggle('open');
            mainContent.classList.toggle('sidebar-open');
        }

        // Confirm Logout Functionality
        function confirmLogout() {
            const isConfirmed = confirm("Are you sure you want to logout?");
            if (isConfirmed) {
                window.location.href = "AdminLogout.jsp"; // Redirect to logout page
            }
        }

        // Add active class to current nav item
        document.addEventListener('DOMContentLoaded', function() {
            const currentLocation = window.location.href;
            const navItems = document.querySelectorAll('.sidebar a');
            navItems.forEach(item => {
                if (currentLocation.includes(item.getAttribute('href'))) {
                    item.classList.add('active');
                }
            });
        });
    </script>
</body>
</html>