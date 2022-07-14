package com.bcc.domain;


public class BoardVO {
	private Integer num;
	private String title;
	private double lng;
	private String convenient;
	private String price;
	private String tel;
	private String img;
	private String trfc_info;
	private String hldy_info;
	private String contents;
	private String subtitle;
	private String usage_day;
	private String addr;
	private String addr_full;
	private String url;
	private String thumbnail;
	private double lat;
	private int t_category;
	private int thumbCnt;
	private int totalCnt;
	private int commentCnt;
	
	
	public BoardVO() {
	}
	
	
	public BoardVO(Integer num, String title, double lng, String convenient, String price, String tel, String img,
			String trfc_info, String hldy_info, String contents, String subtitle, String usage_day, String addr,
			String addr_full, String url, String thumbnail, double lat, int t_category, int thumbCnt, int totalCnt,
			int commentCnt) {
		super();
		this.num = num;
		this.title = title;
		this.lng = lng;
		this.convenient = convenient;
		this.price = price;
		this.tel = tel;
		this.img = img;
		this.trfc_info = trfc_info;
		this.hldy_info = hldy_info;
		this.contents = contents;
		this.subtitle = subtitle;
		this.usage_day = usage_day;
		this.addr = addr;
		this.addr_full = addr_full;
		this.url = url;
		this.thumbnail = thumbnail;
		this.lat = lat;
		this.t_category = t_category;
		this.thumbCnt = thumbCnt;
		this.totalCnt = totalCnt;
		this.commentCnt = commentCnt;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getConvenient() {
		return convenient;
	}

	public void setConvenient(String convenient) {
		this.convenient = convenient;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTrfc_info() {
		return trfc_info;
	}

	public void setTrfc_info(String trfc_info) {
		this.trfc_info = trfc_info;
	}

	public String getHldy_info() {
		return hldy_info;
	}

	public void setHldy_info(String hldy_info) {
		this.hldy_info = hldy_info;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getUsage_day() {
		return usage_day;
	}

	public void setUsage_day(String usage_day) {
		this.usage_day = usage_day;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr_full() {
		return addr_full;
	}

	public void setAddr_full(String addr_full) {
		this.addr_full = addr_full;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public int gett_category() {
		return t_category;
	}

	public void sett_category(int t_category) {
		this.t_category = t_category;
	}

	public int getThumbCnt() {
		return thumbCnt;
	}

	public void setThumbCnt(int thumbCnt) {
		this.thumbCnt = thumbCnt;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", title=" + title + ", lng=" + lng + ", convenient=" + convenient + ", price="
				+ price + ", tel=" + tel + ", img=" + img + ", trfc_info=" + trfc_info + ", hldy_info=" + hldy_info
				+ ", contents=" + contents + ", subtitle=" + subtitle + ", usage_day=" + usage_day + ", addr=" + addr
				+ ", addr_full=" + addr_full + ", url=" + url + ", thumbnail=" + thumbnail + ", lat=" + lat
				+ ", t_category=" + t_category + ", thumbCnt=" + thumbCnt + ", totalCnt=" + totalCnt + ", commentCnt="
				+ commentCnt + "]";
	}
}
