package kr.co.planbut.mate;

public class MateDTO {
	private String mate_code;
	private String m_date;
	private String ct_code;
	private String mp_id;
	private String mate_list;
	private String mate_type;
	
	public MateDTO() {}

	public String getMate_code() {
		return mate_code;
	}

	public void setMate_code(String mate_code) {
		this.mate_code = mate_code;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public String getCt_code() {
		return ct_code;
	}

	public void setCt_code(String ct_code) {
		this.ct_code = ct_code;
	}

	public String getMp_id() {
		return mp_id;
	}

	public void setMp_id(String mp_id) {
		this.mp_id = mp_id;
	}

	public String getMate_list() {
		return mate_list;
	}

	public void setMate_list(String mate_list) {
		this.mate_list = mate_list;
	}

	public String getMate_type() {
		return mate_type;
	}

	public void setMate_type(String mate_type) {
		this.mate_type = mate_type;
	}

	@Override
	public String toString() {
		return "MateDTO [mate_code=" + mate_code + ", m_date=" + m_date + ", ct_code=" + ct_code + ", mp_id=" + mp_id
				+ ", mate_list=" + mate_list + ", mate_type=" + mate_type + "]";
	}
	
}//class end