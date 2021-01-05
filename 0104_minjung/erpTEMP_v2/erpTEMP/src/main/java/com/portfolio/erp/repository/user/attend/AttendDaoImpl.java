package com.portfolio.erp.repository.user.attend;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.attend.AttendVO;

@Repository
public class AttendDaoImpl implements AttendDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void setStarttime(AttendVO avo) {
		sqlSession.insert("attend.setStarttime", avo);
	}

	@Override
	public int isStarted(AttendVO avo) {
		return sqlSession.selectOne("attend.isStarted", avo);
	}

	@Override
	public void setEndtime(AttendVO avo) {
		// 퇴근시간 업데이트
		sqlSession.update("attend.setEndtime", avo);
		
		/*	출근 퇴근시간 가져와서 초과근무시간/총근무시간 계산 후, mapper로 돌아가서 update set초과근무시간/총근무시간해주기	*/
		//	1. 출근시간 퇴근시간 가져오기
		AttendVO vo = sqlSession.selectOne("attend.getTimes", avo);
		
		//	2. 총업무시간(분) = 퇴근시간-출근시간
		int total = (int) (( vo.getAttendEndtime().getTime() - vo.getAttendStarttime().getTime() ) / (1000 * 60));
		
		// 	3. 초과업무시간(분) = 총업무시간 - 소정근무시간(default 540분)
		int overtime = total - vo.getAttendDefaulttime();
		
		//	4. 총업무시간, 초과업무시간을 hashmap에 저장(update에 필요한 파라미터들을 담음)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("attendTotaltime", total);
		map.put("attendOvertime", overtime);
		map.put("attendWorkdate", avo.getAttendWorkdate());
		map.put("empIdFk", avo.getEmpIdFk());
		
		//	5. mapper에 총업무시간,초과업무시간을 update
		sqlSession.update("attend.setOtherTimes", map);
		
	}

	@Override
	public int isEnded(AttendVO avo) {
		return sqlSession.selectOne("attend.isEnded", avo);
	}

	@Override
	public AttendVO getTimes(AttendVO avo) {
		return sqlSession.selectOne("attend.getTimes", avo);
	}

	@Override
	public int isDataExists(AttendVO avo) {
		return sqlSession.selectOne("attend.isDataExists", avo);
	}

	@Override
	public List<AttendVO> getWorkDatas() {
		return sqlSession.selectList("attend.getWorkDatas");
	}

	@Override
	public int isWorkDatas() {
		return sqlSession.selectOne("attend.isWorkDatas");
	}

	@Override
	public void changeLate(AttendVO avo) {
		sqlSession.update("attend.changeLate", avo);
	}
}
