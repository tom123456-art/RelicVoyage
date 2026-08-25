package com.example.service;

import com.example.dto.ArtifactPageDTO;
import com.example.dto.ArtifactQueryDTO;
import java.util.List;

public interface ArtifactService {

    List<ArtifactPageDTO> getArtifactPageList(ArtifactQueryDTO queryDTO);

    ArtifactPageDTO getArtifactDetail(Long artifactId);

    void syncArtifactImageUrls();
}
