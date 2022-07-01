package com.bcc.domain;

public class BoardVO {
	
	private Integer num;
	private String MAIN_TITLE;
	private double LNG;
	private String MIDDLE_SIZE_RM1;
	private String USAGE_AMOUNT;
	private String CNTCT_TEL;
	private String MAIN_IMG_NORMAL;
	private String TRFC_INFO;
	private String HLDY_INFO;
	private String ITEMCNTNTS;
	private String PLACE;
	private String SUBTITLE;
	private String USAGE_DAY;
	private String USAGE_DAY_WEEK_AND_TIME;
	private String GUGUN_NM;
	private String ADDR1;
	private String HOMEPAGE_URL;
	private String TITLE;
	private String MAIN_IMG_THUMB;

	private double LAT;
	private int numOfRows;
	private int pageNo;
	private int totalCount;

	public BoardVO() {}
	public BoardVO(Integer num, String mAIN_TITLE, double lNG, String mIDDLE_SIZE_RM1, String uSAGE_AMOUNT,
			String cNTCT_TEL, String mAIN_IMG_NORMAL, String tRFC_INFO, String hLDY_INFO, String iTEMCNTNTS,
			String pLACE, String sUBTITLE, String uSAGE_DAY, String uSAGE_DAY_WEEK_AND_TIME, String gUGUN_NM,
			String aDDR1, String hOMEPAGE_URL, String tITLE, String mAIN_IMG_THUMB, int lAT, int numOfRows, int pageNo,
			int totalCount) {

		super();
		this.num = num;
		this.MAIN_TITLE = mAIN_TITLE;
		this.LNG = lNG;
		this.MIDDLE_SIZE_RM1 = mIDDLE_SIZE_RM1;
		this.USAGE_AMOUNT = uSAGE_AMOUNT;
		this.CNTCT_TEL = cNTCT_TEL;
		this.MAIN_IMG_NORMAL = mAIN_IMG_NORMAL;
		this.TRFC_INFO = tRFC_INFO;
		this.HLDY_INFO = hLDY_INFO;
		this.ITEMCNTNTS = iTEMCNTNTS;
		this.PLACE = pLACE;
		this.SUBTITLE = sUBTITLE;
		this.USAGE_DAY = uSAGE_DAY;
		this.USAGE_DAY_WEEK_AND_TIME = uSAGE_DAY_WEEK_AND_TIME;
		this.GUGUN_NM = gUGUN_NM;
		this.ADDR1 = aDDR1;
		this.HOMEPAGE_URL = hOMEPAGE_URL;
		this.TITLE = tITLE;
		this.MAIN_IMG_THUMB = mAIN_IMG_THUMB;
		this.LAT = lAT;
		this.numOfRows = numOfRows;
		this.pageNo = pageNo;
		this.totalCount = totalCount;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMAIN_TITLE() {
		return MAIN_TITLE;
	}

	public void setMAIN_TITLE(String mAIN_TITLE) {
		MAIN_TITLE = mAIN_TITLE;
	}

	public double getLNG() {
		return LNG;
	}

	public void setLNG(double lNG) {
		LNG = lNG;
	}

	public String getMIDDLE_SIZE_RM1() {
		return MIDDLE_SIZE_RM1;
	}

	public void setMIDDLE_SIZE_RM1(String mIDDLE_SIZE_RM1) {
		MIDDLE_SIZE_RM1 = mIDDLE_SIZE_RM1;
	}

	public String getUSAGE_AMOUNT() {
		return USAGE_AMOUNT;
	}

	public void setUSAGE_AMOUNT(String uSAGE_AMOUNT) {
		USAGE_AMOUNT = uSAGE_AMOUNT;
	}

	public String getCNTCT_TEL() {
		return CNTCT_TEL;
	}

	public void setCNTCT_TEL(String cNTCT_TEL) {
		CNTCT_TEL = cNTCT_TEL;
	}

	public String getMAIN_IMG_NORMAL() {
		return MAIN_IMG_NORMAL;
	}

	public void setMAIN_IMG_NORMAL(String mAIN_IMG_NORMAL) {
		MAIN_IMG_NORMAL = mAIN_IMG_NORMAL;
	}

	public String getTRFC_INFO() {
		return TRFC_INFO;
	}

	public void setTRFC_INFO(String tRFC_INFO) {
		TRFC_INFO = tRFC_INFO;
	}

	public String getHLDY_INFO() {
		return HLDY_INFO;
	}

	public void setHLDY_INFO(String hLDY_INFO) {
		HLDY_INFO = hLDY_INFO;
	}

	public String getITEMCNTNTS() {
		return ITEMCNTNTS;
	}

	public void setITEMCNTNTS(String iTEMCNTNTS) {
		ITEMCNTNTS = iTEMCNTNTS;
	}

	public String getPLACE() {
		return PLACE;
	}

	public void setPLACE(String pLACE) {
		PLACE = pLACE;
	}

	public String getSUBTITLE() {
		return SUBTITLE;
	}

	public void setSUBTITLE(String sUBTITLE) {
		SUBTITLE = sUBTITLE;
	}

	public String getUSAGE_DAY() {
		return USAGE_DAY;
	}

	public void setUSAGE_DAY(String uSAGE_DAY) {
		USAGE_DAY = uSAGE_DAY;
	}

	public String getUSAGE_DAY_WEEK_AND_TIME() {
		return USAGE_DAY_WEEK_AND_TIME;
	}

	public void setUSAGE_DAY_WEEK_AND_TIME(String uSAGE_DAY_WEEK_AND_TIME) {
		USAGE_DAY_WEEK_AND_TIME = uSAGE_DAY_WEEK_AND_TIME;
	}

	public String getGUGUN_NM() {
		return GUGUN_NM;
	}

	public void setGUGUN_NM(String gUGUN_NM) {
		GUGUN_NM = gUGUN_NM;
	}

	public String getADDR1() {
		return ADDR1;
	}

	public void setADDR1(String aDDR1) {
		ADDR1 = aDDR1;
	}

	public String getHOMEPAGE_URL() {
		return HOMEPAGE_URL;
	}

	public void setHOMEPAGE_URL(String hOMEPAGE_URL) {
		HOMEPAGE_URL = hOMEPAGE_URL;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public String getMAIN_IMG_THUMB() {
		return MAIN_IMG_THUMB;
	}

	public void setMAIN_IMG_THUMB(String mAIN_IMG_THUMB) {
		MAIN_IMG_THUMB = mAIN_IMG_THUMB;
	}

	public double getLAT() {
		return LAT;
	}

	public void setLAT(int lAT) {
		LAT = lAT;
	}

	public int getNumOfRows() {
		return numOfRows;
	}

	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "MytableVO [num=" + num + ", MAIN_TITLE=" + MAIN_TITLE + ", LNG=" + LNG + ", MIDDLE_SIZE_RM1="
				+ MIDDLE_SIZE_RM1 + ", USAGE_AMOUNT=" + USAGE_AMOUNT + ", CNTCT_TEL=" + CNTCT_TEL + ", MAIN_IMG_NORMAL="
				+ MAIN_IMG_NORMAL + ", TRFC_INFO=" + TRFC_INFO + ", HLDY_INFO=" + HLDY_INFO + ", ITEMCNTNTS="
				+ ITEMCNTNTS + ", PLACE=" + PLACE + ", SUBTITLE=" + SUBTITLE + ", USAGE_DAY=" + USAGE_DAY
				+ ", USAGE_DAY_WEEK_AND_TIME=" + USAGE_DAY_WEEK_AND_TIME + ", GUGUN_NM=" + GUGUN_NM + ", ADDR1=" + ADDR1
				+ ", HOMEPAGE_URL=" + HOMEPAGE_URL + ", TITLE=" + TITLE + ", MAIN_IMG_THUMB=" + MAIN_IMG_THUMB
				+ ", LAT=" + LAT + ", numOfRows=" + numOfRows + ", pageNo=" + pageNo + ", totalCount=" + totalCount
				+ "]";
	}

}
