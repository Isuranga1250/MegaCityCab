<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
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
        
        /* Modal styles */
        .modal-header {
            border-bottom: 1px solid #E2E8F0;
        }
        
        .modal-footer {
            border-top: 1px solid #E2E8F0;
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
                    <a class="nav-link active" href="ManageUsers.jsp"><i class="bi bi-people me-1"></i>Customers</a>
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
                <h1 class="fw-bold mb-0">Customer Management</h1>
                <p class="text-muted">View and manage all Customer Details.</p>
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
                            placeholder="Search customers by any field..." 
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
    
    <!-- Customer Data Table -->
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

                            // SQL query to get customer data
                            String query = "SELECT * FROM customer_registration_table";
                            
                            // Add search filtering if searchTerm exists
                            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                query += " WHERE User_ID LIKE ? OR " +
                                        "User_Username LIKE ? OR " +
                                        "User_Email LIKE ? OR " +
                                        "User_NIC LIKE ? OR " +
                                        "User_Address LIKE ? OR " +
                                        "User_Telephone_Number LIKE ?";
                            }

                            // Prepare the statement
                            PreparedStatement ps = con.prepareStatement(query);

                            // Bind search term parameters
                            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                String searchPattern = "%" + searchTerm + "%";
                                for (int i = 1; i <= 6; i++) {
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
                                <th>Customer</th>
                                <th>Email</th>
                                <th>NIC</th>
                                <th>Address</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                while(rs.next()) { 
                                    hasResults = true;
                                    String userId = rs.getString("User_ID");
                            %>
                            <tr>
                                <td>
                                    <span class="fw-semibold">#<%= userId %></span>
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
                                <td><%= rs.getString("User_Email") %></td>
                                <td><%= rs.getString("User_NIC") %></td>
                                <td><%= rs.getString("User_Address") %></td>
                                <td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary" 
                                                onclick="viewUserDetails('<%= userId %>', 
                                                                       '<%= rs.getString("User_Username") %>', 
                                                                       '<%= rs.getString("User_Email") %>', 
                                                                       '<%= rs.getString("User_NIC") %>', 
                                                                       '<%= rs.getString("User_Address") %>', 
                                                                       '<%= rs.getString("User_Telephone_Number") %>')">
                                            <i class="bi bi-eye me-1"></i>View
                                        </button>
                                        <button type="button" class="btn btn-sm btn-outline-primary" 
                                                onclick="editUser('<%= userId %>', 
                                                               '<%= rs.getString("User_Username") %>', 
                                                               '<%= rs.getString("User_Email") %>', 
                                                               '<%= rs.getString("User_NIC") %>', 
                                                               '<%= rs.getString("User_Address") %>', 
                                                               '<%= rs.getString("User_Telephone_Number") %>')">
                                            <i class="bi bi-pencil me-1"></i>Edit
                                        </button>
                                        <button type="button" class="btn btn-sm btn-outline-danger" 
                                                onclick="confirmDelete('<%= userId %>', '<%= rs.getString("User_Username") %>')">
                                            <i class="bi bi-trash me-1"></i>Delete
                                        </button>
                                    </div>
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
                                        <h5 class="mt-3">No customers found</h5>
                                        <p>We couldn't find any customers matching your search criteria.</p>
                                        <a href="?" class="btn btn-outline-primary mt-3">Clear filters</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                                // Close resources
                                rs.close();
                                ps.close();
                                con.close();
                            %>
                        </tbody>
                    </table>
                    <%
                        } catch (Exception e) {
                            out.println("<div class='alert alert-danger m-3'>Error: " + e.getMessage() + "</div>");
                            e.printStackTrace();
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="card-footer bg-white d-flex justify-content-between align-items-center">
            <div class="small text-muted">Showing all customers</div>
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

<!-- View User Modal -->
<div class="modal fade" id="viewUserModal" tabindex="-1" aria-labelledby="viewUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewUserModalLabel">Customer Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="text-center mb-4">
                    <div class="avatar-initial bg-light rounded-circle text-center mx-auto mb-3" style="width: 80px; height: 80px; line-height: 80px; font-size: 32px;">
                        <i class="bi bi-person"></i>
                    </div>
                    <h5 id="viewUserName" class="mb-1"></h5>
                    <p id="viewUserEmail" class="text-muted"></p>
                </div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label text-muted small">Customer ID</label>
                            <p id="viewUserId" class="mb-0 fw-semibold"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label text-muted small">NIC</label>
                            <p id="viewUserNIC" class="mb-0 fw-semibold"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label text-muted small">Phone Number</label>
                            <p id="viewUserPhone" class="mb-0 fw-semibold"></p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="mb-3">
                            <label class="form-label text-muted small">Address</label>
                            <p id="viewUserAddress" class="mb-0 fw-semibold"></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit User Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">Edit Customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="editUserForm" action="UpdateUser.jsp" method="POST">
                <div class="modal-body">
                    <input type="hidden" id="editUserId" name="userId">
                    <div class="mb-3">
                        <label for="editUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="editUsername" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="editEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="editEmail" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="editNIC" class="form-label">NIC</label>
                        <input type="text" class="form-control" id="editNIC" name="nic" required>
                    </div>
                    <div class="mb-3">
                        <label for="editPhone" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="editPhone" name="phone" required>
                    </div>
                    <div class="mb-3">
                        <label for="editAddress" class="form-label">Address</label>
                        <textarea class="form-control" id="editAddress" name="address" rows="3" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-danger" id="deleteUserModalLabel">Confirm Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="text-center mb-4">
                    <div class="avatar-initial bg-danger text-white rounded-circle text-center mx-auto mb-3" style="width: 60px; height: 60px; line-height: 60px; font-size: 24px;">
                        <i class="bi bi-exclamation-triangle"></i>
                    </div>
                    <h5 class="mb-1">Delete Customer</h5>
                    <p class="text-muted">Are you sure you want to delete <span id="deleteUserName" class="fw-semibold"></span>?</p>
                    <p class="text-danger small">This action cannot be undone.</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                <form id="deleteUserForm" action="DeleteUser.jsp" method="POST">
                    <input type="hidden" id="deleteUserId" name="userId">
                    <button type="submit" class="btn btn-danger">Delete Customer</button>
                </form>
            </div>
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

<!-- Custom JS for handling user actions -->
<script>
    // View User Details
    function viewUserDetails(id, username, email, nic, address, phone) {
        // Set values in the modal
        document.getElementById('viewUserId').textContent = "#" + id;
        document.getElementById('viewUserName').textContent = username;
        document.getElementById('viewUserEmail').textContent = email;
        document.getElementById('viewUserNIC').textContent = nic;
        document.getElementById('viewUserAddress').textContent = address;
        document.getElementById('viewUserPhone').textContent = phone;
        
        // Show the modal
        var viewModal = new bootstrap.Modal(document.getElementById('viewUserModal'));
        viewModal.show();
    }
    
    // Edit User
    function editUser(id, username, email, nic, address, phone) {
        // Set form values
        document.getElementById('editUserId').value = id;
        document.getElementById('editUsername').value = username;
        document.getElementById('editEmail').value = email;
        document.getElementById('editNIC').value = nic;
        document.getElementById('editAddress').value = address;
        document.getElementById('editPhone').value = phone;
        
        // Show the modal
        var editModal = new bootstrap.Modal(document.getElementById('editUserModal'));
        editModal.show();
    }
    
    // Confirm Delete
    function confirmDelete(id, username) {
        // Set values for confirmation
        document.getElementById('deleteUserId').value = id;
        document.getElementById('deleteUserName').textContent = username;
        
        // Show the modal
        var deleteModal = new bootstrap.Modal(document.getElementById('deleteUserModal'));
        deleteModal.show();
    }
</script>
</body>
</html>