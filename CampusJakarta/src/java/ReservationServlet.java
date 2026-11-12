

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ReservationServlet", urlPatterns = {"/ReservationServlet"})
public class ReservationServlet extends HttpServlet {

    // Connected to your 'test' database
    private static final String DB_URL = "jdbc:derby://localhost:1527/test";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        String rawName = req.getParameter("userName");
        String rawRole = req.getParameter("userRole");
        String rawCategory = req.getParameter("itemCategory");
        String rawQuantity = req.getParameter("quantity");
        String rawDays = req.getParameter("bookingDays");

        if (rawName == null || rawName.trim().isEmpty() || rawRole == null || rawCategory == null) {
            try (PrintWriter out = res.getWriter()) {
                out.println("<h3>Error: Please fill in all required fields.</h3>");
                out.println("<a href='booking_form.jsp'>Back to Form</a>");
            }
            return;
        }

        String userName = rawName.trim().toUpperCase();
        String userRole = rawRole.trim().toUpperCase();
        String itemCategory = rawCategory.trim().toUpperCase();
        
        int quantity;
        int bookingDays;
        try {
            quantity = Integer.parseInt(rawQuantity.trim());
            bookingDays = Integer.parseInt(rawDays.trim());
            if (quantity <= 0 || bookingDays <= 0) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            try (PrintWriter out = res.getWriter()) {
                out.println("<h3>Error: Quantity and Booking Days must be valid positive numbers.</h3>");
                out.println("<a href='booking_form.jsp'>Back to Form</a>");
            }
            return;
        }

        double dailyRate;
        switch (itemCategory) {
            case "LAPTOP": dailyRate = 50.0; break;
            case "PROJECTOR": dailyRate = 80.0; break;
            case "POD": dailyRate = 100.0; break;
            default: dailyRate = 0.0; break;
        }

        double subtotal = quantity * bookingDays * dailyRate;
        double discountAmount = "FACULTY".equals(userRole) ? (subtotal * 0.15) : 0.0;
        double netTotal = subtotal - discountAmount;

        String sql = "INSERT INTO reservations "
                   + "(user_name, user_role, item_category, quantity, booking_days, daily_rate, subtotal, net_total) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, userName);
                ps.setString(2, userRole);
                ps.setString(3, itemCategory);
                ps.setInt(4, quantity);
                ps.setInt(5, bookingDays);
                ps.setBigDecimal(6, BigDecimal.valueOf(dailyRate).setScale(2, RoundingMode.HALF_UP));
                ps.setBigDecimal(7, BigDecimal.valueOf(subtotal).setScale(2, RoundingMode.HALF_UP));
                ps.setBigDecimal(8, BigDecimal.valueOf(netTotal).setScale(2, RoundingMode.HALF_UP));

                ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            try (PrintWriter out = res.getWriter()) {
                out.println("<h3>Database Error: " + ex.getMessage() + "</h3>");
                out.println("<a href='booking_form.jsp'>Back to Form</a>");
            }
            return;
        }

        req.setAttribute("userName", userName);
        req.setAttribute("userRole", userRole);
        req.setAttribute("itemCategory", itemCategory);
        req.setAttribute("quantity", quantity);
        req.setAttribute("bookingDays", bookingDays);
        req.setAttribute("dailyRate", dailyRate);
        req.setAttribute("subtotal", subtotal);
        req.setAttribute("discountAmount", discountAmount);
        req.setAttribute("netTotal", netTotal);

        req.getRequestDispatcher("receipt.jsp").forward(req, res);
    }
}