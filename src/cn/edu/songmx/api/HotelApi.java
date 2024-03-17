package cn.edu.songmx.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;

public class HotelApi {
	private String key;

	public HotelApi(String key) {
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
	    HotelApi api = new HotelApi("331c018350a766eb3478eba7458674e5");
	    double longitude = 114.06667;
	    double latitude = 22.61667;
	    int radius = 1000;
	    String keywords = "宾馆";
	    int page_size = 3;
	    int page_num = 1;
	    String extensions = "all";

	    String result = api.search(longitude, latitude, radius, keywords, page_size, page_num, extensions);

	    JSONObject jsonResult = new JSONObject(result);
	    JSONArray pois = jsonResult.getJSONArray("pois");
	    
	    if (pois.length() > 0) {
	        for (int i = 0; i < pois.length(); i++) {
	            JSONObject hotel = pois.getJSONObject(i);




	            System.out.println(hotel);
	        }
	    } else {
	        System.out.println("没有找到符合条件的宾馆。");
	    }
	}
}
