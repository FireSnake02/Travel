package cn.edu.songmx.api;

public class Weather {
	  private String city;
	    private String weather;
	    private String temperature;
	    private String windPower;
	    private String windDirection;
	    private String humidity;

	    public Weather(String city, String weather, String temperature, String windPower, String windDirection, String humidity) {
	        this.city = city;
	        this.weather = weather;
	        this.temperature = temperature;
	        this.windPower = windPower;
	        this.windDirection = windDirection;
	        this.humidity = humidity;
	    }

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getWeather() {
			return weather;
		}

		public void setWeather(String weather) {
			this.weather = weather;
		}

		public String getTemperature() {
			return temperature;
		}

		public void setTemperature(String temperature) {
			this.temperature = temperature;
		}

		public String getWindPower() {
			return windPower;
		}

		public void setWindPower(String windPower) {
			this.windPower = windPower;
		}

		public String getWindDirection() {
			return windDirection;
		}

		public void setWindDirection(String windDirection) {
			this.windDirection = windDirection;
		}

		public String getHumidity() {
			return humidity;
		}

		public void setHumidity(String humidity) {
			this.humidity = humidity;
		}

	
}
