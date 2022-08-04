package com.lec.divvyup.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.divvyup.dao.GroupBoardDao;
import com.lec.divvyup.vo.GroupBoard;

@Service
public class GroupBoardServiceImpl implements GroupBoardService {

	String backupPath = "C:\\Users\\User\\Desktop\\divvyUpDKBranch\\divvyUp\\src\\main\\webapp\\groupFileBoardUploadFiles";

	
	@Autowired
	private GroupBoardDao groupBoardDao; 
	
	@Override
	public void insertGroupboard(GroupBoard groupBoard, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("bookImgFileUpLoad/");
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1, tempBimg2
		String[] bimg = {"",""}; /* new String [2]*/
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
			bimg[idx] = mFile.getOriginalFilename();
			if(bimg[idx] != null && !bimg[idx].equals("")) {// 첨부함
				if(new File(uploadPath+bimg[idx]).exists()) {
					//new file??
					//첨부한 파일과 같은 이름의 파일이 서버에 이미 저장된 경우					
					bimg[idx] = System.currentTimeMillis()+"_"+bimg[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath + bimg[idx]));//서버에 저장
					System.out.println("서버파일 : "+uploadPath + bimg[idx]);
					System.out.println("백업파일 : "+backupPath + bimg[idx]);
					boolean result = filecopy(uploadPath + bimg[idx], backupPath+bimg[idx]);
					System.out.println(result==true? idx + "번째 백업성공":idx+"번째 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				//파일첨부 안하면 bimg[idx] = ""
				bimg[idx] = ""; //안해도됨?
			}
			idx++;
		}//whlie
		groupBoard.setGbfilename(bimg[0]); 
		groupBoardDao.insertGroupboard(groupBoard);
		
	}

	@Override
	public int deleteGroupboard(int gbid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GroupBoard> listLatest20Groupboard(int gid) {
		List<GroupBoard> glist = groupBoardDao.listLatest20Groupboard(gid);
		return glist;
	}

	@Override
	public List<GroupBoard> listPast20Groupboard(GroupBoard groupBoard) {
		List<GroupBoard> pastGList = groupBoardDao.listPast20Groupboard(groupBoard);
		return pastGList;
	}

	@Override
	public GroupBoard singleLatestGroupboard(int gid) {
		GroupBoard gbBoarad = groupBoardDao.singleLatestGroupboard(gid);
		return gbBoarad;
	}

	@Override
	public GroupBoard getGroupboardVO(String mid) {
		return null;
	}
	
	private boolean filecopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		FileInputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int)file.length()];
			
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1)break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	
}
