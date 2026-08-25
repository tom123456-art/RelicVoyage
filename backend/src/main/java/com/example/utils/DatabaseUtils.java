package com.example.utils;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;

import org.springframework.stereotype.Component;

/**
 * Database utility class.
 */
@Component
public class DatabaseUtils
{
    private final DataSource dataSource;

    public DatabaseUtils(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    public Connection getConnection() throws SQLException
    {
        return dataSource.getConnection();
    }
}
