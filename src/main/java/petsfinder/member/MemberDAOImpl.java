package petsfinder.member;

import org.springframework.stereotype.Service;

@Service
public interface MemberDAOImpl {

	public MemberDTO memberLogin(MemberDTO memberDTO);
	
	public int memberInsert(MemberDTO memberDTO);
	
	public String idValidate(String id);
}
