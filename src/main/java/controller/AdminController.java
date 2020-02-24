package controller;


import model.Topic;
import model.User;
import model.UserDetailed;
import model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.ForumService;
import service.UserService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private ForumService forumService;


    //通过form的post方法跳转到用户管理界面

    @RequestMapping(value = "/showinfo", method = RequestMethod.POST)
    public String showInfo(Model model) {
        List<User> list = userService.getAllUsers();
        List<UserDetailed> detaileds = userService.getAllUserDetailed();
        List<UserInfo> infoList = new ArrayList<>();
        int size = list.size();
        for (int i = 0; i < size; ++i) {
            UserInfo info = new UserInfo(list.get(i), detaileds.get(i));
            infoList.add(i, info);
        }
        for (UserInfo info : infoList) {
            System.out.println(info);
        }
        model.addAttribute("infoList", infoList);
        return "showInfo";
    }


    //通过form的post方法跳转到帖子管理界面
    @RequestMapping(value = "/showtopic", method = RequestMethod.POST)
    public String showTopic(Model model) {
        List<Topic> list = forumService.getAllTopics();
        model.addAttribute("topics", list);
        return "showTopic";

    }


    //锁定用户 锁完后跳回之前的界面

    @RequestMapping(value = "/LockUser", method = RequestMethod.POST)
    public String LockUser(@RequestParam("name") String name) {
        userService.lockUser(name);

        System.out.println(name + " has been blocked");
        return "forward:/showinfo";
    }

//解锁

    @RequestMapping(value = "/UnLockUser", method = RequestMethod.POST)
    public String UnLockUser(@RequestParam("name") String name) {
        userService.unlockUser(name);
        System.out.println(name + " has been unblocked");
        return "forward:/showinfo";
    }


//删除帖子

    @RequestMapping(value = "/DeleteTopic", method = RequestMethod.POST)
    public String DeleteTopic(@RequestParam("topic_id") int topicID) {
        forumService.deleteTopic(topicID);
        System.out.println("删除" + topicID + "成功");
        return "forward:/showtopic";
    }


    //跳转到测试面板
    @RequestMapping(value = "/adminpane", method = RequestMethod.POST)
    public String adminPane() {
        return "adminPane";
    }

    //加精
    @RequestMapping(value = "/jiajing", method = RequestMethod.POST)
    public String jiajing(@RequestParam("topic_id") int id) {

        ModelAndView modelAndView = new ModelAndView();
        forumService.jiajing(id);


        return "forward:/showtopic";

    }

    //取消加精
    @RequestMapping(value = "/canceljiajing", method = RequestMethod.POST)
    public String canceljiajing(@RequestParam("topic_id") int id) {

        ModelAndView modelAndView = new ModelAndView();
        forumService.canceljiajing(id);


        return "forward:/showtopic";

    }

    //置顶
    @RequestMapping(value = "/top", method = RequestMethod.POST)

    public String top(@RequestParam("topic_id") int id) {

        // ModelAndView modelAndView=new ModelAndView();
        forumService.top(id);


        return "forward:/showtopic";

    }


    //取消置顶
    @RequestMapping(value = "/canceltop", method = RequestMethod.POST)

    public String canceltop(@RequestParam("topic_id") int id) {

        // ModelAndView modelAndView=new ModelAndView();
        forumService.canceltop(id);


        return "forward:/showtopic";

    }


    //进入悬赏测试
    @RequestMapping(value = "/enterneed", method = RequestMethod.GET)
    public ModelAndView Need(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("addNeed");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        modelAndView.addObject("user", user);

        return modelAndView;
    }


    @RequestMapping(value = "/editUserInfo", method = RequestMethod.POST)
    public ModelAndView EditInfo(@RequestParam("userId") int userId, HttpServletRequest request) {
        UserDetailed detailed = userService.findById(userId);
        User user = userService.selectByUserId(userId);
        UserInfo userInfo = new UserInfo(user, detailed);
        //HttpSession session = request.getSession();
        //session.setAttribute("info",userInfo);
        System.out.println(userInfo);
        ModelAndView modelAndView1 = new ModelAndView();
        modelAndView1.addObject("userInfo", userInfo);
        modelAndView1.setViewName("/editInfo");
        return modelAndView1;
    }


    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String UpdateInfo(
            @RequestParam("userId") int userId,
            @RequestParam(value = "oldpwd", required = false) String oldpwd,
            @RequestParam(value = "newpwd", required = false) String newpwd,
            @RequestParam(value = "newpwd1", required = false) String newpwd1,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("signature") String signature,
            @RequestParam("sex") String sex) {
//    	if(oldpwd.equals(userService.selectByUserId(userId).getPassword()))
//    		return "/error";


        ForumManageController.EncodingTool encodingTool = new ForumManageController.EncodingTool();

        signature = encodingTool.encodeStr(signature);
        sex = encodingTool.encodeStr(sex);


        userService.updateByPrimaryKey(userId, email, userService.getImgPathByUserId(userId)
                , phone, signature, sex);


        System.out.println("userId=" + userId + " oldpwd=" + oldpwd + " newpwd=" + newpwd + " newpwd1=" + newpwd1 + " email=" + email + " phone=" + phone + " signature=" + signature);
        return "redirect:/user/detail/" + userId;
    }


    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public String deleteUserById(@RequestParam("userId") int userId) {


        userService.deleteUserByUserId(userId);
        System.out.println("删除用户成功！" + userId);
        return "forward:/showinfo";

    }


    @RequestMapping(value = "/charts" ,method = RequestMethod.POST)
    public ModelAndView Charts(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("/charts");
        modelAndView.addObject("b1",forumService.get1());
        modelAndView.addObject("b2",forumService.get2());
        modelAndView.addObject("b3",forumService.get3());
        modelAndView.addObject("b4",forumService.get4());
        modelAndView.addObject("b5",forumService.get5());
        modelAndView.addObject("b99",forumService.get99());

        modelAndView.addObject("female",userService.getFemale());
        modelAndView.addObject("male",userService.getMale());

//
//        System.out.println(userService.getFemale());
//        System.out.println(userService.getMale());
//        System.out.println(forumService.get1());
//        System.out.println(forumService.get2());
//        System.out.println(forumService.get3());
//        System.out.println(forumService.get4());
//        System.out.println(forumService.get5());
//        System.out.println(forumService.get99());
//


        return modelAndView;
    }
}
