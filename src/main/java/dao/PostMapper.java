package dao;

import model.Post;

import java.util.List;

public interface PostMapper {
    int deleteByPrimaryKey(Integer postId);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer postId);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKeyWithBLOBs(Post record);

    int updateByPrimaryKey(Post record);

    List<Post> selectByTopicId(int topicId);

    Post getHostTopicInnerText(int topicId, int userId);

    int getUserIdByPostId(int post_id);

    //根据id查内容
    String getPostTextByPostId(int post_id);

    //存入数据库
    void storeUpdate(int post_id, String post_text);


    //post_id->topic_id
    int getTopicByPost(int post_id);


    //根据topic_id,type=1, 查询到post_id;

    int getHostPostByTopicId(int topic_id);


}