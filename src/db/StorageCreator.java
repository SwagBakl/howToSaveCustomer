package db;

import java.sql.Connection;
import java.sql.SQLException;

public class StorageCreator {
    private Connection connection;

    private CustomerStorage customerStorage;


    public StorageCreator() throws SQLException {
        connection = Connector.getConnection();
    }



    public CustomerStorage newCustomerStorage() {
        if(customerStorage == null){
            customerStorage = new CustomerStorage();
            customerStorage.setConnection(connection);
        }
        return customerStorage;
    }

    public void close() {
        try { connection.close(); } catch(SQLException e) {}
    }
}