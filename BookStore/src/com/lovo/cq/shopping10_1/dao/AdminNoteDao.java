package com.lovo.cq.shopping10_1.dao;

import java.util.List;

import com.lovo.cq.shopping10_1.po.NotePager;

public interface AdminNoteDao {

	public List getAllNotes();
	public boolean deleteNote(int[] i);
	public NotePager getNotePager(int index, int pageSize);
}
