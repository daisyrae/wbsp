package org.sfg.wbsp.util;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import java.security.Key;
import java.security.SecureRandom;

public class PasswordUtil {

    /**
     * 定义使用的算法为:PBEWITHMD5andDES算法
     */
    private static final String ALGORITHM = "PBEWithMD5AndDES";

    /**
     * 定义加密解密私钥
     */
    private static final String KEY_LESS = "WBSP_AUTH_TOKEN";

    /**
     * 定义迭代次数为1000次
     */
    private static final int ITERATIONCOUNT = 1000;

    /**
     * 获取加密算法中使用的盐值,解密中使用的盐值必须与加密中使用的相同才能完成操作，盐长度必须为8字节
     *
     * @return byte[] 盐值
     */
    private static byte[] getSalt() {
        //实例化安全随机数
        SecureRandom random = new SecureRandom();
        //产出盐
        return random.generateSeed(8);
    }

    /**
     * 根据PBE密码生成一把密钥
     * @return Key PBE算法密钥
     */
    private static Key getPBEKey() throws Exception {
        // 实例化使用的算法
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);
        // 设置PBE密钥参数
        PBEKeySpec keySpec = new PBEKeySpec(KEY_LESS.toCharArray());
        // 生成密钥
        return keyFactory.generateSecret(keySpec);
    }

    /**
     * 加密明文字符串
     *
     * @param plaintext 待加密的明文字符串
     * @return 加密后的密文字符串
     */
    public static String encrypt(String plaintext) {
        byte encipheredData[] = new byte[0];
        try {
            Key key = getPBEKey();
            byte[] salt = getSalt();
            PBEParameterSpec parameterSpec = new PBEParameterSpec(salt, ITERATIONCOUNT);
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, key, parameterSpec);
            encipheredData = cipher.doFinal(plaintext.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bytesToHexString(encipheredData);
    }

    /**
     * 解密密文字符串
     *
     * @param ciphertext 待解密的密文字符串
     * @return 解密后的明文字符串
     */
    public static String decrypt(String ciphertext) {
        byte[] passDec = new byte[0];
        try {
            Key key = getPBEKey();
            byte[] salt = getSalt();
            PBEParameterSpec parameterSpec = new PBEParameterSpec(salt, ITERATIONCOUNT);
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, key, parameterSpec);
            passDec = cipher.doFinal(hexStringToBytes(ciphertext));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new String(passDec);
    }

    /**
     * 将字节数组转换为十六进制字符串
     *
     * @param src 字节数组
     * @return 字符串
     */
    private static String bytesToHexString(byte[] src) {
        StringBuilder stringBuilder = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        for (byte aSrc : src) {
            int v = aSrc & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }

    /**
     * 将十六进制字符串转换为字节数组
     *
     * @param hexString 十六进制字符串
     * @return 字节数组
     */
    private static byte[] hexStringToBytes(String hexString) {
        if (hexString == null || hexString.equals("")) {
            return null;
        }
        hexString = hexString.toUpperCase();
        int length = hexString.length() / 2;
        char[] hexChars = hexString.toCharArray();
        byte[] d = new byte[length];
        for (int i = 0; i < length; i++) {
            int pos = i * 2;
            d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));
        }
        return d;
    }

    /**
     * 位移运算
     *
     * @param c 字符
     * @return 字节
     */
    private static byte charToByte(char c) {
        return (byte) "0123456789ABCDEF".indexOf(c);
    }
}
