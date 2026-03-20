package com.tianji.common.utils;

import cn.hutool.core.convert.impl.TemporalAccessorConverter;

import java.time.temporal.TemporalAccessor;

public class zkTemporalConverter extends TemporalAccessorConverter {
    public zkTemporalConverter(Class<?> targetType) {
        super(targetType);
    }

    public zkTemporalConverter(Class<?> targetType, String format) {
        super(targetType, format);
    }

    @Override
    protected TemporalAccessor convertInternal(Object value) {
        if (value instanceof String) {
            String val = value.toString();
            try {
                return super.convertInternal(Long.parseLong(val));
            } catch (NumberFormatException e) {
                return super.convertInternal(value);
            }
        }
        return super.convertInternal(value);
    }
}
