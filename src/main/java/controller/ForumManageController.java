package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.BoardMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import model.Board;
import model.Post;
import model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.ForumService;
import service.UserService;


import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
@Controller
public class ForumManageController {
    @Autowired
    private ForumService forumService;
    @Autowired
    private UserService userService;
    @Autowired
    private BoardMapper boardMapper;

    @RequestMapping(value = "/article/{id}")
    @ApiOperation(value = "根据id寻找主题帖",httpMethod = "GET")
    public ModelAndView topicPage(@PathVariable("id") int topicId,
                                  @RequestParam(required = false, defaultValue = "1") Integer page) {
        int PageSize = 5;
        PageHelper.startPage(page, PageSize);
        List<Post> list = forumService.getAllPostReplyByTopicId(topicId);
        ModelAndView modelAndView = new ModelAndView();

        //String admin=""
        int host_post_id = forumService.getHostPostByTopicId(topicId);
        modelAndView.addObject("hostPostId", host_post_id);
        modelAndView.setViewName("topic");
        forumService.addViewed(topicId);
        //分页pageHelper
        PageInfo<Post> p = new PageInfo<>(list);

        /**
         * 需要知道postId，才能知道userId；
         */
        // System.out.println("p: "+);
        Topic topic = forumService.getSelectTopic(topicId);
        modelAndView.addObject(p);
        //需要写个方法 findUerByTopic_id;
        //此处注入了当前用户的信息
        modelAndView.addObject("userInfo",
                userService.findById(userService.getUserByTopicId(topicId)));

        System.out.println("topic主的id是：" + userService.getUserByTopicId(topicId));
        modelAndView.addObject("hostName",
                userService.selectByUserId(topic.getUserId()).getUserName());
        modelAndView.addObject("host", forumService.getSelectTopic(topicId));
        modelAndView.addObject("hostText",
                forumService.getHostTopicInnerText(topicId, topic.getUserId()).getPostText());
        return modelAndView;
        //往model中注入需要从数据库中查询的数据，名字为attributeName,根据地址请求，返回到某个页面
    }

    @RequestMapping(value = "/postText", method = RequestMethod.PUT)
    @ApiOperation(value = "回复主题帖",httpMethod = "PUT")
    @ResponseBody
    public boolean postText(@RequestBody Post post) {
        forumService.addPost(post);
        return true;
    }

    @RequestMapping(value = "/deletePost", method = RequestMethod.DELETE)
    @ApiOperation(value = "删除回复贴",httpMethod = "DELETE")
    public String deletePost(@RequestParam int postId,@RequestParam int topicId) {
        forumService.deletePost(postId);
        return "redirect:/article/"+topicId;
    }


    //删除主帖子topic

    @RequestMapping(value = "/deleteTopic", method = RequestMethod.POST)
    public String deleteTopic(@RequestParam int topicId) {

        forumService.deleteTopic(topicId);

        System.out.println("获取到的topicId是：" + topicId);

        return "redirect:/";

//        删除后跳转到主页面；


    }











    @RequestMapping(value = "/addTopic",method = RequestMethod.GET)
    @ApiOperation(value = "返回发帖页面",httpMethod = "GET")
    public ModelAndView addTopic() {
        List<Board> list = boardMapper.getAllBoard();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("boardList", list);
        modelAndView.setViewName("/addTopic");
        return modelAndView;
    }


    @ApiOperation(value = "增加主题帖",httpMethod = "POST")
    @RequestMapping(value = "/addTopicSuccess", method = RequestMethod.POST)
    public String addTopicSuccess(@RequestParam int boardId, @RequestParam String title,
                                  @RequestParam String text, @RequestParam int userId) {
        Topic topic = new Topic();
        topic.setTopicTitle(new EncodingTool().encodeStr(title));
        topic.setBoardId(boardId);
        topic.setUserId(userId);
        topic.setCreateTime(new Timestamp(System.currentTimeMillis()));
        topic.setDigest(Topic.NUT_DISGEST);

        System.out.println("执行到这一步11111111111111111111");

        forumService.addTopic(topic);

        System.out.println("执行到这一步222222222222222222222222222");

        Post post = new Post();


        System.out.println("执行到这一步333333333333333333333333333");

        int topicId = forumService.selectLastInsert();

        System.out.println("执行到这一步44444444444444444444444444444");
        post.setTopicId(topicId);
        post.setPostText(new EncodingTool().encodeStr(text));
        post.setPostType(Post.TYPE_MAIN);
        post.setUserId(userId);
        post.setBoardId(boardId);
        forumService.addPost(post);
        System.out.println("执行到这一步5555555555555555555555");

        return "redirect:/article/"+topicId;

    }

