 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Car | Mega - City Cab</title>
    
    <!-- Google Font & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet">
    
    <!-- Bootstrap & Vendor CSS -->
    <link href="CSS/Vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="CSS/css/style.css" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .card-header {
            background: linear-gradient(to right, #4776E6, #8E54E9);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 20px;
            text-align: center;
        }
        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s;
        }
        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 3px rgba(86, 108, 255, 0.2);
            border-color: #4776E6;
        }
        .form-label {
            font-weight: 500;
            color: #4a4a4a;
            margin-bottom: 8px;
        }
        .btn {
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }
        .btn-primary {
            background: linear-gradient(to right, #4776E6, #8E54E9);
            border: none;
        }
        .btn-primary:hover {
            background: linear-gradient(to right, #3a67d7, #7842d0);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(71, 118, 230, 0.3);
        }
        .btn-danger {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            border: none;
        }
        .btn-danger:hover {
            background: linear-gradient(to right, #e63a60, #e64327);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 65, 108, 0.3);
        }
        .input-group {
            position: relative;
        }
        .input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #4776E6;
            z-index: 10;
        }
        .form-file-input {
            position: relative;
        }
        .file-upload-btn {
            width: 100%;
            display: block;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }
        .file-upload-text {
            margin-left: 8px;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="card">
                    <div class="card-header">
                        <h3 class="mb-0"><i class="ri-car-line me-2"></i>Add New Vehicle</h3>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form id="addCarForm" action="addCar" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return validateDriverSelection()">
                            
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label class="form-label">Car Name</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="Car_Name" placeholder="Enter car name" required>
                                        <i class="ri-car-fill input-icon"></i>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-4">
                                    <label class="form-label">Car Brand</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="Car_Brand" placeholder="Enter car brand" required>
                                        <i class="ri-building-line input-icon"></i>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label class="form-label">License Plate</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="Car_Number_Plate" placeholder="Enter plate number" required>
                                        <i class="ri-bookmark-fill input-icon"></i>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-4">
                                    <label class="form-label">Car Color</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="Car_Colour" placeholder="Enter car color" required>
                                        <i class="ri-palette-line input-icon"></i>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label">Car Image</label>
                                <div class="input-group">
                                    <input type="file" class="form-control" name="Car_Image" id="carImage" required>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label">Booking Price (LKR)</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" name="Car_Booking_Price" placeholder="Enter booking price" required>
                                    <i class="ri-money-dollar-circle-line input-icon"></i>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label class="form-label" for="carAssigningDriver">Assign Driver</label>
                                    <select class="form-select" name="Car_Assigning_Driver" id="Car_Assigning_Driver" onchange="updateDriverID()">
                                        <option value="" data-id="">Select a Driver</option>
                                    </select>
                                </div>
                                
                                <div class="col-md-6 mb-4">
                                    <label class="form-label" for="driverID">Driver ID</label>
                                    <input type="number" class="form-control" name="Driver_ID" id="Driver_ID" required readonly>
                                </div>
                            </div>
                            
                            <div class="d-flex justify-content-between mt-4">
                                <button type="submit" name="submit" class="btn btn-primary">
                                    <i class="ri-save-line me-2"></i>Add Vehicle
                                </button>
                                <button type="reset" class="btn btn-danger">
                                    <i class="ri-refresh-line me-2"></i>Reset Form
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="CSS/Vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function fetchUnassignedDrivers() {
            fetch('TakeDriversCarUnassigned')
                .then(response => {
                    console.log('Response status:', response.status);
                    if (!response.ok) throw new Error('Network response was not ok');
                    return response.json();
                })
                .then(drivers => {
                    console.log('Drivers received:', drivers);
                    const driverSelect = document.getElementById("Car_Assigning_Driver");
                    driverSelect.innerHTML = '<option value="" data-id="">Select a Driver</option>';
                    drivers.forEach(driver => {
                        const option = document.createElement("option");
                        option.value = driver.Driver_ID; // Match Java field name
                        option.textContent = driver.Driver_Name; // Match Java field name
                        option.setAttribute("data-id", driver.Driver_ID);
                        driverSelect.appendChild(option);
                    });
                })
                .catch(error => {
                    console.error("Error fetching drivers:", error);
                });
        }

        // Function to update the Driver_ID when a driver is selected
        function updateDriverID() {
            const driverSelect = document.getElementById("Car_Assigning_Driver");
            const selectedOption = driverSelect.options[driverSelect.selectedIndex];
            const driverID = selectedOption.getAttribute("data-id");  // Get the driver ID from the data-id attribute
            const driverIDInput = document.getElementById("Driver_ID");
            driverIDInput.value = driverID;  // Set the Driver ID input value
        }

        // Validation function to ensure a driver is selected
        function validateDriverSelection() {
            const driverSelect = document.getElementById("Car_Assigning_Driver");
            const selectedValue = driverSelect.value;
            
            // Check if the default option is still selected
            if (selectedValue === "") {
                alert("Please select a driver before submitting the form.");
                return false;  // Prevent form submission
            }

            return true;  // Allow form submission
        }

        // Fetch and populate drivers when the page is loaded
        document.addEventListener("DOMContentLoaded", fetchUnassignedDrivers);
    </script>
</body>
</html>