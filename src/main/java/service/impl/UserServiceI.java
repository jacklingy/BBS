package service.impl;

import dao.LoginLogMapper;
import dao.UserDetailedMapper;
import dao.UserMapper;
import dao.showInfoDao;
import model.LoginLog;
import model.RecentUser;
import model.User;
import model.UserDetailed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import java.sql.Date;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceI implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private LoginLogMapper loginLogMapper;
    @Autowired
    private UserDetailedMapper userDetailedMapper;
    @Autowired
    private showInfoDao showInfoDao;

    public User findUserByName(String username) {
        return userMapper.selectByUsername(username);
    }

    public boolean checkLogin(String username, String password) {
        User user = findUserByName(username);
        if (user != null) {
            return password.equals(user.getPassword());
        }
        return false;
    }

    public int returnSumUser() {
        return userMapper.findUserTotalNum();
    }

    public void lockUser(String username) {
        int id = findUserByName(username).getUserId();
        User user = new User();
        user.setUserId(id);
        user.setLocked(User.USER_LOCK);
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void unlockUser(String userName) {
        int id = findUserByName(userName).getUserId();
        User user = new User();
        user.setUserId(id);
        user.setLocked(User.USER_UNLOCK);
        userMapper.updateByPrimaryKeySelective(user);
    }

    public boolean isLocked(String username) {
        if (findUserByName(username).getLocked() == User.USER_LOCK) {
            return true;
        }
        return false;
    }

    public void addCredit(String username, int creditNum) {
        User user = findUserByName(username);
        User user1 = new User();
        user1.setUserId(user.getUserId());
        user1.setCredit(user.getCredit() + creditNum);
        userMapper.updateByPrimaryKeySelective(user1);
    }

    public void setLoginLogAndDate(String username, Date date, String addr) {
        User user = findUserByName(username);
        user.setLastVisit(date);
        user.setLastIp(addr);
        userMapper.updateByPrimaryKey(user);
        //注册登录日志
        int id = userMapper.selectByUsername(username).getUserId();
        LoginLog loginLog = new LoginLog();
        loginLog.setUserId(id);
        loginLog.setIp(addr);
        loginLog.setLoginDatetime(date);
        loginLogMapper.insertSelective(loginLog);
    }

    public User selectByUserId(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public void register(String username, String password) {
        Byte b = 1;
        User user = new User();
        user.setCredit(50);
        user.setLocked(User.USER_UNLOCK);
        user.setUserType(b);
        user.setUserName(username);
        user.setPassword(password);
        userMapper.insertSelective(user);
    }

    public List<User> getAllUsers() {
        //List<User> list=new ArrayList<>();
        return showInfoDao.getAllUsers();

    }

    @Override
    public void updateAddressOfPic(int userId, String address) {
        UserDetailed userDetailed = new UserDetailed();
        userDetailed.setUserId(userId);
        userDetailed.setImagePath(address);
        userDetailedMapper.updateByPrimaryKeySelective(userDetailed);
    }

    @Override
    public UserDetailed findById(int userId) {
        return userDetailedMapper.selectByPrimaryKey(userId);
    }

    @Override
    public List<RecentUser> RecentUserData() {
        return userDetailedMapper.RecentUserData();
    }

    //根据用户id返回用户详细信息
    public UserDetailed getDetailById(int id) {
        UserDetailed userDetailed = userDetailedMapper.getDetailById(id);
        return userDetailed;

    }

    //根据用户id，修改用户详细信息；
/*
   public void updateUserDetailInfo(int id,String phoneNumber,String signature,String sex){

        UserDetailed userDetailed=



    }
    */


    public void updateByPrimaryKey(int userId, String eMail, String imagePath, String phoneNumber, String userSignature, String sex) {
        userDetailedMapper.updateByPrimaryKey(userId, eMail, imagePath, phoneNumber, userSignature,
                sex);
    }




   /* public void updateByPrimaryKey1(int userId,String eMail){
        userDetailedMapper.updateByPrimaryKey1(userId,eMail);

    }

    */

    ////将post里的图片和用户存入数据库
    public void storePostPic(int post_id, String path) {
        userMapper.storePostPic(post_id, path);

    }


    //根据topicId返回user对象，方便调取其头像路径
    public int getUserByTopicId(int topic_id) {
        return userMapper.getUserByTopicId(topic_id);
    }

    @Override
    public String getImgPathByUserId(int user_id) {
        return userDetailedMapper.getImgPathByUserId(user_id);
    }

    //    @Override
//    public int getUserIdByPostId(int post_id) {
//        return userMapper.getUserIdByPostId(post_id);
//    }
//获取某用户具体信息
    @Override
    public UserDetailed getUserDetailedByUserId(int userId) {
        return userDetailedMapper.getDetailById(userId);
    }

    //获取所有用户具体信息
    @Override
    public List<UserDetailed> getAllUserDetailed() {
        return showInfoDao.getAllUserDetaild();
    }

    @Override
    public void deleteUserByUserId(int userId) {
        userMapper.deleteUserByUserId(userId);


    }

    @Override
    public int getFemale() {
        return userDetailedMapper.getFemale();
    }

    @Override
    public int getMale() {
        return userDetailedMapper.getMale();
    }
}
