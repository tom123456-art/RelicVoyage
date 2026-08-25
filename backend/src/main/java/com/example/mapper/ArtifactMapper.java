package com.example.mapper;

import com.example.dto.ArtifactPageDTO;
import com.example.dto.ArtifactQueryDTO;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArtifactMapper {

    List<ArtifactPageDTO> selectArtifactPageList(ArtifactQueryDTO queryDTO);

    ArtifactPageDTO selectArtifactDetailById(@Param("id") Long id);

    int updateArtifactImageUrl(@Param("id") Long id, @Param("imageUrl") String imageUrl);
}
