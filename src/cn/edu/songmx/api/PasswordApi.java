package cn.edu.songmx.api;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   

public class PasswordApi {
	
	public static void main(String [] args) {
		sendLetter("15542221631","123");
	}
	
	public static void sendLetter(String phone,String password){
		String Url = "http://106.ihuyi.com/webservice/sms.php?method=Submit";
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url);
		client.getParams().setContentCharset("GBK");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");
	    String content = new String("您的密码是：" + password + "。请不要泄露给他人");
		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "C98187394"), //查看用户名 登录用户中心->验证码通知短信>产品总览->API接口信息->APIID
			    new NameValuePair("password", "d5cc68c6731412b2d506306d2db5a8cc"), //查看密码 登录用户中心->验证码通知短信>产品总览->API接口信息->APIKEY
			    new NameValuePair("mobile", phone), 
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);
		try {
			client.executeMethod(method);
			String SubmitResult =method.getResponseBodyAsString();
			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();
			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
			 if("2".equals(code)){
				System.out.println("短信提交成功");
			}
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}	
	}
}