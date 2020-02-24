package controller;

import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import service.ForumService;
import service.UserService;
import util.UploadPictureUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class RegisterController {
    @Autowired
    private UserService userService;
    @Autowired
    private ForumService forumService;
    @ApiOperation(value = "返回注册页面",httpMethod = "GET")
    @RequestMapping(value = "/user/register",method = RequestMethod.GET)
    public String reg() {
        return "register";

    }
    @ApiOperation(value = "注册跳转",httpMethod = "POST")
    @RequestMapping(value = "/registerPro", method = RequestMethod.POST)
    public String register(@RequestParam String username, @RequestParam String password) {
        userService.register(username,password);
        return "login";
    }

    @RequestMapping(value = "/user/detail/{userId}",method = RequestMethod.GET)
    @ApiOperation(value = "返回个人页面信息",httpMethod = "GET")
    public String userDetail(@PathVariable int userId, Model model) {
        model.addAttribute("cur_user", userService.selectByUserId(userId));
        model.addAttribute("info", userService.findById(userId));
        model.addAttribute("topicInfo", forumService.selectByuserId(userId));
        return "userInfo";
    }

    @ResponseBody
    @ApiOperation(value = "上传图片接口",httpMethod = "POST")
    @RequestMapping(value = "/upload/usericon", method = RequestMethod.POST)
    public Object uploadIcon(HttpServletRequest request, MultipartFile file,
                             @RequestParam String id) throws IOException {

        String path0 = request.getSession().getServletContext().getRealPath("/");
        int begin = path0.indexOf("ROOT");
        path0 = path0.substring(0, begin);


        String path = UploadPictureUtil.addMutiparFile(file, path0);
//                request.getSession().getServletContext().getRealPath("/"));

        // path=path.substring(0, begin);
        System.out.println("修改后的路径是：" + path0);


        Map result=new HashMap();
        result.put("path",path);
        result.put("id", id);
        //保存图片路径到数据库
        System.out.println("request获取到的目录是：" +
                request.getSession().getServletContext().getRealPath("/"));
        userService.updateAddressOfPic(Integer.valueOf(id), path);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        session.setAttribute("userDetail", userService.findById(user.getUserId()));


        return result;

    }


    /*
        @RequestMapping(value="updatePersonalById")
        public @ResponseBody String updatePersonal(@RequestParam("file") MultipartFile file,@ModelAttribute UserInfo ui,HttpServletRequest request) throws IllegalStateException, IOException{
                     String oldName = file.getOriginalFilename();
                     String path = request.getServletContext().getRealPath("/upload/");
                     String fileName = changeName(oldName);
                    String rappendix = "upload/" + fileName;
                    fileName = path + "/" + fileName;
                    File file1 = new File(fileName);
                    file.transferTo(file1);
                String str = "{\"code\": 0,\"msg\": \"\",\"data\": {\"src\":\"" + rappendix + "\"}}";
                    return str;
                }
    */
    @ResponseBody
    @RequestMapping(value = "/uploadInterface", method = RequestMethod.POST)
    public String upload(HttpServletRequest request, @RequestParam("file") CommonsMultipartFile file
    )
            throws Exception {


        String path0 = request.getSession().getServletContext().getRealPath("/");
        int begin = path0.indexOf("ROOT");
        path0 = path0.substring(0, begin);


        String path = UploadPictureUtil.addMutiparFile(file, path0);
        // FastDFSClient client = FastDFSClient.getClient();//开启服务
        //  String extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
        //  String path1 = client.uploadFile(file.getBytes(),extName,null);//获取路径
        // logger.debug("上传文件demo===============================,文件服务器路径"+path);
        Map<String, Object> map = new HashMap<String, Object>();
        Map<String, Object> map2 = new HashMap<String, Object>();
        map.put("code", 0);//0表示成功，1失败
        map.put("msg", "上传成功");//提示消息
        map.put("data", map2);
        map2.put("src", path);//图片url
        map2.put("title", "picName");//图片名称，这个会显示在输入框里

        //将图片路径存入数据库；

        //经测试，图片不用再单独存入数据库了，因为图片名称是独一无二的，直接以文本地址的形式存入
        //post中，现实的时候会根据地址来显示
        //还需要设置一下图片的大小;
        //直接再html里面设置所有图片的大小；

        //  userService.storePostPic(post_id,path);


        String result = new JSONObject(map).toString();
        return result;
    }

}
