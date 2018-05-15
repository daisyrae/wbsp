package org.sfg.wbsp.util;

import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

public class FileUploadUtil {
    //文件上传
    public static String uploadCompanyFile(MultipartFile file, HttpServletRequest request) {
        if(ObjectUtils.isEmpty(file)){
            return null;
        }
        String fileName = file.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        String path = request.getSession().getServletContext().getRealPath("company/");
        String newFileName = "company_" + new Date().getTime() + suffix;
        File tempFile = new File(path, newFileName);
        if (!tempFile.getParentFile().exists()) {
            tempFile.getParentFile().mkdir();
        }
        if (!tempFile.exists()) {
            try {
                tempFile.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            file.transferTo(tempFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "/company/" + newFileName;
    }
}
