package project06.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import project06.vo.Chart;

@Repository
public interface ChartDao {
	public ArrayList<Chart> chartList(int pno);
	public ArrayList<Integer> getRefno(int mno);
}
