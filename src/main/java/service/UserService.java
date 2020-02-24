package service;

import model.RecentUser;
import model.User;
import model.UserDetailed;

import java.sql.Date;
import java.util.List;

public interface UserService {

    //检查是否登录成功
    boolean checkLogin(String username, String password);
    //返回总的用户数
    int returnSumUser();
    //根据用户名查找用户，返回的是一个用户对象
    User findUserByName(String username);
    //根据用户名，锁定该用户
    void lockUser(String username);

    //解锁用户
    void unlockUser(String userName);
    //根据用户名判断用户是否被锁定，返回一个bool值
    boolean isLocked(String username);
    //根据用户名，为该用户添加积分，积分是int型的
    void addCredit(String username, int creditNum);
    //根据用户名 设置登录的日期和地址？
    void setLoginLogAndDate(String username, Date date, String addr);
    //用户注册
    void register(String username, String password);

    //这里需要改一下,注册用户时没有相应的在详细信息的表里添加一

    /************************************/
    //根据用户的id查找用户，返回一个User对象
    User selectByUserId(int id);
    //根据用户的id，更新用户的头像地址

    void updateAddressOfPic(int userId,String address);
    //根据用户的id，返回一个用户信息对象
    UserDetailed findById(int userId);
    //返回最新注册的用户的一个list
    List<RecentUser> RecentUserData();
//获取所有的用户
    List<User> getAllUsers();

    //根据用户id获取用户详细信息；返回一个UserDetailed对象
    UserDetailed getDetailById(int id);

    //根据用户id，修改用户详细信息；

    //void updateUserDetailInfo(int id,String phoneNumber,String signature,String sex);


    void updateByPrimaryKey(int userId, String eMail, String imagePath, String phoneNumber, String userSignature, String sex);

    // void updateByPrimaryKey1(int userId,String eMail);


    //将post里的图片和用户存入数据库
    void storePostPic(int post_id, String path);

    //根据topicId返回userId对象，方便调取其头像路径
    int getUserByTopicId(int topic_id);//事实上是getUserIdByTopicId  返回的是一个int，这里懒得改了


    //根据postId返回userId，方便调取其头像路径

    // int getUserIdByPostId(int post_id);


    //根据post_id,查询到post_内容
    String getImgPathByUserId(int user_id);

    UserDetailed getUserDetailedByUserId(int userId);

    List<UserDetailed> getAllUserDetailed();

    void deleteUserByUserId(int userId);

    int getFemale();
    int getMale();

}
