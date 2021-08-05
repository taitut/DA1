package com.fpoly.services.Impl;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.auth.Credentials;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

@Service
public class FileServices {

	private String uploadFile(File file, String fileName) throws IOException {
		String DUrl = "https://firebasestorage.googleapis.com/v0/b/assignment-img.appspot.com/o/%s?alt=media";
        BlobId blobId = BlobId.of("assignment-img.appspot.com", fileName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId).setContentType("media").build();
        Credentials credentials = GoogleCredentials.fromStream(new FileInputStream("/assignment-img-firebase-adminsdk-kfpfg-edb6dd7641.json"));
        Storage storage = StorageOptions.newBuilder().setCredentials(credentials).build().getService();
        storage.create(blobInfo, Files.readAllBytes(file.toPath()));
        return String.format(DUrl, URLEncoder.encode(fileName, StandardCharsets.UTF_8));
    }
	
	private File convertToFile(MultipartFile multipartFile, String fileName) throws IOException {
	    File tempFile = new File(fileName);
	    try (FileOutputStream fos = new FileOutputStream(tempFile)) {
	        fos.write(multipartFile.getBytes());
	        fos.close();
	    }
	    return tempFile;
	}

	private String getExtension(String fileName) {
	    return fileName.substring(fileName.lastIndexOf("."));
	}
	
	public String upload(MultipartFile multipartFile) {

        try {
            String fileName = multipartFile.getOriginalFilename();                        // to get original file name
           fileName = UUID.randomUUID().toString().concat(this.getExtension(fileName));  // to generated random string values for file name. 

            File file = this.convertToFile(multipartFile, fileName);                      // to convert multipartFile to File
           String TEMP_URL = this.uploadFile(file, fileName);                                   // to get uploaded file link
            file.delete();                                                                // to delete the copy of uploaded file stored in the project folder
            return TEMP_URL ;                   // Your customized response
        } catch (Exception e) {
            e.printStackTrace();
            return "500"+ e+ "Unsuccessfully Uploaded!";
        }

    }
    
//    public Object download(String fileName) throws IOException {
//        String destFileName = UUID.randomUUID().toString().concat(this.getExtension(fileName));     // to set random strinh for destination file name
//        String destFilePath = "D:\\New folder\\" + destFileName;                                    // to set destination file path
//        
//        ////////////////////////////////   Download  ////////////////////////////////////////////////////////////////////////
//        Credentials credentials = GoogleCredentials.fromStream(new FileInputStream("path of JSON with genarated private key"));
//        Storage storage = StorageOptions.newBuilder().setCredentials(credentials).build().getService();
//        Blob blob = storage.get(BlobId.of("your bucket name", fileName));
//        blob.downloadTo(Paths.get(destFilePath));
//        return  "Successfully Downloaded!";
//    }

}

