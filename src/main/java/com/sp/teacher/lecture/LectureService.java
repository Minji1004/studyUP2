package com.sp.teacher.lecture;

import java.util.List;

import com.sp.teacher.Teacher;

public interface LectureService {

	public void insertLecture(Lecture dto, String pathname) throws Exception;
	public List<Lecture> readLectureList (Teacher dto) throws Exception;
}
