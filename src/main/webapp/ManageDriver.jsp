<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Drivers</title>
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
        
        .status-assigned {
            background-color: var(--success);
        }
        
        .status-not-assigned {
            background-color: var(--warning);
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
        
        /* Modal styles */
        .modal-content {
            border-radius: 12px;
            border: none;
        }
        
        .modal-header {
            border-bottom: 1px solid #E2E8F0;
            padding: 20px 24px;
        }
        
        .modal-footer {
            border-top: 1px solid #E2E8F0;
            padding: 20px 24px;
        }
    </style>
</head>

<body>
<%
    // Retrieve search parameter
    String searchTerm = request.getParameter("search");
    
    // Handle form submissions
    String message = "";
    String messageType = "";
    
    // Process driver actions (delete, assign, unassign)
    if (request.getMethod().equals("POST")) {
        try {
            // Load JDBC driver and establish connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection actionCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");
            
            // Check which action was submitted
            if (request.getParameter("delete_driver") != null) {
                // Delete driver action
                int driverId = Integer.parseInt(request.getParameter("driver_id"));
                PreparedStatement deletePs = actionCon.prepareStatement("DELETE FROM driver_table WHERE Driver_ID = ?");
                deletePs.setInt(1, driverId);
                int result = deletePs.executeUpdate();
                
                if (result > 0) {
                    message = "Driver #" + driverId + " has been successfully deleted.";
                    messageType = "success";
                } else {
                    message = "Failed to delete driver. Please try again.";
                    messageType = "danger";
                }
                deletePs.close();
            } 
            else if (request.getParameter("assign_car") != null) {
                // Assign car action
                int driverId = Integer.parseInt(request.getParameter("driver_id"));
                PreparedStatement assignPs = actionCon.prepareStatement("UPDATE driver_table SET Car_Assignability_Status = 'Assigned' WHERE Driver_ID = ?");
                assignPs.setInt(1, driverId);
                int result = assignPs.executeUpdate();
                
                if (result > 0) {
                    message = "Driver #" + driverId + " has been successfully assigned a car.";
                    messageType = "success";
                } else {
                    message = "Failed to assign car. Please try again.";
                    messageType = "danger";
                }
                assignPs.close();
            }
            else if (request.getParameter("unassign_car") != null) {
                // Unassign car action
                int driverId = Integer.parseInt(request.getParameter("driver_id"));
                PreparedStatement unassignPs = actionCon.prepareStatement("UPDATE driver_table SET Car_Assignability_Status = 'Not Assigned' WHERE Driver_ID = ?");
                unassignPs.setInt(1, driverId);
                int result = unassignPs.executeUpdate();
                
                if (result > 0) {
                    message = "Driver #" + driverId + " has been unassigned from their car.";
                    messageType = "success";
                } else {
                    message = "Failed to unassign car. Please try again.";
                    messageType = "danger";
                }
                unassignPs.close();
            }
            
            actionCon.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
            messageType = "danger";
            e.printStackTrace();
        }
    }
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
                    <a class="nav-link" href="ManageUsers.jsp"><i class="bi bi-people me-1"></i>Customers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="ManageDrivers.jsp"><i class="bi bi-person-badge me-1"></i>Drivers</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <!-- Alert Message Display -->
    <% if (!message.isEmpty()) { %>
    <div class="alert alert-<%= messageType %> alert-dismissible fade show mt-4" role="alert">
        <%= message %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <!-- Page Header -->
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h1 class="fw-bold mb-0">Driver Management</h1>
                <p class="text-muted">View and manage all Driver Details.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDriverModal">
                    <i class="bi bi-plus-circle me-2"></i>Add New Driver
                </button>
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
                            placeholder="Search drivers by ID, name, email, or phone number..." 
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
    
    <!-- Driver Data Table -->
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

                            // SQL query to get driver data
                            String query = "SELECT * FROM driver_table";
                            
                            // Add search filtering if searchTerm exists
                            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                query += " WHERE Driver_ID LIKE ? OR " +
                                        "Driver_Name LIKE ? OR " +
                                        "Driver_Email LIKE ? OR " +
                                        "Driver_Telephone_Number LIKE ?";
                            }

                            // Prepare the statement
                            PreparedStatement ps = con.prepareStatement(query);

                            // Bind search term parameters
                            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                String searchPattern = "%" + searchTerm + "%";
                                for (int i = 1; i <= 4; i++) {
                                    ps.setString(i, searchPattern);
                                }
                            }

                            // Execute the query
                            ResultSet rs = ps.executeQuery();
                            boolean hasResults = false;
                            
                            // Count total, assigned, and unassigned drivers
                            int totalDrivers = 0;
                            int assignedDrivers = 0;
                            int unassignedDrivers = 0;
                    %>
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Driver</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                while(rs.next()) { 
                                    hasResults = true;
                                    totalDrivers++;
                                    String assignmentStatus = rs.getString("Car_Assignability_Status");
                                    if ("Assigned".equals(assignmentStatus)) {
                                        assignedDrivers++;
                                    } else {
                                        unassignedDrivers++;
                                    }
                                    int driverId = rs.getInt("Driver_ID");
                            %>
                            <tr>
                                <td>
                                    <span class="fw-semibold">#<%= driverId %></span>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-initial bg-light rounded-circle text-center me-2" style="width: 36px; height: 36px; line-height: 36px;">
                                            <i class="bi bi-person-badge"></i>
                                        </div>
                                        <div>
                                            <div class="fw-semibold"><%= rs.getString("Driver_Name") %></div>
                                        </div>
                                    </div>
                                </td>
                                <td><%= rs.getString("Driver_Email") %></td>
                                <td class="phone-number"><%= rs.getString("Driver_Telephone_Number") %></td>
                                <td>
                                    <% if ("Assigned".equals(assignmentStatus)) { %>
                                        <span class="badge bg-success">
                                            <i class="bi bi-check-circle me-1"></i>Assigned
                                        </span>
                                    <% } else { %>
                                        <span class="badge bg-warning">
                                            <i class="bi bi-exclamation-circle me-1"></i>Not Assigned
                                        </span>
                                    <% } %>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="ViewDriver.jsp?id=<%= driverId %>" class="btn btn-sm btn-outline-primary">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                        <a href="EditDriver.jsp?id=<%= driverId %>" class="btn btn-sm btn-outline-secondary">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <% if (!"Assigned".equals(assignmentStatus)) { %>
                                            <button type="button" class="btn btn-sm btn-outline-success" 
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#assignCarModal<%= driverId %>">
                                                <i class="bi bi-car-front"></i>
                                            </button>
                                        <% } else { %>
                                            <button type="button" class="btn btn-sm btn-outline-warning" 
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#unassignCarModal<%= driverId %>">
                                                <i class="bi bi-x-circle"></i>
                                            </button>
                                        <% } %>
                                        <button type="button" class="btn btn-sm btn-outline-danger" 
                                                data-bs-toggle="modal" 
                                                data-bs-target="#deleteDriverModal<%= driverId %>">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </div>
                                    
                                    <!-- Delete Driver Modal -->
                                    <div class="modal fade" id="deleteDriverModal<%= driverId %>" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Confirm Deletion</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure you want to delete driver #<%= driverId %>?</p>
                                                    <p class="text-danger"><strong>Warning:</strong> This action cannot be undone.</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <form method="POST" action="">
                                                        <input type="hidden" name="driver_id" value="<%= driverId %>">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        <button type="submit" name="delete_driver" class="btn btn-danger">Delete Driver</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Assign Car Modal -->
                                    <% if (!"Assigned".equals(assignmentStatus)) { %>
                                    <div class="modal fade" id="assignCarModal<%= driverId %>" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Assign Car</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Assign a car to driver #<%= driverId %>?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <form method="POST" action="">
                                                        <input type="hidden" name="driver_id" value="<%= driverId %>">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        <button type="submit" name="assign_car" class="btn btn-success">Assign Car</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% } %>
                                    
                                    <!-- Unassign Car Modal -->
                                    <% if ("Assigned".equals(assignmentStatus)) { %>
                                    <div class="modal fade" id="unassignCarModal<%= driverId %>" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Unassign Car</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Unassign the car from driver #<%= driverId %>?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <form method="POST" action="">
                                                        <input type="hidden" name="driver_id" value="<%= driverId %>">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        <button type="submit" name="unassign_car" class="btn btn-warning">Unassign Car</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% } %>
                                </td>
                            </tr>
                            <% } %>
                            
                            <%
                                // If no results are found, display a message
                                if (!hasResults) {
                            %>
                            <tr>
                                <td colspan="6">
                                    <div class="empty-state">
                                        <i class="bi bi-search"></i>
                                        <h5 class="mt-3">No drivers found</h5>
                                        <p>We couldn't find any drivers matching your search criteria.</p>
                                        <a href="?" class="btn btn-outline-primary mt-3">Clear filters</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="card-footer bg-white d-flex justify-content-between align-items-center">
            <div class="small text-muted">Showing all drivers</div>
            <nav>
                <ul class="pagination pagination-sm mb-0">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>

    <!-- Driver Statistics Cards -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="text-muted mb-2">Total Drivers</h6>
                            <h3 class="fw-bold mb-0"><%= totalDrivers %></h3>
                        </div>
                        <div class="bg-primary bg-opacity-10 p-3 rounded">
                            <i class="bi bi-people-fill text-primary fs-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="text-muted mb-2">Assigned Drivers</h6>
                            <h3 class="fw-bold mb-0"><%= assignedDrivers %></h3>
                        </div>
                        <div class="bg-success bg-opacity-10 p-3 rounded">
                            <i class="bi bi-check-circle-fill text-success fs-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="text-muted mb-2">Available Drivers</h6>
                            <h3 class="fw-bold mb-0"><%= unassignedDrivers %></h3>
                        </div>
                        <div class="bg-warning bg-opacity-10 p-3 rounded">
                            <i class="bi bi-exclamation-circle-fill text-warning fs-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        // Close resources
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<div class='alert alert-danger m-3'>Error: " + e.getMessage() + "</div>");
        e.printStackTrace();
    }
    %>
