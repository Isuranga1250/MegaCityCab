package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCarServlet")
public class DeleteCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteCarServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the car ID from the request parameter
        int carId = Integer.parseInt(request.getParameter("carId"));

        // Database connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/megacitycab1?characterEncoding=utf8&serverTimezone=UTC";
        String dbUsername = "root";
        String dbPassword = "123456";

        // SQL query to delete the car entry
        String deleteQuery = "DELETE FROM car_table WHERE Car_ID = ?";

        try (Connection con = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
             PreparedStatement ps = con.prepareStatement(deleteQuery)) {

            // Set the car ID parameter in the query
            ps.setInt(1, carId);

            // Execute the delete query
            int rowsDeleted = ps.executeUpdate();

            // Generate JavaScript response based on the result
            response.setContentType("text/html");
            if (rowsDeleted > 0) {
                // If deletion is successful
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('Car deleted successfully!');");
                response.getWriter().println("window.location.href = 'Viewcars.jsp';"); // Redirect to the view page
                response.getWriter().println("</script>");
            } else {
                // If no rows were deleted (car ID not found)
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('Car deletion failed. Car ID not found.');");
                response.getWriter().println("window.location.href = 'Viewcars.jsp';"); // Redirect to the view page
                response.getWriter().println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();

            // Handle database errors
            response.setContentType("text/html");
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('An error occurred while deleting the car. Please try again.');");
            response.getWriter().println("window.location.href = 'Viewcars.jsp';"); // Redirect to the view page
            response.getWriter().println("</script>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}