package scit.classa.three.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int rseq;
	private String user_id;
	private String review_context;
	private int review_good;
	private int reveiw_bad;
	private String wdate;
	private String user_nickname;
}
