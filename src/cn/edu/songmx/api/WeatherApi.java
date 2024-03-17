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

public class WeatherApi {
    private static final String WEATHER_API_URL = "https://restapi.amap.com/v3/weather/weatherInfo";
    private String apiKey;

    public WeatherApi(String apiKey) {
        this.apiKey = apiKey;
    }

    public String getWeatherJson(String city) throws IOException {
        String url = WEATHER_API_URL + "?key=" + apiKey + "&city=" + city;
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
                reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8));

                StringBuilder responseBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    responseBuilder.append(line);
                }
                System.out.println(responseBuilder);
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

    public Weather parseWeather(String weatherJson) throws JSONException {
        JSONObject jsonObject = new JSONObject(weatherJson);
        JSONArray livesArray = jsonObject.getJSONArray("lives");
        if (livesArray.length() > 0) {
            JSONObject liveObject = livesArray.getJSONObject(0);

            String city = liveObject.getString("city");
            String weather = liveObject.getString("weather");
            String temperature = liveObject.getString("temperature");
            String windPower = liveObject.getString("windpower");
            String windDirection = liveObject.getString("winddirection");
            String humidity = liveObject.getString("humidity");

            return new Weather(city, weather, temperature, windPower, windDirection, humidity);
        } else {
            throw new JSONException("未找到天气数据");
        }
    }

    public static void main(String[] args) {
        String apiKey = "914f8295f358fcc5a14e0ebaecd10615";
        String city = "苏家屯区";

        try {
            WeatherApi weatherApi = new WeatherApi(apiKey);
            String weatherJson = weatherApi.getWeatherJson(city);

            Weather weather = weatherApi.parseWeather(weatherJson);
            System.out.println("城市：" + weather.getCity());
            System.out.println("天气状况：" + weather.getWeather());
            System.out.println("温度：" + weather.getTemperature());
            System.out.println("风力：" + weather.getWindPower());
            System.out.println("风向：" + weather.getWindDirection());
            System.out.println("湿度：" + weather.getHumidity());
        } catch (IOException | JSONException e) {
            e.printStackTrace();
        }
    }
}
