<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*" %>
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
    <title>MegaCity Cab Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <!-- AOS Animation Library -->
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #5D3FD3;
            --secondary-color: #FF6B6B;
            --accent-color: #2EC4B6;
            --light-color: #F7F9FC;
            --dark-color: #1A1B41;
            --success-color: #06D6A0;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-color);
            background-image: url('https://cdn.jsdelivr.net/gh/fullstackneo/images@main/abstract-patterns/pattern-light.svg');
            background-size: cover;
            background-attachment: fixed;
            color: var(--dark-color);
        }
        
        h1, h2, h3, h4, h5, h6 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
        }
        
        .dashboard-header {
            background: var(--primary-color);
            color: white;
            border-radius: 0 0 30px 30px;
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 10px 20px rgba(93, 63, 211, 0.15);
        }
        
        .header-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .header-title {
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 0;
        }
        
        .header-subtitle {
            opacity: 0.8;
            font-weight: 400;
            margin: 0;
        }

        .search-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
            transform: translateY(-30px);
            border: none;
        }
        
        .content-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border: none;
        }
        
        .search-input {
            border-radius: 10px;
            border: 2px solid #e1e5ee;
            padding: 0.8rem 1rem;
            transition: all 0.3s;
        }
        
        .search-input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(93, 63, 211, 0.15);
        }
        
        .btn-brand {
            background: var(--primary-color);
            color: white;
            border-radius: 10px;
            padding: 0.8rem 1.5rem;
            font-weight: 500;
            border: none;
            box-shadow: 0 4px 10px rgba(93, 63, 211, 0.2);
            transition: all 0.3s;
        }
        
        .btn-brand:hover {
            background: #4A32A6;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(93, 63, 211, 0.3);
        }
        
        .search-title {
            color: var(--primary-color);
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }
        
        .search-info {
            background: rgba(93, 63, 211, 0.05);
            padding: 0.5rem 1rem;
            border-radius: 10px;
            color: var(--primary-color);
            font-size: 0.9rem;
            display: inline-block;
        }
        
        .table-header {
            background: var(--primary-color);
            color: white;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }
        
        .table-striped > tbody > tr:nth-of-type(odd) > * {
            background-color: rgba(93, 63, 211, 0.02);
        }
        
        .table-hover > tbody > tr:hover > * {
            background-color: rgba(93, 63, 211, 0.05);
        }
        
        .cab-image {
            width: 90px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            border: 2px solid white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        
        .cab-image:hover {
            transform: scale(1.8);
            z-index: 10;
        }
        
        .btn-update {
            background: var(--secondary-color);
            color: white;
            border-radius: 8px;
            border: none;
            box-shadow: 0 4px 8px rgba(255, 107, 107, 0.2);
            transition: all 0.3s;
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
        }
        
        .btn-update:hover {
            background: #FF5252;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(255, 107, 107, 0.3);
        }
        
        .empty-state {
            padding: 3rem 0;
            text-align: center;
        }
        
        .empty-icon {
            font-size: 4rem;
            color: #e1e5ee;
            margin-bottom: 1rem;
        }
        
        .empty-message {
            color: #9FA6B2;
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
        }
        
        .badge-price {
            background: linear-gradient(45deg, #5D3FD3, #FF6B6B);
            color: white;
            padding: 0.35rem 0.8rem;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.85rem;
        }
        
        .cab-id-badge {
            background: var(--dark-color);
            color: white;
            padding: 0.25rem 0.7rem;
            border-radius: 30px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        /* Animation classes */
        .fade-in-up {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.6s ease, transform 0.6s ease;
        }
        
        .visible {
            opacity: 1;
            transform: translateY(0);
        }
        
        /* Pagination styling */
        .pagination .page-item .page-link {
            color: var(--primary-color);
            border-radius: 8px;
            margin: 0 3px;
            border: none;
        }
        
        .pagination .page-item.active .page-link {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        /* Responsive adjustments */
        @media (max-width: 767px) {
            .dashboard-header {
                border-radius: 0 0 15px 15px;
                padding: 1rem 0;
            }
            
            .search-card {
                padding: 1rem;
                transform: translateY(-20px);
            }
            
            .header-title {
                font-size: 1.5rem;
            }
            
            .header-subtitle {
                font-size: 0.9rem;
            }
            
            .cab-image:hover {
                transform: scale(1.5);
            }
        }
    </style>
</head>

<%@ page import="java.sql.*, java.util.Base64, java.io.*" %>
<body>
<%
    // Retrieve search term
    String searchTerm = request.getParameter("search");
%>

<!-- Dashboard Header -->
<header class="dashboard-header">
    <div class="container">
        <div class="header-content">
            
            <div>
                <button class="btn btn-light rounded-pill px-4">
                    <i class="bi bi-person-circle me-2"></i> 
                </button>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <!-- Search Card -->
    <div class="row justify-content-center fade-in-up">
        <div class="col-lg-8">
            <div class="search-card" data-aos="fade-up">
                <h5 class="search-title"><i class="bi bi-search me-2"></i>Find Cabs</h5>
                <form method="post" action="updateCar">
                    <div class="input-group">
                        <input type="text" name="search" class="form-control search-input" 
                            placeholder="Search by cab ID, name, brand, plate number..." 
                            value="<%= searchTerm != null ? searchTerm : "" %>">
                        <button type="submit" class="btn btn-brand">
                            Search
                        </button>
                    </div>
                    <% if (searchTerm != null && !searchTerm.trim().isEmpty()) { %>
                        <div class="mt-3">
                            <span class="search-info">
                                <i class="bi bi-filter me-1"></i>Results for "<%= searchTerm %>"
                            </span>
                        </div>
                    <% } %>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Content Card -->
    <div class="row fade-in-up" style="transition-delay: 0.2s;">
        <div class="col-12">
            <div class="content-card" data-aos="fade-up" data-aos-delay="100">
                <div class="card-body p-0">
                    <!-- Table Container with Responsive Scrolling -->
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-header">
                                <tr>
                                    <th class="px-4 py-3">ID</th>
                                    <th class="px-4 py-3">Name</th>
                                    <th class="px-4 py-3">Brand</th>
                                    <th class="px-4 py-3">Number Plate</th>
                                    <th class="px-4 py-3">Color</th>
                                    <th class="px-4 py-3">Image</th>
                                    <th class="px-4 py-3">Price</th>
                                    <th class="px-4 py-3 text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                try {
                                    // Load MySQL JDBC Driver
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");

                                    // SQL query to join car_table and filter by search term
                                    String query = "SELECT Car_ID, Car_Name, Car_Brand, Car_Number_Plate, Car_Colour, Car_Image, Car_Booking_Price FROM car_table";

                                    if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                        query += " WHERE (Car_ID LIKE ? OR Car_Name LIKE ? OR Car_Brand LIKE ? OR Car_Number_Plate LIKE ? OR Car_Colour LIKE ? OR Car_Booking_Price LIKE ?)";
                                    }

                                    PreparedStatement ps = con.prepareStatement(query);

                                    if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                                        String searchPattern = "%" + searchTerm + "%";
                                        ps.setString(1, searchPattern);
                                        ps.setString(2, searchPattern);
                                        ps.setString(3, searchPattern);
                                        ps.setString(4, searchPattern);
                                        ps.setString(5, searchPattern);
                                        ps.setString(6, searchPattern);
                                    }

                                    ResultSet rs = ps.executeQuery();
                                    boolean hasResults = false;
                                    int resultCount = 0;

                                    while (rs.next()) {
                                        hasResults = true;
                                        resultCount++;
                                        
                                        // Retrieve BLOB data
                                        byte[] imgData = rs.getBytes("Car_Image");
                                        String base64Image = "";
                                        
                                        if (imgData != null) {
                                            base64Image = Base64.getEncoder().encodeToString(imgData);
                                        }
                            %>
                                <tr class="fade-in-up" style="transition-delay: <%= (resultCount * 0.05) %>s;">
                                    <td class="px-4 py-3">
                                        <span class="cab-id-badge">#<%= rs.getString("Car_ID") %></span>
                                    </td>
                                    <td class="px-4 py-3 fw-medium"><%= rs.getString("Car_Name") %></td>
                                    <td class="px-4 py-3"><%= rs.getString("Car_Brand") %></td>
                                    <td class="px-4 py-3">
                                        <span class="text-monospace fw-medium">
                                            <%= rs.getString("Car_Number_Plate") %>
                                        </span>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="d-flex align-items-center">
                                            <div class="color-dot me-2" style="
                                                width: 15px; 
                                                height: 15px; 
                                                border-radius: 50%; 
                                                background-color: <%= rs.getString("Car_Colour").toLowerCase() %>; 
                                                display: inline-block;
                                                border: 1px solid #ddd;
                                            "></div>
                                            <%= rs.getString("Car_Colour") %>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="position-relative">
                                            <% if (base64Image != null && !base64Image.isEmpty()) { %>
                                                <img src="data:image/jpeg;base64,<%= base64Image %>" class="cab-image"/>
                                            <% } else { %>
                                                <div class="bg-light d-flex align-items-center justify-content-center" 
                                                    style="width: 90px; height: 60px; border-radius: 8px;">
                                                    <i class="bi bi-image text-muted"></i>
                                                </div>
                                            <% } %>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3">
                                        <span class="badge-price">Lkr<%= rs.getString("Car_Booking_Price") %></span>
                                    </td>
                                    <td class="px-4 py-3 text-center">
                                        <a href='UpdateChosenCab.jsp?Car_ID=<%= rs.getInt("Car_ID") %>' class="btn btn-update">
                                            <i class="bi bi-pencil-square me-1"></i> Update
                                        </a>
                                    </td>
                                </tr>
                            <%
                                    }

                                    if (!hasResults) {
                            %>
                                <tr>
                                    <td colspan="8">
                                        <div class="empty-state">
                                            <i class="bi bi-search empty-icon"></i>
                                            <h4 class="empty-message">No cabs found</h4>
                                            <p class="text-muted">Try adjusting your search or add new cabs to the database</p>
                                            <button class="btn btn-outline-primary rounded-pill">
                                                <i class="bi bi-plus-lg me-2"></i>Add New Cab
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            <%
                                    } else {
                            %>
                                <tr>
                                    <td colspan="8" class="px-4 py-3">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <small class="text-muted">Showing <%= resultCount %> results</small>
                                            </div>
                                            <nav aria-label="Page navigation">
                                                <ul class="pagination mb-0">
                                                    <li class="page-item disabled">
                                                        <a class="page-link" href="#"><i class="bi bi-chevron-left"></i></a>
                                                    </li>
                                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#"><i class="bi bi-chevron-right"></i></a>
                                                    </li>
                                                </ul>
                                            </nav>
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
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="mt-4 mb-4 text-center text-muted fade-in-up">
        <small>&copy; 2025 MegaCity Cab Services. All rights reserved.</small>
    </footer>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- AOS Animation Library -->
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>
    // Initialize AOS animation library
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
    });
    
    // Fade-in animation for elements
    document.addEventListener('DOMContentLoaded', function() {
        setTimeout(function() {
            const elements = document.querySelectorAll('.fade-in-up');
            elements.forEach(function(element) {
                element.classList.add('visible');
            });
        }, 100);
    });
</script>
</body>
</html>