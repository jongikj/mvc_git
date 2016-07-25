/**
 * 
 */
package member;

import java.util.List;

import global.CommonService;

/**
 * @date   :2016. 6. 17.
 * @author :장종익
 * @file   :StudentService.java
 * @story  :
*/
public interface MemberService extends CommonService{
	public String regist(MemberBean bean);
	public void update(MemberBean bean);
	public void delete(MemberBean bean);
	public MemberBean findById(String id);
	public List<MemberBean> findByName(String findName);
	public MemberBean login(MemberBean bean);
	public boolean existId(String id);
	public MemberBean findBy();
	public void logout(MemberBean bean);
}
