package Servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Models.Car;
import Services.CarService;

@WebServlet("/addCar")
@MultipartConfig // Enables handling file uploads
public class addCar extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    public addCar() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Create a Car object
        Car car = new Car();
        car.setCar_Name(request.getParameter("Car_Name"));
        car.setCar_Brand(request.getParameter("Car_Brand"));
        car.setCar_Number_Plate(request.getParameter("Car_Number_Plate"));
        car.setCar_Colour(request.getParameter("Car_Colour"));
        car.setCar_Booking_Price(Double.parseDouble(request.getParameter("Car_Booking_Price")));
        car.setDriver_ID(Integer.parseInt(request.getParameter("Driver_ID")));

        // Handle file upload for the car image
        Part filePart = request.getPart("Car_Image");
        byte[] carImage = null;

        // Check if a file was uploaded
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                carImage = inputStream.readAllBytes();
            }
        }

        // Set the image as a byte array in the Car object
        car.setCar_Image(carImage);

        // Pass the Car object to the service layer
        CarService carService = new CarService();
        boolean isRegistered = carService.registerCar(car);

        // Generate JavaScript response
        response.setContentType("text/html");
        if (isRegistered) {
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('Car Registration Successful and Driver Status Updated');");
            response.getWriter().println("window.location.href = 'AdminDashboard.jsp';");
            response.getWriter().println("</script>");
        } else {
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('Car Registration Failed or Driver Status Update Failed');");
            response.getWriter().println("window.location.href = 'AddCars.jsp';");
            response.getWriter().println("</script>");
        }
    }
}