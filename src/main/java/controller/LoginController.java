package controller;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.ForumService;
import service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.Enumeration;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private ForumService forumService;
    @RequestMapping(value = "",method = RequestMethod.GET)
    @ApiOperation(value = "返回主页面",httpMethod = "GET")
    public String m() {
        return "forward:/index";

    }
    @RequestMapping(value = "/user/login",method = RequestMethod.GET)
    @ApiOperation(value = "返回登录页面",httpMethod = "GET")
    public String login() {
        return "login";

    }

    @RequestMapping(value = "/index")
    @ApiOperation(value = "返回主页面",httpMethod = "GET")
    public ModelAndView main(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("userNum",userService.returnSumUser());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/index");

        modelAndView.addObject("newList",forumService.getNewerForum());
        modelAndView.addObject("hotList", forumService.getHotForum());
        modelAndView.addObject("recentUser", userService.RecentUserData());
        modelAndView.addObject("topList", forumService.getAllTopicsA());
        modelAndView.addObject("boardList", forumService.getAllboard());
        modelAndView.addObject("helpList", forumService.getAllForum());
        return modelAndView;
    }


    @RequestMapping(value = "/test")
    @ApiOperation(value = "返回主页面1",httpMethod = "GET")
    public ModelAndView main1(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("userNum",userService.returnSumUser());
        ModelAndView modelAndView1 = new ModelAndView();
        modelAndView1.setViewName("/test");
        modelAndView1.addObject("newList",forumService.getNewerForum());
        modelAndView1.addObject("hotList", forumService.getHotForum());
        modelAndView1.addObject("recentUser", userService.RecentUserData());
        return modelAndView1;
    }

    @RequestMapping(value = "/loginSuccess",method = RequestMethod.POST)
    @ApiOperation(value = "登录成功跳转",httpMethod = "POST")
    public ModelAndView loginSuccess(@RequestParam String username, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        userService.addCredit(username, 5);//登录一次添加5积分
        //获取ip和date
        userService.setLoginLogAndDate(username,new Date(System.currentTimeMillis()),request.getRemoteAddr());
        session.setAttribute("user", userService.findUserByName(username));
        session.setAttribute("userDetail", userService.findById(userService.
                findUserByName(username).getUserId()));
        modelAndView.setViewName("redirect:/");
        return modelAndView;

        //登陆成功，返回主界面，并这只session（user，User)

    }

    @RequestMapping(value = "/user/logout",method = RequestMethod.GET)
    @ApiOperation(value = "登出页面",httpMethod = "GET")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/";
    }

    @ResponseBody
    @RequestMapping(value = "/checkLogin",method = RequestMethod.POST)
    @ApiOperation(value = "检查用户登录输入信息",httpMethod = "POST")
    public int checkLogin(@RequestParam String username,@RequestParam String password) {
        if (userService.findUserByName(username) != null) {
            if (userService.checkLogin(username, password)) {
                if (!userService.isLocked(username)) {
                    return 0;//ok
                }else return 1;//locked
            }else return 2;//wrong password;
        }else return 3;//wrong user;

    }
    @ResponseBody
    @ApiOperation(value = "ajax检查用户是否存在",httpMethod = "POST")
    @RequestMapping(value = "/checkUser", method = RequestMethod.POST)
    public boolean checkUser(@RequestParam String userName) {
        if (userService.findUserByName(userName) != null) {
            return true;
        }
        return false;
    }
}
