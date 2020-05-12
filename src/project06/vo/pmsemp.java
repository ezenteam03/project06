package project06.vo;


/*
PMSempno NUMBER			NOT NULL,
PMSename varchar2(40)	NULL,
PMSdept  varchar2(40)	NULL,
PMSmgr 	 varchar2(40)	NULL,
PMStel	 varchar2(60)	NULL,
PMSemail varchar2(100)	NULL
);*/

public class pmsemp {
		private int PMSempno;
		private String PMSename;
		private String PMSdept;
		private String PMSmgr;
		private String PMStel;
		private String PMSemail;
		
		public int getPMSempno() {
			return PMSempno;
		}
		public void setPMSempno(int pMSempno) {
			PMSempno = pMSempno;
		}
		public String getPMSename() {
			return PMSename;
		}
		public void setPMSename(String pMSename) {
			PMSename = pMSename;
		}
		public String getPMSdept() {
			return PMSdept;
		}
		public void setPMSdept(String pMSdept) {
			PMSdept = pMSdept;
		}
		public String getPMSmgr() {
			return PMSmgr;
		}
		public void setPMSmgr(String pMSmgr) {
			PMSmgr = pMSmgr;
		}
		public String getPMStel() {
			return PMStel;
		}
		public void setPMStel(String pMStel) {
			PMStel = pMStel;
		}
		public String getPMSemail() {
			return PMSemail;
		}
		public void setPMSemail(String pMSemail) {
			PMSemail = pMSemail;
		}
		
		
}
