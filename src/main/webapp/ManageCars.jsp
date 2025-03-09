<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cars</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            height: 100vh;
            width: 286px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #1f2937;
            color: white;
            padding-top: 20px;
            z-index: 1000;
        }

        .sidebar-brand {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px 15px;
            margin-bottom: 30px;
        }

        .sidebar-brand i {
            font-size: 24px;
            margin-right: 10px;
        }

        .sidebar-brand h4 {
            margin: 0;
            font-size: 18px;
            font-weight: 600;
        }

        .nav-item {
            margin-bottom: 5px;
        }

        .nav-link {
            color: #abb4c2;
            padding: 12px 20px;
            display: flex;
            align-items: center;
            transition: all 0.3s;
            font-size: 16px;
        }

        .nav-link i {
            width: 24px;
            margin-right: 12px;
            font-size: 18px;
        }

        .nav-link:hover,
        .nav-link.active {
            background-color: #374151;
            color: white;
        }

        .logout-link {
            position: absolute;
            bottom: 20px;
            width: 100%;
            padding: 0 15px;
        }

        .main-content {
            margin-left: 286px;
            padding: 20px;
        }

        .header {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: flex-end;
        }

        .admin-dropdown {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .admin-dropdown i {
            margin-right: 8px;
        }

        .welcome-section {
            background-color: white;
            border-radius: 8px;
            padding: 40px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .welcome-section h1 {
            color: #1f2937;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .welcome-section p {
            color: #6b7280;
            font-size: 16px;
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.6;
        }

        .action-cards {
            display: flex;
            gap: 20px;
            margin-top: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .action-card {
            background-color: white;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            text-align: center;
            flex: 1;
            min-width: 250px;
            max-width: 350px;
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
            color: #1f2937;
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .action-card i {
            font-size: 36px;
            margin-bottom: 15px;
            color: #4f46e5;
        }

        .action-card h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .action-card p {
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 0;
        }

        .add-card i {
            color: #10b981;
        }

        .update-card i {
            color: #f59e0b;
        }

        .view-card i {
            color: #3b82f6;
        }

        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s;
            }

            .sidebar.open {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
                transition: margin-left 0.3s;
            }

            .action-card {
                min-width: 200px;
            }
        }

        @media (max-width: 576px) {
            .action-cards {
                flex-direction: column;
                align-items: center;
            }

            .action-card {
                width: 100%;
                max-width: none;
            }
        }
    </style>
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-brand">
            <i class="fas fa-car"></i>
            <h4>Car Rental Admin</h4>
        </div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="AdminDashboard.jsp">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ManageUsers.jsp">
                    <i class="fas fa-users"></i> Manage Users
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="ManageCars.jsp">
                    <i class="fas fa-car"></i> Manage Cabs
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ManageBookings.jsp">
                    <i class="fas fa-calendar-alt"></i> Manage Bookings
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Reports.jsp">
                    <i class="fas fa-chart-bar"></i> Reports
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Settings.jsp">
                    <i class="fas fa-cog"></i> Settings
                </a>
            </li>
        </ul>
        <div class="logout-link">
            <a class="nav-link" href="#" onclick="confirmLogout()">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content" id="mainContent">
        <!-- Header -->
        <div class="header">
            <div class="admin-dropdown dropdown">
                <a href="#" class="dropdown-toggle text-dark text-decoration-none" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-user-circle"></i> Admin <i class="fas fa-chevron-down ms-1"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="adminDropdown">
                    <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>Profile</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Settings</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#" onclick="confirmLogout()"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                </ul>
            </div>
        </div>

        <!-- Welcome Section -->
        <div class="welcome-section">
            <h1>Manage Cars</h1>
            <p>Manage your car rental inventory efficiently. Add new cars, update existing car information, and view all cars in your fleet.</p>
        </div>

        <!-- Action Cards -->
        <div class="action-cards">
            <a href="AddCars.jsp" class="action-card add-card">
                <i class="fas fa-plus-circle"></i>
                <h3>Add New Cars</h3>
                <p>Add new vehicles to your rental fleet inventory</p>
            </a>
            <a href="UpdateCars.jsp" class="action-card update-card">
                <i class="fas fa-edit"></i>
                <h3>Update Cars</h3>
                <p>Modify details of existing cars in your inventory</p>
            </a>
            <a href="Viewcars.jsp" class="action-card view-card">
                <i class="fas fa-eye"></i>
                <h3>View All Cars</h3>
                <p>Browse and search through your complete car inventory</p>
            </a>
        </div>
    </div>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

    <!-- Custom Scripts -->
    <script>
        // Toggle Sidebar for Mobile
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('open');
        }

        // Confirm Logout Functionality
        function confirmLogout() {
            const isConfirmed = confirm("Are you sure you want to logout?");
            if (isConfirmed) {
                window.location.href = "index.jsp";
            }
        }

        // Add burger menu for mobile view
        document.addEventListener('DOMContentLoaded', function() {
            // Create burger menu button for mobile
            if (window.innerWidth <= 992) {
                const header = document.querySelector('.header');
                const burgerMenu = document.createElement('button');
                burgerMenu.classList.add('btn', 'me-auto');
                burgerMenu.innerHTML = '<i class="fas fa-bars"></i>';
                burgerMenu.addEventListener('click', toggleSidebar);
                header.prepend(burgerMenu);
            }
        });
    </script>
</body>

</html>