</div>

<!-- Add New Driver Modal -->
<div class="modal fade" id="addDriverModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Driver</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="addDriver" method="post" class="registration1" id="registration" onsubmit="return formValidation()">
           <h1 style="font-size: 30px;">Driver REGISTRATION</h1>
              <!-- action is connect for servlet class -->
              
              <!-- Email Address -->
              <div class="form-group">
                <label for="CustomerFullName" class="mb-2">Customer Name</label>
                <input type="text" class="form-control mb-4" id="CustomerFullName" required="required" name="Driver_Name">
              </div>

              <!-- email. -->
              <div class="form-group">
                <label for="CustomerEmail" class="mb-2">Email Address</label>
                <input type="email" class="form-control mb-4" id="CustomerEmail" required="required" name="Driver_Email">
              </div>

              <!-- phone -->
              <div class="form-group">
                <label for="phone" class="mb-2">Phone Number</label>
                <input type="tel" class="form-control mb-4" id="phone" required="required" name="Driver_Telephone_Number">
              </div>

              <!-- Password -->
              <div class="form-group">
            <div class="icons-container">
            <i class="password-hide-icon fas fa-eye-slash" style="left:357px" onclick="togglePasswordVisibility('customerpassword', this)"></i>
            <i class='i-icons fas fa-lock'></i>
            </div>
                <label for="password" class="mb-2">Password</label>
                <input type="password" class="form-control mb-4" id="password" required="required" name="Driver_Password">
              </div>
              
               <div class="form-group">
            <div class="icons-container">
            <i class="password-hide-icon fas fa-eye-slash" style="left:357px" onclick="togglePasswordVisibility('confirmCustomerPassword', this)"></i>
            <i class='i-icons fas fa-lock'></i>
            </div>
                <label for="password" class="mb-2">Confirm Password</label>
                <input type="password" class="form-control mb-4" id="confirmCustomerPassword" required="required" name="Driver_Confirm_Password">
              </div>
    

          <!-- Submit Button -->
              <button type="submit" class="btn btn-primary mt-4">Submit</button>

              <!-- Sign In Link -->
              <p class="mt-4">Already Have An Account? <a href="DriverLogin.jsp"><b>Sign In</b></a></p>
            </form>
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