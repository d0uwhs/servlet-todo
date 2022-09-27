package com.example.dao;

import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectTests {

    @Test
    void testConnect() {
        // Driver Loading
        Class.forName("org.mariadb.jdbc.Driver");
        // Connection
        Connection connection = DriverManager.getConnection("jdbc:mariadb://1","webuser","webuser");
        // Querying

        // Close
    }
}
