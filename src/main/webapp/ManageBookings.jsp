<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <!-- Google Fonts - Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4F46E5;
            --primary-light: #818CF8;
            --secondary: #EC4899;
            --dark: #1E293B;
            --light: #F8FAFC;
            --success: #10B981;
            --warning: #FBBF24;
            --danger: #EF4444;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background-color: #F1F5F9;
            color: var(--dark);
        }
        
        .navbar-brand {
            font-weight: 700;
        }
        
        .nav-link {
            font-weight: 500;
        }
        
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            transition: all 0.2s ease;
        }
        
        .card:hover {
            box-shadow: 0 10px 15px -3px rgba(0,0,0,0.1);
        }
        
        .search-box {
            padding: 20px;
            background-color: white;
            border-radius: 12px;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 12px 16px;
            border: 1px solid #E2E8F0;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.15);
            border-color: var(--primary);
        }
        
        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
            border-radius: 8px;
            padding: 12px 24px;
            font-weight: 600;
        }
        
        .btn-primary:hover {
            background-color: #4338CA;
            border-color: #4338CA;
        }
        
        .table {
            vertical-align: middle;
        }
        
        .table thead th {
            background-color: #F8FAFC;
            color: var(--dark);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.05em;
            padding: 16px;
            border-bottom: 1px solid #E2E8F0;
        }
        
        .table tbody td {
            padding: 16px;
            border-bottom: 1px solid #E2E8F0;
        }
        
        .table-hover tbody tr:hover {
            background-color: #F1F5F9;
        }
        
        .badge {
            padding: 6px 12px;
            font-weight: 500;
            border-radius: 6px;
        }
        
        .badge-success {
            background-color: #ECFDF5;
            color: var(--success);
        }
        
        .badge-warning {
            background-color: #FFFBEB;
            color: var(--warning);
        }
        
        .badge-info {
            background-color: #EFF6FF;
            color: var(--primary);
        }
        
        .page-header {
            padding: 40px 0 20px;
        }
        
        .table-container {
            background-color: white;
            border-radius: 12px;
            overflow: hidden;
        }
        
        .empty-state {
            padding: 60px 20px;
            text-align: center;
        }
        
        .empty-state i {
            font-size: 3rem;
            color: #CBD5E1;
            margin-bottom: 16px;
        }
        
        .empty-state p {
            color: #64748B;
            font-size: 1rem;
        }
        
        .status-circle {
            display: inline-block;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 8px;
        }
        
        .status-completed {
            background-color: var(--success);
        }
        
        .status-pending {
            background-color: var(--warning);
        }
        
        .status-cancelled {
            background-color: var(--danger);
        }
        
        .phone-number {
            font-family: monospace;
            letter-spacing: 0.05em;
        }
        
        /* Responsive adjustments */
        @media (max-width: 992px) {
            .page-header {
                padding: 20px 0;
            }
        }
    </style>
</head>

<body>
<%
    // Retrieve search parameter
    String searchTerm = request.getParameter("search");
