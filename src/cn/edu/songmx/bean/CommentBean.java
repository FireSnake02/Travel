package cn.edu.songmx.bean;

public class CommentBean {
	private int comment_id;
	private int travel_plan_id;
	private int user_id;
	private String comment_text;
	private double rating;

	// 构造函数
	public CommentBean() {

	}

	public CommentBean(int travel_plan_id, int user_id, String comment_text,
			double rating) {
		this.travel_plan_id = travel_plan_id;
		this.user_id = user_id;
		this.comment_text = comment_text;
		this.rating = rating;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getTravel_plan_id() {
		return travel_plan_id;
	}

	public void setTravel_plan_id(int travel_plan_id) {
		this.travel_plan_id = travel_plan_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}
}
