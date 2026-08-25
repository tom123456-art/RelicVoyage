package com.example.service.impl;

import com.example.common.BusinessException;
import com.example.dto.ArtifactPageDTO;
import com.example.dto.ArtifactQueryDTO;
import com.example.mapper.ArtifactMapper;
import com.example.service.ArtifactImageService;
import com.example.service.ArtifactService;
import jakarta.annotation.PostConstruct;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class ArtifactServiceImpl implements ArtifactService {

    private final ArtifactMapper artifactMapper;
    private final ArtifactImageService artifactImageService;

    public ArtifactServiceImpl(ArtifactMapper artifactMapper, ArtifactImageService artifactImageService) {
        this.artifactMapper = artifactMapper;
        this.artifactImageService = artifactImageService;
    }

    @PostConstruct
    public void initArtifactImageUrls() {
        syncArtifactImageUrls();
    }

    @Override
    public List<ArtifactPageDTO> getArtifactPageList(ArtifactQueryDTO queryDTO) {
        List<ArtifactPageDTO> artifactPageList = artifactMapper.selectArtifactPageList(queryDTO);
        artifactPageList.forEach(artifactImageService::fillArtifactImageUrl);
        return artifactPageList;
    }

    @Override
    public ArtifactPageDTO getArtifactDetail(Long artifactId) {
        ArtifactPageDTO artifactPageDTO = artifactMapper.selectArtifactDetailById(artifactId);
        if (artifactPageDTO == null) {
            throw new BusinessException(404, "未找到对应文物");
        }
        artifactImageService.fillArtifactImageUrl(artifactPageDTO);
        return artifactPageDTO;
    }

    @Override
    public void syncArtifactImageUrls() {
        for (long id = 1; id <= ArtifactImageServiceImpl.size(); id++) {
            artifactMapper.updateArtifactImageUrl(id, artifactImageService.getArtifactImageUrl(id));
        }
    }
}
