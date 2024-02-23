package com.codejava.course.controller;

import com.codejava.course.model.dto.ImageUrlDto;
import com.codejava.course.model.entity.Image;
import com.codejava.course.repository.ImageRepository;
import com.codejava.course.utils.AppUtils;
import com.codejava.course.utils.ImageUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
public class ImageController {
    private final ImageRepository imageRepository;
    private final AppUtils appUtils;

    @PostMapping(value = "/api/v1/image", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity uploadImage(@RequestParam("image") MultipartFile file)
            throws IOException {
        if (this.isImage(file)) {
            Image image = imageRepository.save(Image.builder()
                    .name(file.getOriginalFilename())
                    .type(file.getContentType())
                    .data(ImageUtils.compressImage(file.getBytes())).build());

            String imageUrl = appUtils.getBaseUrlApi() + "/api/v1/image/get/" + image.getId();
            return new ResponseEntity(ImageUrlDto.builder()
                    .imageUrl(imageUrl)
                    .build(), HttpStatus.OK);
        } else {
            return new ResponseEntity("File is not an image", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(path = {"/api/v1/image/get/{id}"})
    public ResponseEntity getImageById(@PathVariable("id") UUID id) throws IOException {
        final Optional<Image> dbImage = imageRepository.findById(id);
        return ResponseEntity.ok()
                .contentType(MediaType.valueOf(dbImage.get().getType()))
                .body(ImageUtils.decompressImage(dbImage.get().getData()));
    }

    private boolean isImage(MultipartFile file) {
        try {
            BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
            return bufferedImage != null;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