    /*********************问答板块的提交处理********************************/
    @ApiOperation(value = "增加need", httpMethod = "POST")
    @RequestMapping(value = "/addNeedSuccess", method = RequestMethod.POST)
    public String addNeedSuccess(@RequestParam int boardId,
                                 @RequestParam String title,
                                 @RequestParam(required = false,value = "credit") int credit ,
                                 @RequestParam String text,
                                 @RequestParam int userId
    ) {

        System.out.println("boardid :" + boardId);
        System.out.println("title: " + title);
        System.out.println("credit: " + credit);
        System.out.println("text: " + text);
        System.out.println("userId: " + userId);
        Topic topic2 = new Topic();
        topic2.setTopicTitle(new EncodingTool().encodeStr(title));
        topic2.setBoardId(boardId);
        topic2.setUserId(userId);
        topic2.setCreateTime(new Timestamp(System.currentTimeMillis()));
        topic2.setDigest(Topic.NUT_DISGEST);
        int isneed = 1;
        topic2.setIsneed(isneed);
        topic2.setCredit(credit);
        System.out.println(" topic2.setIsneed(1);" + topic2.getIsneed());


//        System.out.println("执行到这一步11111111111111111111");
        System.out.println(topic2.toString());
        forumService.addTopic(topic2);
//        System.out.println("执行到这一步222222222222222222222222222");


        Post post = new Post();
//        System.out.println("执行到这一步333333333333333333333333333");

        int topicId = forumService.selectLastInsert();
//        System.out.println("执行到这一步44444444444444444444444444444");
//        System.out.println("有没有·查到last insert id");


        post.setTopicId(topicId);
        post.setPostText(new EncodingTool().encodeStr(text));
        post.setPostType(Post.TYPE_MAIN);
        post.setUserId(userId);
        post.setBoardId(boardId);
        System.out.println("执行到这一步5555555555555555555555");

        forumService.addPost(post);
        System.out.println("post也添加666666666666666666");

        return "redirect:/article/" + topicId;


    }


    /********************************************************************************************/
    //还要更改参数传过来的路径
    //传来要编辑的post的id
    @RequestMapping(value = "updatepost/{post_id}", method = RequestMethod.POST)
    public ModelAndView updatePost(@PathVariable("post_id") int post_id/*,@RequestParam("user_id")
    int uer_id,
                             @RequestParam("post_text") String post_text*/) {


        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("post_id", post_id);
        String post_text = forumService.getPostTextByPostId(post_id);

        System.out.println("edit中要展示的文字1:" + post_text);
        // int topic_id=forumService.getTopicByPost(post_id);
        // modelAndView.addObject("topic_id",topic_id);


        modelAndView.addObject("post_text", post_text);
        System.out.println("edit中要展示的文字2:" + new EncodingTool().encodeStr(post_text));

        // modelAndView.addObject("topic_id",topic_id)
        modelAndView.setViewName("updateContent");


        //只需要传一个post_id
        return modelAndView;
    }

    //根据id 将更改后的 text存入数据库
    //现在需要将两个参数传到这个url
    @RequestMapping(value = "/updatestore", method = RequestMethod.POST)
    public String updatestore(
            @RequestParam String post_text, @RequestParam int post_id) {
        forumService.storeUpdate(post_id, new EncodingTool().encodeStr(post_text));
        int topic_id = forumService.getTopicByPost(post_id);


        System.out.println("传过来将要存入的参数及其值为：post_id:" + post_id +
                "post_text: " + new EncodingTool().encodeStr(post_text) + topic_id);

        return "redirect:/article/" + topic_id;

        //

    }


    //requestParam转码
    public static class EncodingTool {
         String encodeStr(String str) {
            try {
                return new String(str.getBytes("ISO-8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                return null;
            }

        }
    }
}
