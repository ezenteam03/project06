package project06.repository;

import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import project06.vo.Meet;

@Repository
public interface MeetDao{
	public ArrayList<Meet> list();
	
}
