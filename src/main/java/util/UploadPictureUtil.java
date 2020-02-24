package util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * UUID含义是通用唯一识别码 (Universally Unique Identifier)，
 * 这 是一个软件建构的标准，也是被开源软件基金会 (Open Software Foundation, OSF) 的
 * 组织在分布式计算环境 (Distributed Computing Environment, DCE) 领域的一部份。UUID 的目的，
 * 是让分布式系统中的所有元素，都能有唯一的辨识资讯，而不需要透过中央控制端来做辨识资讯的指定。
 * 如此一来，每个人都可以建立不与其它人冲突的 UUID。在这样的情况下，就不需考虑数据库建立时的名称重复问题。
 * 简单来说就是为为一个上传的图片取一个唯一的名字，方便调用
 */

public class UploadPictureUtil {
    public  static  String addMutiparFile(MultipartFile file, String pathAppend) throws IOException {
        String uuid = UUID.randomUUID().toString();	//获取UUID并转化为String对象

        uuid = uuid.replace("-", "");
        //因为UUID本身为32位只是生成时多了“-”，所以将它们去掉就可

        System.out.println("上传的文件"+file);
        if (file.isEmpty()){
            return null;
        }else {
            // 判断上传的文件是否为空
            String path=null;// 文件路径
            String type=null;// 文件类型
            String fileName=file.getOriginalFilename();// 文件原名称
            System.out.println("上传的文件原名称:"+fileName);


            String contentType = file.getContentType();
            String originalFileName = file.getOriginalFilename();// 文件原名称
            String fileSuffix = originalFileName.substring(originalFileName.lastIndexOf("."));
            // 判断文件类型
            type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1,
                    fileName.length()) : null;
            //获取图片全路径
            String realPath ="userPic\\";
            String urlPrefix ="http://localhost:8080/";
            System.out.println(realPath);

            realPath = pathAppend+realPath;


            File dir = new File(realPath);
            if (dir.exists()) {// 判断目录是否存在
                System.out.println("创建目录失败，目标目录已存在！");
            }else {
                dir.mkdirs();
            }

            String newFileName = uuid;
            // 设置存放图片文件的路径
            path=realPath+newFileName+fileSuffix;
            System.out.println("存放图片文件的路径:"+path);
            // 转存文件到指定的路径
            file.transferTo(new File(path));
            System.out.println("文件成功上传到指定目录下");

            //返回的是上传成功后的文件路径；
            return "/userPic/"+uuid+fileSuffix;

        }

    }

}
