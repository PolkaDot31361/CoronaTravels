package scit.classa.three.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scit.classa.three.vo.AccountVO;

@Repository
public class AccountDAO {

	
	@Autowired
	private SqlSession session;
	
	// 회원 가입
	public int createAccount(AccountVO account) {
		int cnt = 0 ;
		try {
			AccountMapper mapper = session.getMapper(AccountMapper.class);
			cnt = mapper.createAccount(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
}
