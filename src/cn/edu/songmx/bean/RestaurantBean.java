package cn.edu.songmx.bean;

import java.sql.Date;

public class RestaurantBean {
	private int restaurant_id;
	private String name;
	private float rating;
	private String address;
	private String phone_number;
	private int user_id;
	private Date start_date;
	private String image_url;
	
	// 构造函数
	public RestaurantBean() {

	}

	public RestaurantBean(String name, float rating, String address,
			String phone_number, int user_id,Date start_date,String image_url) {
		this.name = name;
		this.rating = rating;
		this.address = address;
		this.phone_number = phone_number;
		this.user_id = user_id;
		this.start_date = start_date;
		this.image_url = image_url;
	}

	public int getRestaurant_id() {
		return restaurant_id;
	}

	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
}
