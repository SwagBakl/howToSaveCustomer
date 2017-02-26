package web;

import com.sun.net.httpserver.HttpServer;
import db.Connector;
import db.CustomerStorage;
import domain.Customer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Денис on 19.02.2017.
 */
public class CustomerListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Connection c = null;
        try {
            Connector.init(
                    "com.mysql.jdbc.Driver",
                    "jdbc:mysql://localhost:3306/bank_roll"
                            + "?useUnicode=true&characterEncoding=UTF-8",
                    "root",
                    "root"
            );
            c = Connector.getConnection();
            CustomerStorage s = new CustomerStorage();
            s.setConnection(c);
            List<Customer> customers = s.readAll();
            req.setAttribute("customers", customers);
            getServletContext().getRequestDispatcher("/WEB-INF/jsp/index.jsp")
                    .forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException(e);
        } finally {
            try { c.close(); } catch (NullPointerException | SQLException e) {}
        }
    }

}

