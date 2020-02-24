package dao;

import model.Topic;

import java.util.List;

public interface TopicMapper {
    int deleteByPrimaryKey(Integer topicId);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectByPrimaryKey(Integer topicId);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);

    List<Topic> selectOrderBydatetime();

    List<Topic> selectOrderByReply();

    int selectLastInsertId();

    List<Topic> selectByuserId(int userId);

    //根据贴子id加精
    void jiajing(int id);

    //根据贴子id取消加精
    void canceljiajing(int id);


    //根据帖子id置顶帖子
    void top(int id);


    //根据帖子id取消置顶帖子
    void canceltop(int id);


    void deleteTopic(int topicId);

    List<Topic> getAllForum();


    int get1();
    int get2();
    int get3();
    int get4();
    int get5();
    int get99();
}