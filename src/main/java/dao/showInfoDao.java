package dao;

import model.User;
import model.UserDetailed;

import java.util.List;

public interface showInfoDao {

    List<User> getAllUsers();

    List<UserDetailed> getAllUserDetaild();
}
