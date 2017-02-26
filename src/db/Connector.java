package db;

/**
 * Created by Денис on 25.01.2017.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
    private static String jdbcUrl;
    private static String jdbcUser;
    private static String jdbcPassword;

    public static void init(String jdbcDriver,
                            String jdbcUrl,
                            String jdbcUser,
                            String jdbcPassword) throws ClassNotFoundException {
        Class.forName(jdbcDriver);
        Connector.jdbcUrl = jdbcUrl;
        Connector.jdbcUser = jdbcUser;
        Connector.jdbcPassword = jdbcPassword;
    }

    public static Connection getConnection() throws SQLException {
        Connection c;
        c = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
        c.setAutoCommit(false);
        return c;
    }
}