package com.tianji.message.thirdparty.ali;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
@ConfigurationProperties(prefix = "zk.sms.ali")
public class AliProperties {
    private String accessId;
    private String accessSecret;
}
