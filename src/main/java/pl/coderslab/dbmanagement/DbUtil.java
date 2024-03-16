package pl.coderslab.dbmanagement;

import io.github.cdimascio.dotenv.Dotenv;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DbUtil {
    private static DataSource dataSource;
    public static Connection connect() throws SQLException {
        return getInstance().getConnection();
    }

    private static DataSource getInstance() {
        if (dataSource == null) {
            try {
                Context initContext = new InitialContext();
                Context envContext = (Context) initContext.lookup("java:/comp/env");
                dataSource = (DataSource) envContext.lookup("jdbc/users");
            } catch (NamingException e) {
                e.printStackTrace();
            }
        }
        return dataSource;
    }

    public static void createSqlDump() {
        Dotenv dotenv = Dotenv.load();
        String dbName = dotenv.get("db_name");
        String dbUser = dotenv.get("user");
        String dbPassword = dotenv.get("password");
        String dbDumpPath = dotenv.get("db_backup_folder");
        LocalDateTime localDate = LocalDateTime.now();
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy_HH:mm:ss");
        String formattedDate = localDate.format(dateTimeFormatter);
        String dbDumpFilename = dbName + "_" + formattedDate + ".sql";
        String dbExecutionString = "mysqldump -u %s -p%s %s > %s/%s".formatted(dbUser, dbPassword, dbName, dbDumpPath, dbDumpFilename);

        try {
            Process runtimeProcess = Runtime.getRuntime().exec(new String[]{"/bin/sh", "-c", dbExecutionString});
            int status = runtimeProcess.waitFor();
            if (status == 0) {
                System.out.println("Backup taken successfully");
            } else {
                System.out.println("Could not take mysql backup");
            }
        } catch (IOException e) {
            System.out.println("IOException " + e);
        } catch (InterruptedException e1) {
            System.out.println("Interrupt exception " + e1);
        }
    }

}