package dao;

import model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByUsername(String username);

    int findUserTotalNum();

    ////将post里的图片和用户存入数据库
    void storePostPic(int post_id, String path);

    //根据topicId返回user对象，方便调取其头像路径
    int getUserByTopicId(int topic_id);

    //根据postId返回user对象，方便调取其头像路径

    // int getUserIdByPostId(int post_id);
    void deleteUserByUserId(int userId);




}