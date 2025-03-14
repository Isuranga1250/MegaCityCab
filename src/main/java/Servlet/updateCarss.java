package Servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import Models.Car;
import Services.CarService;

@WebServlet("/updateCar")
@MultipartConfig // Enables handling file uploads
public class updateCarss extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateCarss() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	HttpSession session = request.getSession(false); // false means don't create a new session if it doesn't exist
        if (session == null || session.getAttribute("adminLoggedIn") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if session is missing
            return;
        }
        // Create a Car object
        Car car = new Car();
        car.setCar_ID(Integer.parseInt(request.getParameter("Car_ID")));
        car.setCar_Name(request.getParameter("Car_Name"));
        car.setCar_Brand(request.getParameter("Car_Brand"));
        car.setCar_Number_Plate(request.getParameter("Car_Number_Plate"));
        car.setCar_Colour(request.getParameter("Car_Colour"));
        car.setCar_Booking_Price(Double.parseDouble(request.getParameter("Car_Booking_Price")));

        // Handle file upload for the car image
        Part filePart = request.getPart("Car_Image");
        byte[] carImage = null;

        // Check if a file was uploaded
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                carImage = inputStream.readAllBytes();
            }
            car.setCar_Image(carImage);
        } else {
            // Retain existing image if no new image is uploaded
            CarService carService = new CarService();
            byte[] existingImage = carService.getCarImage(car.getCar_ID());

            if (existingImage != null) {
                car.setCar_Image(existingImage);
            } else {
                car.setCar_Image(null); // Handle case where no image exists in DB
            }
        }

        // Pass the Car object to the service layer
        CarService carService = new CarService();
        boolean isRegistered = carService.updateCar(car);

        // Generate JavaScript response
        response.setContentType("text/html");
        if (isRegistered) {
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('Dear Admin, Your Cab is Updated Successfully');");
            response.getWriter().println("window.location.href = 'AdminDashboard.jsp';");
            response.getWriter().println("</script>");
        } else {
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('Dear Admin, Your Cab Update Failed');");
            response.getWriter().println("window.location.href = 'UpdateCars.jsp';");
            response.getWriter().println("</script>");
        }
    }
}