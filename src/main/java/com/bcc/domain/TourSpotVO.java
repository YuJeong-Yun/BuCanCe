package com.bcc.domain;

public class TourSpotVO {
	// 부산여행지 정보 객체
	
	private int num;
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
	private int totalCnt;
	private int category;
	private int thumbCnt;
	private int commentCnt;
	
	
	
	
	
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getThumbCnt() {
		return thumbCnt;
	}
	public void setThumbCnt(int thumbCnt) {
		this.thumbCnt = thumbCnt;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUsage_day() {
		return usage_day;
	}
	public void setUsage_day(String usage_day) {
		this.usage_day = usage_day;
	}
	public String getAddr_full() {
		return addr_full;
	}
	public void setAddr_full(String addr_full) {
		this.addr_full = addr_full;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	
	
	@Override
	public String toString() {
		return "TourSpotVO [num=" + num + ", title=" + title + ", lng=" + lng + ", convenient=" + convenient
				+ ", price=" + price + ", tel=" + tel + ", img=" + img + ", trfc_info=" + trfc_info + ", hldy_info="
				+ hldy_info + ", contents=" + contents + ", subtitle=" + subtitle + ", usage_day=" + usage_day
				+ ", addr=" + addr + ", addr_full=" + addr_full + ", url=" + url + ", thumbnail=" + thumbnail + ", lat="
				+ lat + ", totalCnt=" + totalCnt + ", category=" + category + ", thumbCnt=" + thumbCnt + ", commentCnt="
				+ commentCnt + "]";
	}
	
	

}
