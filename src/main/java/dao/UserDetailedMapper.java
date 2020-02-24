package dao;

import model.RecentUser;
import model.UserDetailed;

import java.sql.Date;
import java.util.List;

public interface UserDetailedMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(UserDetailed record);

    int insertSelective(UserDetailed record);

    UserDetailed selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(UserDetailed record);

    int updateByPrimaryKey(UserDetailed record);

    List<RecentUser> RecentUserData();

    UserDetailed getDetailById(int id);

    int updateUserDetailInfo(int id, String phoneNumber, String signature, String sex);

    void updateByPrimaryKey(int userId, String imagePath, String phoneNumber, String userSignature,
                            String sex, String signTime);

    //void updateByPrimaryKey1(int userId,String eMail);


    //根据用户id查询到用户头像地址
    String getImgPathByUserId(int user_id);

    int getFemale();


    int getMale();
}