package com.example.service.impl;

import com.example.dto.ArtifactPageDTO;
import com.example.service.ArtifactImageService;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class ArtifactImageServiceImpl implements ArtifactImageService {

    private static final List<String> FILE_NAMES = List.of(
        "清明上河图卷.jpg",
        "千里江山图卷.jpg",
        "五牛图卷.jpg",
        "大圣遗音琴.jpg",
        "汝窑天青釉弦纹三足樽.jpg",
        "后母戊鼎.jpg",
        "四羊方尊.jpg",
        "人面鱼纹彩陶盆.jpg",
        "妇好鸮尊.jpg",
        "鹰形陶鼎.jpg",
        "马王堆一号汉墓T形帛画.jpg",
        "素纱单衣.jpg",
        "黑地彩绘漆棺.jpg",
        "西汉奏乐木俑.jpg",
        "云纹漆案.jpg",
        "青铜大立人像.jpg",
        "青铜纵目面具.jpg",
        "青铜神树.jpg",
        "戴金面罩青铜人头像.jpg",
        "肩扛象牙人形纹玉璋.jpg",
        "青釉兽首鼎.jpg",
        "彩色釉陶镇墓兽.jpg",
        "青釉琮式瓶.jpg",
        "青花人物图盘.jpg",
        "珐琅彩竹菊鹌鹑图瓶.jpg",
        "三彩载乐骆驼俑.jpg",
        "镶金兽首玛瑙杯.jpg",
        "鎏金舞马衔杯纹银壶.jpg",
        "多友鼎.jpg",
        "五祀卫鼎.jpg"
    );

    @Override
    public String getArtifactImageUrl(Long artifactId) {
        if (artifactId == null) {
            return null;
        }

        int index = Math.toIntExact(artifactId - 1);
        if (index < 0 || index >= FILE_NAMES.size()) {
            return null;
        }

        return "/relics/" + FILE_NAMES.get(index);
    }

    @Override
    public void fillArtifactImageUrl(ArtifactPageDTO artifactPageDTO) {
        if (artifactPageDTO == null) {
            return;
        }

        if (StringUtils.hasText(artifactPageDTO.getImageUrl())) {
            return;
        }

        artifactPageDTO.setImageUrl(getArtifactImageUrl(artifactPageDTO.getId()));
    }

    public static int size() {
        return FILE_NAMES.size();
    }
}
