package com.bcc.persistence;


public interface BoardDAO {
	
	public Integer checkThumb(int b_num, String id);
	
	// ���ƿ� �� +1
	public void addThumb(int b_num);
	
	// ���ƿ� �� -1
	public void subThumb(int b_num);
	
	// ���ƿ� ���̺� ��� �߰�
	public void insertThumb(int b_num, int b_category, String m_id);
	
	// ���ƿ� ���̺��� ��� ����
	public void deleteThumb(int b_num, String id);
	
}
