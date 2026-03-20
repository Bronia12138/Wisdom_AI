package com.tianji.pay.third;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "zk.pay")
public class CommonPayProperties {
    private String notifyHost;
}
