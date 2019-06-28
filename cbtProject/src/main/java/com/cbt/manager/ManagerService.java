package com.cbt.manager;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

public interface ManagerService {
	// 글 등록
	void insertManager(ManagerVO vo);

	// 글 수정
	void updateManager(ManagerVO vo);

	// 글 삭제
	void deleteManager(ManagerVO vo);

	// 글 상세 조회
	ManagerVO getManager(ManagerVO vo);

	// 글 목록 조회
	List<ManagerVO> getManagerList(ManagerVO vo);

	public Map<String, Object> getManagerList(ManagerVO vo, Paging paging);
}
