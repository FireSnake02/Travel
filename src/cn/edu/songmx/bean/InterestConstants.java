package cn.edu.songmx.bean;

public class InterestConstants {
	public enum Interest {
		旅游景点("110000"), 公园广场("110100"), 风景名胜("110200"), 寺庙道观("110205"),博物馆("140100");

		private String interestCode;

		Interest(String interestCode) {
			this.interestCode = interestCode;
		}

		public String getInterestCode() {
			return interestCode;
		}

		public static String getByInterestName(String interestName) {
			for (Interest interest : Interest.values()) {
				if (interest.name().equals(interestName)) {
					return interest.getInterestCode();
				}
			}
			return null;
		}
	}
}
