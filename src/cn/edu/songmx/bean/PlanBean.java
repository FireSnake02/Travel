package cn.edu.songmx.bean;

import java.sql.Date;

public class PlanBean {
	private int travel_plan_id;
	private String destination;
	private Date start_date;
	private String interests;
	private int user_id;

	// 构造函数
	public PlanBean() {

	}

	public PlanBean(String destination, Date start_date,
			String interests, int user_id) {
		this.destination = destination;
		this.start_date = start_date;
		this.interests = interests;
		this.user_id = user_id;
	}

	public int getTravel_plan_id() {
		return travel_plan_id;
	}

	public void setTravel_plan_id(int travel_plan_id) {
		this.travel_plan_id = travel_plan_id;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public String getInterests() {
		return interests;
	}

	public void setInterests(String interests) {
		this.interests = interests;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}
