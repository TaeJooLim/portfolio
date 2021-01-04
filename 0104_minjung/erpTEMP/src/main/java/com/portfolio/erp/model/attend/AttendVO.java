package com.portfolio.erp.model.attend;

import java.util.Date;

public class AttendVO {
	
	/*	attendance(근태정보입력)	
	 * 	분(m)으로 계산하여야 함
	 * 	workplace 	: 외근여부(내근Y/외근N) - 외근은 결재신청 후 승인필요
	 * 	status		: 상태(처리필요-1/정상출근-2/휴가-3/결근-4)
	 * 	출근시간이 09시 이후 = '지각', 지각이더라도 출퇴근모두 찍으면 '정상출근'(2)
	 * 	휴가및결근 = '처리필요'(1) - 인사담당자 혹은 관리자가 '휴가'(3) 혹은 '결근'(4) 으로 처리해야함 */
	
	private int attendId;
	private String attendWorkdate;
	private Date attendStarttime;
	private Date attendEndtime;
	private int attendDefaulttime;
	private int attendOvertime;
	private int attendTotaltime;
	private String attendLate;
	private String attendWorkplace;
	
	private int attendStatus;
	
	private int empIdFk;

	public int getAttendId() {
		return attendId;
	}

	public void setAttendId(int attendId) {
		this.attendId = attendId;
	}

	public String getAttendWorkdate() {
		return attendWorkdate;
	}

	public void setAttendWorkdate(String attendWorkdate) {
		this.attendWorkdate = attendWorkdate;
	}

	public Date getAttendStarttime() {
		return attendStarttime;
	}

	public void setAttendStarttime(Date attendStarttime) {
		this.attendStarttime = attendStarttime;
	}

	public Date getAttendEndtime() {
		return attendEndtime;
	}

	public void setAttendEndtime(Date attendEndtime) {
		this.attendEndtime = attendEndtime;
	}

	public int getAttendDefaulttime() {
		return attendDefaulttime;
	}

	public void setAttendDefaulttime(int attendDefaulttime) {
		this.attendDefaulttime = attendDefaulttime;
	}

	public int getAttendOvertime() {
		return attendOvertime;
	}

	public void setAttendOvertime(int attendOvertime) {
		this.attendOvertime = attendOvertime;
	}

	public int getAttendTotaltime() {
		return attendTotaltime;
	}

	public void setAttendTotaltime(int attendTotaltime) {
		this.attendTotaltime = attendTotaltime;
	}

	public String getAttendLate() {
		return attendLate;
	}

	public void setAttendLate(String attendLate) {
		this.attendLate = attendLate;
	}

	public String getAttendWorkplace() {
		return attendWorkplace;
	}

	public void setAttendWorkplace(String attendWorkplace) {
		this.attendWorkplace = attendWorkplace;
	}

	public int getAttendStatus() {
		return attendStatus;
	}

	public void setAttendStatus(int attendStatus) {
		this.attendStatus = attendStatus;
	}

	public int getEmpIdFk() {
		return empIdFk;
	}

	public void setEmpIdFk(int empIdFk) {
		this.empIdFk = empIdFk;
	}
	
}
