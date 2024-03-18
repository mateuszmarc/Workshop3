package pl.coderslab.entity;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mindrot.jbcrypt.BCrypt;
import pl.coderslab.dbmanagement.DbUtil;
import pl.coderslab.service.InputValidator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDao {
    public static final String EMAIL_VALIDATION_REGEX = "[_a-zA-z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*\\.([a-zA-Z]{2,}){1}";
    public static final String PASSWORD_VALIDATION_REGEX = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
    public static final String USERNAME_VALIDATION_REGEX = "^[a-zA-Z0-9](_(?!(\\.|_))|\\.(?!(_|\\.))|[a-zA-Z0-9]){6,18}[a-zA-Z0-9]$";
    public static final Logger log = LogManager.getLogger(UserDao.class);
    public static final String CREATE_USER_QUERY = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
    public static final String UPDATE_USER_QUERY = "UPDATE users SET username = ?, email = ?, password = ? WHERE id = ?";
    public static final String DELETE_USER_QUERY = "DELETE FROM users WHERE id = ?";
    public static final String READ_USER_QUERY = "SELECT * FROM users WHERE id = ?";
    public static final String READ_ALL_USERS = "SELECT * FROM users";
    public static final String COUNT_ALL_USERS = "SELECT COUNT(*) FROM users";
    public static final String RETRIEVE_RECORD_WITH_OFFSET_AND_LIMIT = "SELECT * from users LIMIT ? OFFSET ?";

    public User create(User user) {
        String username = user.getUsername();
        String email = user.getEmail();
        String plainPassword = user.getPassword();
        if (
                username == null
                        || !InputValidator.validateString(username, USERNAME_VALIDATION_REGEX)
                        || email == null
                        || !InputValidator.validateString(email, EMAIL_VALIDATION_REGEX)
                        || plainPassword == null
                        || !InputValidator.validateString(plainPassword, PASSWORD_VALIDATION_REGEX)
        ) {
            log.info("Incorrect values entered");
            return null;
        }

        try (Connection connection = DbUtil.connect(); PreparedStatement preparedStatement = connection.prepareStatement(CREATE_USER_QUERY, PreparedStatement.RETURN_GENERATED_KEYS)) {
            String hashedPassword = hashPassword(plainPassword);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, hashedPassword);

            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                user.setId(id);
            }
            return user;
        } catch (SQLException e) {
            log.info(e.getMessage());
            return null;
        }

    }

    public User read(int userId) {
        try (Connection connection = DbUtil.connect(); PreparedStatement preparedStatement = connection.prepareStatement(READ_USER_QUERY)) {
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<User> retrievedUsers = createUsersFromResultSet(resultSet);
            if (!retrievedUsers.isEmpty()) {
                return retrievedUsers.get(0);
            }
        } catch (SQLException e) {
            log.info(e.getMessage());
        }
        log.info("There was no user with given id = " + userId);
        return null;
    }

    private String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public boolean update(User user) {
        int id = user.getId();
        String username = user.getUsername();
        String email = user.getEmail();
        String password = user.getPassword();
        int updatedRows = 0;
        boolean isRowUpdated = false;

        if (
                username == null
                        || !InputValidator.validateString(username, USERNAME_VALIDATION_REGEX)
                        || email == null
                        || !InputValidator.validateString(email, EMAIL_VALIDATION_REGEX)
                        || password == null
                        || !InputValidator.validateString(password, PASSWORD_VALIDATION_REGEX)) {
            log.info("Invalid data provided for update");
            log.info(updatedRows + " rows updated");
            return false;
        }

        try (Connection connection = DbUtil.connect(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_QUERY)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            String hashedPassword = hashPassword(password);
            preparedStatement.setString(3, hashedPassword);
            preparedStatement.setInt(4, id);

            updatedRows = preparedStatement.executeUpdate();

            if (updatedRows == 0) {
                log.info("There was no record to update that has id = " + id);
            } else {
                log.info(updatedRows + " rows updated");
                isRowUpdated = true;
            }
        } catch (SQLException e) {
            log.info(e.getMessage());
        }
        return isRowUpdated;
    }

    public boolean delete(int userId) {
        boolean isDeleted = false;

        try (Connection connection = DbUtil.connect(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_QUERY)) {
            preparedStatement.setInt(1, userId);
            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows == 0) {
                log.info("There is no user record having id = " + userId);
            } else {
                isDeleted = true;
            }
            log.info(affectedRows + " rows affected");
        } catch (SQLException e) {
            log.info(e.getMessage());
        }
        return isDeleted;
    }

    public List<User> findAll() {
        List<User> retrievedUsers = new ArrayList<>();
        try (Connection connection = DbUtil.connect(); PreparedStatement preparedStatement = connection.prepareStatement(READ_ALL_USERS)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            retrievedUsers = createUsersFromResultSet(resultSet);
        } catch (SQLException e) {
            log.info(e.getMessage());
        }
        return retrievedUsers;
    }


    private List<User> createUsersFromResultSet(ResultSet resultSet) throws SQLException {
        List<User> retrievedUsers = new ArrayList<>();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String username = resultSet.getString("username");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            User user = new User(username, email, password);
            user.setId(id);
            retrievedUsers.add(user);
        }
        return retrievedUsers;
    }

    public int countAll() {
        try (Connection connection = DbUtil.connect(); PreparedStatement preparedStatement = connection.prepareStatement(COUNT_ALL_USERS)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            log.info(e.getMessage());
        }
        return 0;
    }

    public List<User> findUsersBasedOnOffsetAndLimit(int offset, int limit) {
        List<User> retrievedUsers = new ArrayList<>();
        try (Connection connection = DbUtil.connect(); PreparedStatement preparedStatement = connection.prepareStatement(RETRIEVE_RECORD_WITH_OFFSET_AND_LIMIT)) {
            preparedStatement.setInt(1, limit);
            preparedStatement.setInt(2, offset);
            ResultSet resultSet = preparedStatement.executeQuery();
            retrievedUsers = createUsersFromResultSet(resultSet);
            return retrievedUsers;
        } catch (SQLException e) {
            log.info(e.getMessage());
        }
        return retrievedUsers;
    }


}
