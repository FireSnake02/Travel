package cn.edu.songmx.bean;

import java.sql.Date;

public class AttractionBean {
	private int attraction_id;
	private String name;
	private String open_time;
	private Float entrance_fee;
	private String address;
	private int user_id;
	private Date start_date;
	private String image_url;

	// 构造函数
	public AttractionBean() {

	}

	public AttractionBean(String name, String open_time, float entrance_fee,
			String address, int user_id, Date start_date,String image_url) {
		this.name = name;
		this.open_time = open_time;
		this.entrance_fee = entrance_fee;
		this.address = address;
		this.user_id = user_id;
		this.start_date = start_date;
		this.image_url = image_url;
	}

	public int getAttraction_id() {
		return attraction_id;
	}

	public void setAttraction_id(int attraction_id) {
		this.attraction_id = attraction_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOpen_time() {
		return open_time;
	}

	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}

	public Float getEntrance_fee() {
		return entrance_fee;
	}

	public void setEntrance_fee(Float entrance_fee) {
		this.entrance_fee = entrance_fee;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
