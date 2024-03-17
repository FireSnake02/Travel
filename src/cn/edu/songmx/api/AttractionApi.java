package cn.edu.songmx.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AttractionApi {
	private static final String PLACE_API_URL = "https://restapi.amap.com/v3/place/text";
	private String apiKey;

	public AttractionApi(String apiKey) {
		this.apiKey = apiKey;
	}

	public String searchSightseeingByCategory(String category,
			double longitude, double latitude, int radius) throws IOException {
		String url = PLACE_API_URL + "?key=" + apiKey + "&types=" + category
				+ "&location=" + longitude + "," + latitude + "&radius="
				+ radius;
		HttpURLConnection connection = null;
		BufferedReader reader = null;

		try {
			URL apiUrl = new URL(url);
			connection = (HttpURLConnection) apiUrl.openConnection();
			connection.setRequestMethod("GET");
			connection.setConnectTimeout(5000); // 设置连接超时时间
			connection.setReadTimeout(5000); // 设置读取超时时间

			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				reader = new BufferedReader(new InputStreamReader(
						connection.getInputStream(), StandardCharsets.UTF_8));

				StringBuilder responseBuilder = new StringBuilder();
				String line;
				while ((line = reader.readLine()) != null) {
					responseBuilder.append(line);
				}
				return responseBuilder.toString();
			} else {
				throw new IOException("请求失败，HTTP错误码: " + responseCode);
			}
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
			if (reader != null) {
				reader.close();
			}
		}
	}

	public static void main(String[] args) {
		String apiKey = "331c018350a766eb3478eba7458674e5";
		String category = "110206"; // 历史古迹（具体类别编码可以参考高德地图API的分类编码表）
		double longitude = 116.3975;
		double latitude = 39.9085;
		int radius = 5000;
		int numberOfResults = 3; // 返回的景点信息数量

		try {
			AttractionApi sightseeingApi = new AttractionApi(apiKey);
			String resultJson = sightseeingApi.searchSightseeingByCategory(
					category, longitude, latitude, radius);

			JSONObject jsonObject = new JSONObject(resultJson);
			JSONArray poisArray = jsonObject.getJSONArray("pois");

			int counter = 0;
			if (poisArray.length() > 0) {
				for (int i = 0; i < poisArray.length(); i++) {
					if (counter >= numberOfResults) {
						break;
					}

					JSONObject poiObject = poisArray.getJSONObject(i);

					String sightseeingName = poiObject.getString("name");
					String sightseeingAddress = poiObject.getString("address");

					String sightseeingOpenTime = poiObject
							.optString("opentime"); // 开放时间
					String sightseeingTicketPrice = poiObject
							.optString("price"); // 门票价格

					System.out.println("景点名称: " + sightseeingName);
					System.out.println("开放时间: " + sightseeingOpenTime);
					System.out.println("门票价格: " + sightseeingTicketPrice);
					System.out.println("地址: " + sightseeingAddress);

					JSONArray photosArray = poiObject.getJSONArray("photos");
					if (photosArray.length() > 0) {
						JSONObject photoObject = photosArray.getJSONObject(0);
						String photoUrl = photoObject.optString("url"); // 图片URL
						System.out.println("图片地址： " + photoUrl);
					}

					System.out.println("--------------------");

					counter++;
				}
			} else {
				System.out.println("没有找到符合条件的景点。");
			}
		} catch (IOException | JSONException e) {
			e.printStackTrace();
		}
	}
}
