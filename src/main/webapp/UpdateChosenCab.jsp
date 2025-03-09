<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Cab Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 40px;
            padding-bottom: 40px;
        }
        
        .container {
            max-width: 800px;
        }
        
        .cab-update-card {
            border-radius: 15px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            border: none;
        }
        
        .cab-header {
            background-color: #0d6efd;
            color: white;
            border-radius: 15px 15px 0 0;
            padding: 1.5rem;
        }
        
        .form-label {
            font-weight: 500;
        }
        
        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }
        
        .img-preview {
            max-width: 150px;
            border-radius: 8px;
            border: 1px solid #dee2e6;
        }
        
        .input-group-text {
            background-color: #e9ecef;
        }
        
        .btn-update {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }
        
        .btn-update:hover {
            background-color: #0b5ed7;
            border-color: #0a58ca;
        }
        
        .btn-reset {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        
        .btn-reset:hover {
            background-color: #5c636a;
            border-color: #565e64;
        }
    </style>
</head>
<body>

<%
    String carId = request.getParameter("Car_ID");
    String carName = "", carBrand = "", carNumberPlate = "", carColour = "", carBookingPrice = "";
    String base64Image = ""; 

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC", "root", "123456");
        
        String query = "SELECT Car_ID, Car_Name, Car_Brand, Car_Number_Plate, Car_Colour, Car_Image, Car_Booking_Price FROM car_table WHERE Car_ID = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, carId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            carName = rs.getString("Car_Name");
            carBrand = rs.getString("Car_Brand");
            carNumberPlate = rs.getString("Car_Number_Plate");
            carColour = rs.getString("Car_Colour");
            carBookingPrice = rs.getString("Car_Booking_Price");

            byte[] imageBytes = rs.getBytes("Car_Image");
            if (imageBytes != null && imageBytes.length > 0) {
                base64Image = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageBytes);
            }
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<div class="container">
    <div class="card cab-update-card">
        <div class="cab-header text-center">
            <h2><i class="bi bi-car-front"></i> Update Cab Details</h2>
            <p class="mb-0">Modify the information for cab #<%= carId %></p>
        </div>
        <div class="card-body p-4">
            <form id="updateCarForm" action="updateCarss" method="post" enctype="multipart/form-data" onsubmit="return validateUpdate()">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="Car_ID" class="form-label">Vehicle ID</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-hash"></i></span>
                                <input type="text" class="form-control" id="Car_ID" name="Car_ID" value="<%= carId %>" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="Car_Name" class="form-label">Vehicle Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-tag"></i></span>
                                <input type="text" class="form-control" id="Car_Name" name="Car_Name" value="<%= carName %>" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="Car_Brand" class="form-label">Vehicle Brand</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-building"></i></span>
                                <input type="text" class="form-control" id="Car_Brand" name="Car_Brand" value="<%= carBrand %>" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="Car_Number_Plate" class="form-label">Vehicle Number Plate</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-credit-card"></i></span>
                                <input type="text" class="form-control" id="Car_Number_Plate" name="Car_Number_Plate" value="<%= carNumberPlate %>" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="Car_Colour" class="form-label">Vehicle Colour</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-palette"></i></span>
                                <input type="text" class="form-control" id="Car_Colour" name="Car_Colour" value="<%= carColour %>" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="Car_Booking_Price" class="form-label">Cab Booking Price (LKR)</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-currency-lkr"></i></span>
                                <input type="number" class="form-control" id="Car_Booking_Price" name="Car_Booking_Price" value="<%= carBookingPrice %>" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="mb-4">
                            <label for="Car_Image" class="form-label">Vehicle Image</label>
                            <input type="file" class="form-control" id="Car_Image" name="Car_Image">
                            <div class="mt-3 text-center">
                                <p class="text-muted">Current image:</p>
                                <img id="currentImage" src="<%= base64Image %>" class="img-preview img-thumbnail" alt="Cab Image" onerror="this.src='https://via.placeholder.com/150?text=No+Image'">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="reset" class="btn btn-reset text-white me-md-2 px-4">
                        <i class="bi bi-arrow-counterclockwise"></i> Reset
                    </button>
                    <button type="submit" name="submit" class="btn btn-update text-white px-4">
                        <i class="bi bi-save"></i> Update Cab
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <div class="mt-3 text-center">
        <a href="ManageCars.jsp" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left"></i> Back to Cab Management
        </a>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<!-- Validation Script -->
<script>
    function validateUpdate() {
        var initialValues = {
            name: "<%= carName %>",
            brand: "<%= carBrand %>",
            numberPlate: "<%= carNumberPlate %>",
            colour: "<%= carColour %>",
            price: "<%= carBookingPrice %>",
            imageChanged: false
        };

        var currentValues = {
            name: document.getElementById("Car_Name").value,
            brand: document.getElementById("Car_Brand").value,
            numberPlate: document.getElementById("Car_Number_Plate").value,
            colour: document.getElementById("Car_Colour").value,
            price: document.getElementById("Car_Booking_Price").value,
            imageChanged: document.getElementById("Car_Image").files.length > 0
        };

        if (
            initialValues.name === currentValues.name &&
            initialValues.brand === currentValues.brand &&
            initialValues.numberPlate === currentValues.numberPlate &&
            initialValues.colour === currentValues.colour &&
            initialValues.price === currentValues.price &&
            !currentValues.imageChanged
        ) {
            alert("Please update at least one field!");
            return false;
        }
        return true;
    }
    
    // Preview image when a new one is selected
    document.getElementById('Car_Image').addEventListener('change', function(e) {
        if (e.target.files && e.target.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('currentImage').src = e.target.result;
            }
            reader.readAsDataURL(e.target.files[0]);
        }
    });
</script>
</body>
</html>