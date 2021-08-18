package dao;

import java.util.List;

import vo.PhoneBookVO;

public interface PhoneBookDAO {
	public List<PhoneBookVO> getlist();

	public List<PhoneBookVO> search(String keyword);

	public boolean insert(PhoneBookVO vo);

	public boolean update(PhoneBookVO vo);

	public boolean delete(Long id);

}
