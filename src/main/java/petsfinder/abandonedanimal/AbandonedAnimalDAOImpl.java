package petsfinder.abandonedanimal;

import java.util.ArrayList;

import org.springframework.stereotype.Service;


@Service
public interface AbandonedAnimalDAOImpl {
	
	
	public AbandonedAnimalDTO abandonedAnimalView(AbandonedAnimalDTO abandonedAnimalDTO);
	public int getTotalCount();
	public ArrayList<AbandonedAnimalDTO> listPage(int s, int e);
//	public int getTotalCountSearch(Map<String, String> hmap);
//	public ArrayList<MyBoardDTO> view(ParameterDTO parameterDTO);
//	
//	
//	
//	/*
//	@Param 어노테이션을 통해 파라미터를 Mapper에서 사용할 수 있는 별칭을 부여한다.
//	해당 별칭으로 쿼리문의 인파라미터로 사용할 수 있다.
//	 */
//	public int write(@Param("_name") String name,@Param("_contents") String contents,
//			@Param("_id") String id);
//	public MyBoardDTO view(ParameterDTO parameterDTO);
//	public int modify(MyBoardDTO myBoardDTO);
//	public int delete(String idx, String id);
//	
//	public ArrayList<MyBoardDTO> hashMapUse(Map<String, String> hMap);
//	public ArrayList<MyBoardDTO> arrayListUse(List<String> aList);
	
	
}
