package project06.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import project06.vo.Chart;

@Repository
public interface ChartDao {
	public ArrayList<Chart> chartList(int pno);
	public ArrayList<Integer> getRefno(int mno);
	//여러 Type을 보낼 경우 param을 지정해줄 필요가 있다
	public ArrayList<Chart> chartListtm(@Param("pno") int pno,@Param("mno") int mno,@Param("refno") int refno);
}
