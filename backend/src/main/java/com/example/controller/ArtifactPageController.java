package com.example.controller;

import com.example.common.Result;
import com.example.dto.ArtifactPageDTO;
import com.example.dto.ArtifactQueryDTO;
import com.example.service.ArtifactService;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/artifacts")
public class ArtifactPageController {

    private final ArtifactService artifactService;

    public ArtifactPageController(ArtifactService artifactService) {
        this.artifactService = artifactService;
    }

    @GetMapping("/search")
    public Result<List<ArtifactPageDTO>> getArtifactPageList(ArtifactQueryDTO queryDTO) {
        return Result.success(artifactService.getArtifactPageList(queryDTO));
    }

    @GetMapping("/{id}")
    public Result<ArtifactPageDTO> getArtifactDetail(@PathVariable("id") Long id) {
        return Result.success(artifactService.getArtifactDetail(id));
    }
}
