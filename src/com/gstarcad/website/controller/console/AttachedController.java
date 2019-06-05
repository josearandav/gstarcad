package com.gstarcad.website.controller.console;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gstarcad.website.util.Config;

@Controller  
public class AttachedController {  
      
    private static final Logger LOGGER = Logger.getLogger(AttachedController.class);  
    
    
    @RequestMapping("/attached/{fileType}/{uploadTime}/{fileName}.{suffix}")  
    public void attached(HttpServletRequest request, HttpServletResponse response,   
            @PathVariable String fileType,  
            @PathVariable String uploadTime,  
            @PathVariable String suffix,  
            @PathVariable String fileName) {  
            // Get your file stream from wherever.
    	
    	 	File downloadFile = new File(Config.config.getString("upload.url") + "/"+fileType + "/" + uploadTime + "/" + fileName + "." + suffix);  
         
    	 
            String fullPath = downloadFile.getAbsolutePath();
           // File downloadFile = new File(fullPath);

            ServletContext context = request.getServletContext();
            // get MIME type of the file
            String mimeType = context.getMimeType(fullPath);
            if (mimeType == null) {
                // set to binary type if MIME mapping not found
                mimeType = "application/octet-stream";
            }

            // set content attributes for the response
            response.setContentType(mimeType);
            // response.setContentLength((int) downloadFile.length());

            // set headers for the response
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
            response.setHeader(headerKey, headerValue);
            // 解析断点续传相关信息
            response.setHeader("Accept-Ranges", "bytes");
            long downloadSize = downloadFile.length();
            long fromPos = 0, toPos = 0;
            if (request.getHeader("Range") == null) {
                response.setHeader("Content-Length", downloadSize + "");
            } else {
                // 若客户端传来Range，说明之前下载了一部分，设置206状态(SC_PARTIAL_CONTENT)
                response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
                String range = request.getHeader("Range");
                String bytes = range.replaceAll("bytes=", "");
                String[] ary = bytes.split("-");
                fromPos = Long.parseLong(ary[0]);
                if (ary.length == 2) {
                    toPos = Long.parseLong(ary[1]);
                }
                int size;
                if (toPos > fromPos) {
                    size = (int) (toPos - fromPos);
                } else {
                    size = (int) (downloadSize - fromPos);
                }
                response.setHeader("Content-Length", size + "");
                downloadSize = size;
            }
            // Copy the stream to the response's output stream.
            RandomAccessFile in = null;
            OutputStream out = null;
            try {
                in = new RandomAccessFile(downloadFile, "rw");
                // 设置下载起始位置
                if (fromPos > 0) {
                    in.seek(fromPos);
                }
                // 缓冲区大小
                int bufLen = (int) (downloadSize < 2048 ? downloadSize : 2048);
                byte[] buffer = new byte[bufLen];
                int num;
                int count = 0; // 当前写到客户端的大小
                out = response.getOutputStream();
                while ((num = in.read(buffer)) != -1) {
                    out.write(buffer, 0, num);
                    count += num;
                    //处理最后一段，计算不满缓冲区的大小
                    if (downloadSize - count < bufLen) {
                        bufLen = (int) (downloadSize-count);
                        if(bufLen==0){
                            break;
                        }
                        buffer = new byte[bufLen];
                    }
                }
                response.flushBuffer();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (null != out) {
                    try {
                        out.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (null != in) {
                    try {
                        in.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
    }
      
    @RequestMapping("/attached1/{fileType}/{uploadTime}/{fileName}.{suffix}")  
    public void attached1(HttpServletRequest request, HttpServletResponse response,   
            @PathVariable String fileType,  
            @PathVariable String uploadTime,  
            @PathVariable String suffix,  
            @PathVariable String fileName) {  
        //根据suffix设置响应ContentType  
        //response.setContentType("text/html; charset=UTF-8");  
          
        InputStream is = null;  
        OutputStream os = null;  
        try {  
            File file = new File(Config.config.getString("upload.url") + "/"+fileType + "/" + uploadTime + "/" + fileName + "." + suffix);  
            is = new FileInputStream(file);  
            byte[] buffer = new byte[is.available()];  
            is.read(buffer);  
              
            os = new BufferedOutputStream(response.getOutputStream());  
            os.write(buffer);  
            os.flush();  
        } catch (Exception e) {  
            //判断suffix  
            //图片请求可以在此显示一个默认图片  
            //file显示文件已损坏等错误提示...  
            LOGGER.error("读取文件失败", e);  
        } finally {  
            if (is != null) {  
                try {  
                    is.close();  
                } catch (IOException e) {  
                    LOGGER.error("读取文件失败", e);  
                }  
                  
                if (os != null) {  
                    try {  
                        os.close();  
                    } catch (IOException e) {  
                        LOGGER.error("读取文件失败", e);  
                    }  
                }  
            }  
        }  
          
    }  
}  