%>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="bi bi-taxi-front me-2"></i>MegaCityCab
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="AdminDashboard.jsp"><i class="bi bi-house me-1"></i>Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="ManageBookings.jsp"><i class="bi bi-list-check me-1"></i>Bookings</a>
                </li>
                
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <!-- Page Header -->
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h1 class="fw-bold mb-0">Booking Management</h1>
                <p class="text-muted">View and manage all cab bookings</p>
            </div>
            
        </div>
    </div>
    
    <!-- Search Section -->
    <div class="search-box mb-4">
        <form method="GET" action="">
            <div class="row g-3">
                <div class="col-md-10">
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0">
                            <i class="bi bi-search text-muted"></i>
                        </span>
                        <input type="text" class="form-control border-start-0" name="search" 
                            placeholder="Search bookings by any field..." 
                            value="<%= searchTerm != null ? searchTerm : "" %>">
                    </div>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary w-100" type="submit">Search</button>
                </div>
            </div>
            <% if (searchTerm != null && !searchTerm.trim().isEmpty()) { %>
                <div class="mt-2">
                    <span class="badge bg-light text-dark">
                        <i class="bi bi-funnel me-1"></i>
                        Filtered by: "<%= searchTerm %>"
                        <a href="?" class="ms-2 text-decoration-none">
                            <i class="bi bi-x-circle"></i>
                        </a>
                    </span>
                </div>
            <% } %>
        </form>
    </div>
    
    <!-- Booking Data Table -->
    <div class="card mb-4">
        <div class="card-body p-0">
            <div class="table-container">
                <div class="table-responsive">
                    <%
                        try {
                            // Load the database driver
                            Class.forName("com.mysql.jdbc.Driver");
                            // Establish connection
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");

                            // SQL query to join booking_table and filter by User_ID
                            String query = "SELECT booking_table.Booking_ID, booking_table.Car_ID, booking_table.Car_Name, booking_table.Car_Brand, " +
                                          "booking_table.Car_Number_Plate, booking_table.Car_Colour, booking_table.Driver_ID, booking_table.Driver_Name, booking_table.Driver_Telephone_Number, booking_table.Car_Booking_Price, " +
                                          "booking_table.User_ID, booking_table.User_Username, booking_table.User_Telephone_Number, booking_table.User_Address, booking_table.User_Current_Location, booking_table.User_Destination, " +
                                          "booking_table.Booked_Date, booking_table.Booked_Time, booking_table.Hire_Charge, booking_table.Total_Payable_Amount, booking_table.Journey_Status " +
                                          "FROM booking_table";

                            // Add search filtering if searchTerm exists
                            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                query += " WHERE (booking_table.Booking_ID LIKE ? OR " +
                                        "booking_table.Car_ID LIKE ? OR " +
                                        "booking_table.Car_Name LIKE ? OR " +
                                        "booking_table.Car_Brand LIKE ? OR " +
                                        "booking_table.Car_Number_Plate LIKE ? OR " +
                                        "booking_table.Car_Colour LIKE ? OR " +
                                        "booking_table.Driver_ID LIKE ? OR " +
                                        "booking_table.Driver_Name LIKE ? OR " +
                                        "booking_table.Driver_Telephone_Number LIKE ? OR " +
                                        "booking_table.Car_Booking_Price LIKE ? OR " +
                                        "booking_table.User_ID LIKE ? OR " +
                                        "booking_table.User_Username LIKE ? OR " +
                                        "booking_table.User_Telephone_Number LIKE ? OR " +
                                        "booking_table.User_Address LIKE ? OR " +
                                        "booking_table.User_Current_Location LIKE ? OR " +
                                        "booking_table.User_Destination LIKE ? OR " +
                                        "booking_table.Booked_Date LIKE ? OR " +
                                        "booking_table.Booked_Time LIKE ? OR " +
                                        "booking_table.Hire_Charge LIKE ? OR " +
                                        "booking_table.Total_Payable_Amount LIKE ? OR " +
                                        "booking_table.Journey_Status LIKE ?)";
                            }

                            // Prepare the statement
                            PreparedStatement ps = con.prepareStatement(query);

                            // Bind search term parameters
                            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                String searchPattern = "%" + searchTerm + "%";
                                for (int i = 1; i <= 21; i++) {
                                    ps.setString(i, searchPattern);
                                }
                            }

                            // Execute the query
                            ResultSet rs = ps.executeQuery();
                            boolean hasResults = false;
                    %>
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User</th>
                                <th>Car Details</th>
                                <th>Driver</th>
                                <th>Pickup / Destination</th>
                                <th>Booking Date & Time</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Loop through the result set
                                while (rs.next()) {
                                    hasResults = true;
                                    String journeyStatus = rs.getString("Journey_Status");
                                    String statusClass = "";
                                    String statusIcon = "";
                                    
                                    if (journeyStatus.equalsIgnoreCase("Completed")) {
                                        statusClass = "badge-success";
                                        statusIcon = "bi-check-circle";
                                    } else if (journeyStatus.equalsIgnoreCase("In Progress")) {
                                        statusClass = "badge-warning";
                                        statusIcon = "bi-hourglass-split";
                                    } else {
                                        statusClass = "badge-info";
                                        statusIcon = "bi-clock";
                                    }
                            %>
                            <tr>
                                <td>
                                    <span class="fw-semibold">#<%= rs.getString("Booking_ID") %></span>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-initial bg-light rounded-circle text-center me-2" style="width: 36px; height: 36px; line-height: 36px;">
                                            <i class="bi bi-person"></i>
                                        </div>
                                        <div>
                                            <div class="fw-semibold"><%= rs.getString("User_Username") %></div>
                                            <div class="small text-muted phone-number"><%= rs.getString("User_Telephone_Number") %></div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="fw-semibold"><%= rs.getString("Car_Brand") %> <%= rs.getString("Car_Name") %></div>
                                    <div class="small text-muted"><%= rs.getString("Car_Colour") %> • <%= rs.getString("Car_Number_Plate") %></div>
                                </td>
                                <td>
                                    <div class="fw-semibold"><%= rs.getString("Driver_Name") %></div>
                                    <div class="small text-muted phone-number"><%= rs.getString("Driver_Telephone_Number") %></div>
                                </td>
                                <td>
                                    <div class="small">
                                        <i class="bi bi-geo-alt text-danger"></i> <%= rs.getString("User_Current_Location") %>
                                    </div>
                                    <div class="small mt-1">
                                        <i class="bi bi-geo text-success"></i> <%= rs.getString("User_Destination") %>
                                    </div>
                                </td>
                                <td>
                                    <div class="fw-semibold"><%= rs.getString("Booked_Date") %></div>
                                    <div class="small text-muted"><%= rs.getString("Booked_Time") %></div>
                                </td>
                                <td class="fw-semibold">$<%= rs.getString("Total_Payable_Amount") %></td>
                                <td>
                                    <span class="badge <%= statusClass %>">
                                        <i class="bi <%= statusIcon %> me-1"></i>
                                        <%= journeyStatus %>
                                    </span>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                            Actions
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-eye me-2"></i>View Details</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-pencil me-2"></i>Edit</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-printer me-2"></i>Print Receipt</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-trash me-2"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                                // If no results are found, display a message
                                if (!hasResults) {
                            %>
                            <tr>
                                <td colspan="9">
                                    <div class="empty-state">
                                        <i class="bi bi-search"></i>
                                        <h5 class="mt-3">No bookings found</h5>
                                        <p>We couldn't find any bookings matching your search criteria.</p>
                                        <a href="?" class="btn btn-outline-primary mt-3">Clear filters</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <%
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="card-footer bg-white d-flex justify-content-between align-items-center">
            <div class="small text-muted">Showing bookings 1-10 of 253</div>
            <nav>
                <ul class="pagination pagination-sm mb-0">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<footer class="bg-white py-4 mt-auto">
    <div class="container">
        <div class="row">
            <div class="col-md-6 small">Copyright &copy; MegaCityCab 2025</div>
            <div class="col-md-6 text-md-end small">
                <a href="#" class="text-decoration-none">Privacy Policy</a>
                <span class="mx-1">&middot;</span>
                <a href="#" class="text-decoration-none">Terms &amp; Conditions</a>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>