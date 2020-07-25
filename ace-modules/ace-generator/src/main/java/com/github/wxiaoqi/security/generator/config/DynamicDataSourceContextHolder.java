package com.github.wxiaoqi.security.generator.config;

/**
 * @author laogandie`
 * @create 2020/1/28.
 */
/**
 * 通过 ThreadLocal 获取和设置线程安全的数据源 key
 */
public class DynamicDataSourceContextHolder {

    /**
     * Maintain variable for every thread, to avoid effect other thread
     */
    private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>() {
        /**
         * 将 default 数据源的 key 作为默认数据源的 key
         */
//        @Override
//        protected String initialValue() {
//            return "default";
//        }
    };


    /**
     * To switch DataSource
     *
     * @param key the key
     */
    public static synchronized void setDataSourceKey(String key) {
        contextHolder.set(key);
    }

    /**
     * Get current DataSource
     *
     * @return data source key
     */
    public static String getDataSourceKey() {
        return contextHolder.get();
    }

    /**
     * To set DataSource as default
     */
    public static void clearDataSourceKey() {
        contextHolder.remove();
    }
}