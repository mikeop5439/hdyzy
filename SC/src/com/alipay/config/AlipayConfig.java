package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016090900469784";
	
	// 商户私钥，您的PKCS8格式RSA2私钥    
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCRqcG4GFUWANZyQQ/U8ZS0WBmOulxA0NbfJdfOXImnWf+18h/9DfG6Cb8f70xJYvABnTITBly5h9yxxMI06Y/GP450I24LdPCXueYGnJ7W+o4gQKZTNShWfHI9SW6NkpA5/6/BhxQd2PeLHaA7wKkrYnwX0YvbHL5uiYJK6pU/btiooN5vXAL1xeTM8b16RkRxqRfjfT4hqZmj/xUL9XkGwkdtdjdnZp1GSXKCiyUEkiM6yXiseWQSIxOYHs0K5hLokNfXPEJey2f8sdnKFkIjUNIpn3v4MmNplPNhqjCgUAJbQGhK4mQbfvDwMhRTa4+XkmS4jAEDanjuDZ7DgwnBAgMBAAECggEAL6aHz7BuDS+i92dfRXrt+X0khzNhwHZRBFi92y0cftmLNDsLyd2I6SINGuZOX2d1OiHxYpXfOXY/dQv3uBV7yg+6izWX5zmPByNyI1GTCKKYYeakQm4OTxSQzom6F6gNdFu3ZCjLJOR4PlMnusRQ0vd5vtT22mvxw/lJ3TYWMtSPIXuq3lFwxfcujXNEQi5AjlAr1mOhvb/HL7J6JZzs2u7xUeyqgg4KUR40I98nHZJhVG1AaBoysdPa0oNqx/uliWvaqfj+SY6dzAlpt0yvUPrTXr+RyLcgR0HPPwQsR47Ed9m+k7HHypl6JgCBRUnZpGaS9rHJkDDapbCyt/1h0QKBgQD1YSxm1KxGJm9GK/oASa9WPUtPNwZVNz08pqkJ6WXZc4QplZYYdGEd1SIf99vZofJWvmh5iaAPBewrPYaItLXIpZLUeeKf1gXu0zabW8tGwjXPP/Dgb+tw4Swi6S0Vzt127NP5/94g4fTnJP+AOuu/Q2FzlzRxZbRNbPolZnMuhQKBgQCX97dhKuR6rTZA9QiUQE9Ar2uMxYvvpVPKK81PhOrAF4CBNGfDi556yH6nnpMgS0MROD/Wv3hNodOr3nqK6g8fxnrzBQonST9HGSHDFdF9A2RZEjjUGs3wV9U+RNbojOT5O2jhGV/OrW8XO8GXQzLFr8NVG5n5E/T4BUsEnxsJDQKBgQC/Kw+epX35wSPb9ZL1+nIhq+sqMeI7LagFwonbcPyqZvbGNwYS00h+J3hIk5+ydBsLPZjDZ1dNnP2bynkvtCoTwfsckkDe6a0BnYfjjaZW4CNv7Y7KLCevb54lLKi1Xs7nQib7lD4IPEHCeu6bhkv4XJRlq51t4yCPWaGg1apSyQKBgDBo5AzbCg+eT/MfW41Gcziq6PreDzbXFrsHew7Cy7lHg1Mla4yaVHDOn7IrzLhz4TiCD6wMMHmifHh6ldTcvNaldpMl3tcm+TZf5iZsM+C8DOJm8J14sHPItxBwA3nvMB3I9B8I40FGdGYVThUufeUFmZbqBQGYfufnX79oI8edAoGAdH9y2MQojodDlDYRz9K/G1DqkTVHEE3/WyLE06BlgmboC2UV4tqyZh45LJhQjOXHP+oT+d9dqQTECFolze17qtI1y/2BfY/AvAdhc8fnepCSoU7v8ICqJvGrE5nDxANP2TXXlUpDEvm474NmJGgAmO8YoMP1Cq47oJwi9wKVm1Y=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtfcucgY1OHoMktC1nXXQzvlbNiF0qG+wJa/TrbtFaeANOYCcGYHnQj0Hj4HLAl9z06e9P4mB/PKbXVFpsYIZO++7S08FFIM2JpnVSnTpa7Kt+kYF7meBAXjceSJ5ZbsI3N+oD9rNr90KTThnC2k0Wbg+qLHlkBEEJr3qVi0fh2BSxmGq+I2jjArpmLVUUIP+OL4E6b1fkApLmRo91oL9ZyEAu22g+i9hwCYAHzFsKSFxfoakbKs0zV5136THC4yok2xCjF2Bw5/DA4Meyw8gRfuelmIaoAjVye12OSrdwe/VqKs/hJlvXj2oe7P3sruFfF0o8VWJHmz0B7y12mT/JwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 shoppingcart/playorderpay
	public static String notify_url = "http://localhost:8080/gzyz/shoppingcart/playorderpay.action";
	
	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 
	/*public static String return_url = "http://localhost:8080/gzyz/JSP/PAY/return_url.jsp";*/ 
	public static String return_url = "http://localhost:8080/gzyz/shoppingcart/playorderpay.action";
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	/*public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";*/
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
									   
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

