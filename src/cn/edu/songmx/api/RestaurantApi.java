package cn.edu.songmx.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;

public class RestaurantApi {
	private String key;

	public RestaurantApi(String key) {
		this.key = key;
	}

	public String search(double longitude, double latitude, int radius,
			String keywords, int page_size, int page_num, String extensions)
			throws Exception {
		String url = "https://restapi.amap.com/v3/place/around?key=" + key
				+ "&location=" + longitude + "," + latitude + "&keywords="
				+ URLEncoder.encode(keywords, "UTF-8") + "&radius=" + radius
				+ "&offset=" + page_size + "&page=" + page_num + "&extensions="
				+ extensions;
		HttpURLConnection conn = null;
		BufferedReader reader = null;
		try {
			URL apiUrl = new URL(url);
			conn = (HttpURLConnection) apiUrl.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			conn.setDoOutput(true);

			int responseCode = conn.getResponseCode();
			if (responseCode != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ responseCode);
			}
			reader = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
			return sb.toString();
		} catch (Exception e) {
			throw e;
		} finally {
			if (conn != null) {
				conn.disconnect();
			}
			if (reader != null) {
				try {
					reader.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static void main(String[] args) throws Exception {
		RestaurantApi api = new RestaurantApi(
				"331c018350a766eb3478eba7458674e5");
		double longitude = 123.4315;
		double latitude = 41.8057;
		int radius = 100000;
		String keywords = "050000";
		int page_size = 10; // 修改为3，表示每页返回3个餐厅信息
		int page_num = 1;
		String extensions = "all";

		String result = api.search(longitude, latitude, radius, keywords,
				page_size, page_num, extensions);
		// System.out.println(result); (可以注释掉这一行，不输出全部结果)

		JSONObject jsonResult = new JSONObject(result);
		JSONArray pois = jsonResult.getJSONArray("pois");
		if (pois.length() > 0) {
			for (int i = 0; i < pois.length(); i++) {
				JSONObject restaurant = pois.getJSONObject(i); // 获取每个餐厅的信息

				String restaurantName = restaurant.getString("name");
				String restaurantAddress = restaurant.getString("address");
				String restaurantTel = restaurant.getString("tel");
				double restaurantRating = restaurant.getJSONObject("biz_ext")
						.getDouble("rating");

				System.out.println("餐厅名称: " + restaurantName);
				System.out.println("餐厅地址: " + restaurantAddress);
				System.out.println("联系电话: " + restaurantTel);
				System.out.println("评分: " + restaurantRating);

				JSONArray photos = restaurant.getJSONArray("photos");
				if (photos.length() > 0) { // 只处理有图片的餐厅
					JSONObject photo = photos.getJSONObject(0); // 获取第一张图片
					String photoUrl = photo.getString("url");
					System.out.println("图片地址: " + photoUrl);
				}

				System.out.println("--------------------");
			}
		} else {
			System.out.println("没有找到符合条件的餐厅。");
		}
	}
}
