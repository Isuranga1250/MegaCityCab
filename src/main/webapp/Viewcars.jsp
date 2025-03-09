<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>

<%
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("adminLoggedIn") == null) {
        response.sendRedirect("login.jsp"); // Redirect if session is missing
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Cabs</title>

    <!-- Bootstrap CSS -->
    <link href="CSS/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <!-- Custom CSS -->
    <link href="CSS/css/style.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }
        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid rgba(0, 0, 0, 0.125);
            padding: 12px 20px;
        }
        .page-title {
            color: #3f51b5;
            font-weight: 600;
            margin-bottom: 0;
        }
        .search-container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }
        .search-button {
            background-color: #3f51b5;
            border-color: #3f51b5;
        }
        .search-button:hover {
            background-color: #303f9f;
            border-color: #303f9f;
        }
        .table thead th {
            background-color: #3f51b5;
            color: white;
            font-weight: 500;
            border: none;
            vertical-align: middle;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.02);
        }
        .table td {
            vertical-align: middle;
        }
        .car-image {
            border-radius: 5px;
            object-fit: cover;
            width: 80px;
            height: 60px;
        }
        .badge-status {
            font-size: 12px;
            padding: 5px 10px;
            border-radius: 30px;
        }
        .badge-available {
            background-color: #4caf50;
            color: white;
        }
        .badge-unavailable {
            background-color: #f44336;
            color: white;
        }
        .badge-maintenance {
            background-color: #ff9800;
            color: white;
        }
        .action-btn {
            margin: 0 2px;
            border-radius: 4px;
            font-size: 13px;
            padding: 5px 10px;
        }
        .action-btn i {
            margin-right: 3px;
        }
        .btn-add-cab {
            background-color: #4caf50;
            border-color: #4caf50;
            color: white;
            margin-bottom: 10px;
        }
        .btn-add-cab:hover {
            background-color: #43a047;
            border-color: #43a047;
        }
        .no-results {
            padding: 30px;
            text-align: center;
            color: #757575;
        }
        .no-results i {
            font-size: 48px;
            margin-bottom: 10px;
            color: #bdbdbd;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h1 class="page-title">Cab Management</h1>
                <a href="AddCars.jsp" class="btn btn-add-cab">
                    <i class="bi bi-plus-circle"></i> Add New Cab
                </a>
            </div>
            <div class="card-body">
                <!-- Search Bar -->
                <div class="search-container">
                    <form method="GET" action="" class="mb-0">
                        <div class="input-group">
                            <span class="input-group-text bg-white">
                                <i class="bi bi-search"></i>
                            </span>
                            <input type="text" name="search" class="form-control border-start-0" placeholder="Search by ID, name, brand, plate number..." value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                            <button type="submit" class="btn search-button">Search</button>
                        </div>
                    </form>
                </div>

                <%
                    if (request.getParameter("search") != null && !request.getParameter("search").trim().isEmpty()) {
                %>
                    <div class="alert alert-info alert-dismissible fade show mb-3" role="alert">
                        <i class="bi bi-info-circle me-2"></i>
                        Search results for "<strong><%= request.getParameter("search") %></strong>"
                        <a href="ViewCabs.jsp" class="alert-link ms-2">Clear search</a>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <%
                    }
                %>

                <!-- Table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover align-middle">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Vehicle</th>
                                <th>Number Plate</th>
                                <th>Colour</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Driver ID</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    // Load MySQL JDBC Driver
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");

                                    // SQL query to join car_table and filter by search term
                                    String query = "SELECT Car_ID, Car_Name, Car_Brand, Car_Number_Plate, Car_Colour, Car_Image, Car_Booking_Price, Driver_ID, Car_Status FROM car_table";

                                    if (request.getParameter("search") != null && !request.getParameter("search").trim().isEmpty()) {
                                        query += " WHERE (Car_ID LIKE ? OR Car_Name LIKE ? OR Car_Brand LIKE ? OR Car_Number_Plate LIKE ? OR Car_Colour LIKE ? OR Car_Booking_Price LIKE ? OR Driver_ID LIKE ? OR Car_Status LIKE ?)";
                                    }

                                    PreparedStatement ps = con.prepareStatement(query);

                                    if (request.getParameter("search") != null && !request.getParameter("search").trim().isEmpty()) {
                                        String searchPattern = "%" + request.getParameter("search") + "%";
                                        ps.setString(1, searchPattern);
                                        ps.setString(2, searchPattern);
                                        ps.setString(3, searchPattern);
                                        ps.setString(4, searchPattern);
                                        ps.setString(5, searchPattern);
                                        ps.setString(6, searchPattern);
                                        ps.setString(7, searchPattern);
                                        ps.setString(8, searchPattern);
                                    }

                                    ResultSet rs = ps.executeQuery();
                                    boolean hasResults = false;

                                    while (rs.next()) {
                                        hasResults = true;
                                        
                                        // Retrieve BLOB data
                                        byte[] imgData = rs.getBytes("Car_Image");
                                        String base64Image = "";
                                        
                                        if (imgData != null) {
                                            base64Image = Base64.getEncoder().encodeToString(imgData);
                                        }
                                        
                                        // Determine status class for badge styling
                                        String statusClass = "";
                                        String status = rs.getString("Car_Status");
                                        if (status != null) {
                                            if (status.equalsIgnoreCase("Available")) {
                                                statusClass = "badge-available";
                                            } else if (status.equalsIgnoreCase("Unavailable")) {
                                                statusClass = "badge-unavailable";
                                            } else if (status.equalsIgnoreCase("Maintenance")) {
                                                statusClass = "badge-maintenance";
                                            }
                                        }
                            %>
                            <tr>
                                <td><strong><%= rs.getString("Car_ID") %></strong></td>
                                <td>
                                    <div><strong><%= rs.getString("Car_Name") %></strong></div>
                                    <div class="text-muted small"><%= rs.getString("Car_Brand") %></div>
                                </td>
                                <td><%= rs.getString("Car_Number_Plate") %></td>
                                <td><%= rs.getString("Car_Colour") %></td>
                                <td>
                                    <% if (!base64Image.isEmpty()) { %>
                                        <img src="data:image/jpeg;base64,<%= base64Image %>" class="car-image"/>
                                    <% } else { %>
                                        <div class="text-center text-muted">
                                            <i class="bi bi-image"></i>
                                            <div class="small">No Image</div>
                                        </div>
                                    <% } %>
                                </td>
                                <td>$<%= rs.getString("Car_Booking_Price") %></td>
                                <td><span class="badge bg-secondary"><%= rs.getString("Driver_ID") %></span></td>
                                <td><span class="badge badge-status <%= statusClass %>"><%= rs.getString("Car_Status") %></span></td>
                                <td>
                                    <!-- Action Buttons -->
                                    <div class="d-flex gap-1 flex-wrap justify-content-center">
                                        <a href="UpdateCars.jsp?carId=<%= rs.getString("Car_ID") %>" class="btn btn-warning action-btn">
                                            <i class="bi bi-pencil-square"></i> Edit
                                        </a>
                                        <a href="CarDetails.jsp?carId=<%= rs.getString("Car_ID") %>" class="btn btn-info action-btn text-white">
                                            <i class="bi bi-eye"></i> View
                                        </a>
                                        <a href="DeleteCarServlet?carId=<%= rs.getString("Car_ID") %>" 
                                           class="btn btn-danger action-btn" 
                                           onclick="return confirm('Are you sure you want to delete this cab?');">
                                            <i class="bi bi-trash"></i> Delete
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }

                                    if (!hasResults) {
                            %>
                            <tr>
                                <td colspan="9">
                                    <div class="no-results">
                                        <i class="bi bi-search"></i>
                                        <h5>No cabs found</h5>
                                        <p>Try adjusting your search criteria or add a new cab.</p>
                                        <a href="AddCab.jsp" class="btn btn-primary mt-2">Add New Cab</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }

                                    rs.close();
                                    ps.close();
                                    con.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                            %>
                            <tr>
                                <td colspan="9">
                                    <div class="alert alert-danger mb-0">
                                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                        Error connecting to database. Please try again later.
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
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="CSS/Vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>