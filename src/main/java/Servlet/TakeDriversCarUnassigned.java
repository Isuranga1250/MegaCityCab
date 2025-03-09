package Servlet;

import com.google.gson.Gson;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Models.Driver;
import Services.DriverService;
import java.io.IOException;

@WebServlet("/TakeDriversCarUnassigned")
public class TakeDriversCarUnassigned extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DriverService driverService = new DriverService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            List<Driver> unassignedDrivers = driverService.getUnassignedDrivers();
            System.out.println("Unassigned Drivers: " + unassignedDrivers); // Debug
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(unassignedDrivers);
            System.out.println("JSON Response: " + jsonResponse); // Debug
            response.getWriter().write(jsonResponse);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Unable to fetch unassigned drivers.\"}");
        }
    }
}