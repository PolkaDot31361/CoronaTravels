package scit.classa.three.dao;

import scit.classa.three.vo.AccountVO;

public interface AccountMapper {

	//회원가입
	public int createAccount(AccountVO account);
	
//	회원 ID 중복검사
	public AccountVO idCheck(AccountVO account);
	
}
