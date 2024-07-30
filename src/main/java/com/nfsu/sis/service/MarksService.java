package com.nfsu.sis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nfsu.sis.entities.CourseList;
import com.nfsu.sis.entities.ExamList;
import com.nfsu.sis.entities.ExamResult;
import com.nfsu.sis.entities.StudentList;
import com.nfsu.sis.entities.SubGradeList;
import com.nfsu.sis.entities.TotalGrades;
import com.nfsu.sis.repository.ExamResultRepository;
import com.nfsu.sis.repository.SubGradeListRepository;
import com.nfsu.sis.repository.TotalGradesRepository;

@Service
public class MarksService {
	
	@Autowired
	private ExamResultRepository examResultRepository;
	
	@Autowired
	private SubGradeListRepository subGradeListRepository;
	
	@Autowired
	private TotalGradesRepository totalGradesRepository;
	
	public void addMarks(int sid,  int core1Internal, int core1EndSem,int core1Practical,int core2Internal,int core2EndSem,int core2Practical,
			 int elective1, int elective1Internal, int elective1EndSem,Integer elective1Practical,int elective2,int elective2Internal,int elective2EndSem,
			int elective3,int elective3Internal,int elective3EndSem,Integer elective3Practical){
		saveExamResult(sid,1,1,core1Internal);
		saveExamResult(sid,1,2,core1EndSem);
		saveExamResult(sid,1,3,core1Practical);
		saveExamResult(sid,2,4,core2Internal);
		saveExamResult(sid,2,5,core2EndSem);
		saveExamResult(sid,2,6,core2Practical);
		saveExamResult(sid,elective1,7,elective1Internal);
		saveExamResult(sid,elective1,8,elective1EndSem);
		saveExamResult(sid,elective1,9,elective1Practical);
		saveExamResult(sid,elective2,10,elective2Internal);
		saveExamResult(sid,elective2,11,elective2EndSem);
		saveExamResult(sid,elective3,12,elective3Internal);
		saveExamResult(sid,elective3,13,elective3EndSem);
		saveExamResult(sid,elective3,14,elective3Practical);
		
		saveGrade(sid, 1, calculateGrade(core1Internal+core1EndSem+core1Practical,200));
		saveGrade(sid, 2, calculateGrade(core2Internal+core2EndSem+core2Practical,200));
		saveGrade(sid, elective1, calculateGrade(elective1Internal+elective1EndSem+elective1Practical,200));
		saveGrade(sid, elective2, calculateGrade(elective2Internal+elective2EndSem,200));
		saveGrade(sid, elective3, calculateGrade(elective3Internal+elective3EndSem+elective1Practical,200));
		
		int totalscore = core1Internal+core1EndSem+core1Practical+core2Internal+core2EndSem+core2Practical+elective1Internal+elective1EndSem+elective1Practical+elective2Internal+elective2EndSem+elective3Internal+elective3EndSem+elective3Practical;
		saveTotalGrade(sid, totalscore, calculateGrade(totalscore,1000)) ;		
		
	}
	private void saveExamResult(int sid,int cid,int exid,int marks)
	{
		ExamResult examResult = new ExamResult();
		examResult.setStudent(new StudentList(sid));
		examResult.setCourse(new CourseList(cid));
		examResult.setExam(new ExamList(exid));
		examResult.setObtmarks(marks);
		examResultRepository.save(examResult);
	}
	
	private void saveGrade(int sid, int cid, String grade)
	{
		SubGradeList subGrade = new SubGradeList();
		subGrade.setStudent(new StudentList(sid));
		subGrade.setCourse(new CourseList(cid));
		subGrade.setGrade(grade);
		subGradeListRepository.save(subGrade);
		
	}
	private void saveTotalGrade(int sid,int totalScore,String grade)
	{
		TotalGrades totalGrade = new TotalGrades();
		totalGrade.setStudent(new StudentList(sid));
		totalGrade.setTotalscore(totalScore);
		totalGrade.setGrade(grade);
		totalGradesRepository.save(totalGrade);
		
	}
	
	private String calculateGrade(int score, int maxScore) {
        double percentage = (double) score / maxScore * 100;
        if (percentage >= 90) return "A";
        else if (percentage >= 80) return "B";
        else if (percentage >= 70) return "C";
        else if (percentage >= 60) return "D";
        else return "F";
    }
	
	
}
