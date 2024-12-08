package vn.ThangKa.LapTopShop.service;

import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Service
public class UploadFile {

    @Autowired
    private ServletContext servletContext;


    public  String uploadFileHandler(MultipartFile file, String directory) {

        if (file.isEmpty()) {
            return "";
        }
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName = "";
            try {
                byte[] bytes = file.getBytes();

                File dir = new File(rootPath + File.separator + directory);
                if (!dir.exists())
                    dir.mkdirs();
                finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + finalName);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
            } catch (Exception e) {
                return "You failed to upload " + file.getOriginalFilename() + " => " + e.getMessage();
            }

        return finalName;
    }
//    public  String uploadFileHandler(MultipartFile[] files, String directory) {
//        String rootPath = this.servletContext.getRealPath("/resources/images");
//
//        for (int i = 0; i < files.length; i++) {
//            MultipartFile file = files[i];
//            try {
//                String finalName = "";
//                byte[] bytes = file.getBytes();
//
//                File dir = new File(rootPath + File.separator + directory);
//                if (!dir.exists())
//                    dir.mkdirs();
//                finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
//
//                // Create the file on server
//                File serverFile = new File(dir.getAbsolutePath()
//                        + File.separator + finalName);
//                BufferedOutputStream stream = new BufferedOutputStream(
//                        new FileOutputStream(serverFile));
//                stream.write(bytes);
//                stream.close();
//            } catch (Exception e) {
//                return "You failed to upload " + file.getOriginalFilename() + " => " + e.getMessage();
//            }
//
//        }
//        return "Successfully uploaded " + files.length + " files";
//    }
}


