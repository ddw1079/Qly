package com.qly.util;

import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;

public class CloudinaryUploader {
	private final Cloudinary cloudinary;

	public CloudinaryUploader() {
		Map<String, String> config = new HashMap<>();
		config.put("cloud_name", "dcgtecuzv");
		config.put("api_key", "742878728682835");
		config.put("api_secret", "36WNMT1bCycbHb6L7qBecNybYuE");

		cloudinary = new Cloudinary(config);
	}

	@SuppressWarnings("unchecked")
	public String upload(MultipartFile multipartFile) throws Exception {
		File tempFile = File.createTempFile("upload_", multipartFile.getOriginalFilename());
		multipartFile.transferTo(tempFile);

		// Map uploadResult = cloudinary.uploader().upload(tempFile,
		// ObjectUtils.emptyMap());
		Map<String, Object> uploadResult = (Map<String, Object>) cloudinary.uploader().upload(tempFile,
				Collections.emptyMap());

		tempFile.delete();

		return (String) uploadResult.get("secure_url");
	}
}
