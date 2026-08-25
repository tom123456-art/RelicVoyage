package com.example.service;

import com.example.dto.ArtifactPageDTO;

public interface ArtifactImageService {

    String getArtifactImageUrl(Long artifactId);

    void fillArtifactImageUrl(ArtifactPageDTO artifactPageDTO);
}
