package member;

import java.util.List;
import java.util.Map;

import bank.AccountService;
import bank.AccountServiceImpl;

/**
 * @date   :2016. 6. 20.
 * @author :장종익
 * @file   :StudentServiceImpl.java
 * @story  :
*/
public class MemberServiceImpl implements MemberService{
	MemberBean session;	
	MemberBean st = null;
	MemberDAO dao = MemberDAO.getInstance();	// 4.DAO의 getInstance() 메소드를 호출한다 (싱글톤 패턴)
	AccountService accService = AccountServiceImpl.getInstance();
	private static MemberServiceImpl instance = new MemberServiceImpl();
	
	private MemberServiceImpl() {
		session = new MemberBean();
	}
	
	public static MemberServiceImpl getInstance() {
		return instance;
	}

	@Override
	public String regist(MemberBean bean) {
		String msg = "";
		int result = dao.insert(bean);
		
		if (result == 1 ){
			msg = "회원가입 축하합니다";
		} else {
			msg = "";
		}
		return msg;
	}

	@Override
	public void update(MemberBean bean) {
		int result = dao.update(bean);
		if (result == 1) {
			session = this.findById(bean.getId());
		}
	}

	@Override
	public void delete(MemberBean bean) {
		int result = dao.delete(bean);
		if(result == 1){
			session = null;
		}
	}
	
	public int count(){
		return dao.count();
	}

	@Override
	public MemberBean findById(String findID) {
		return dao.findById(findID);
	}

	@Override
	public List<MemberBean> list() {
		return dao.list();
	}

	@Override
	public List<MemberBean> findByName(String findName) {
		return dao.findByName(findName);
	}

	@Override
	public List<?> findBy(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<?, ?> map() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String login(MemberBean bean) {
		String result = "";
		if (dao.login(bean)) {
			session = dao.findById(bean.getId());
			result = session.getName();
			accService.map();
		} else {
			result = "";
		}
		return result;
	}

	@Override
	public boolean existId(String id) {
		return dao.existId(id);
	}

	@Override
	public MemberBean findBy() {
		return session;
	}
	
	public void logout(MemberBean bean){
		if(bean.getId().equals(session.getId()) && bean.getPw().equals(session.getPw())){
			this.session = null;
		}
	}
}