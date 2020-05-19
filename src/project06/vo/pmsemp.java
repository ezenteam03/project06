package project06.vo;



//	eno NUMBER NOT NULL, /* 사원번호 */
//	name VARCHAR2(30) NOT NULL, /* 이름 */
//	dept VARCHAR2(50), /* 부서명 */
//	grade VARCHAR2(50) NOT NULL, /* 직책 */
//	phone VARCHAR2(50) NOT NULL, /* 핸드폰 */
//	email VARCHAR2(50) NOT NULL /* 이메일 */


public class pmsemp {
		private int eno;
		private String name;
		private String dept;
		private String grade;
		private String phone;
		private String email;
		private String cname;	// 권한이름		(pmscodes)
		private int pno;		// 프로젝트번호		(pmsmember)
		private String pass;	// 비밀번호		(pmsmember)
		private int mdiv;		// 권한구분		(pmsmember)
		private String wcon;	// 희망연락처		(pmsmember)

		
		
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public int getMdiv() {
			return mdiv;
		}
		public void setMdiv(int mdiv) {
			this.mdiv = mdiv;
		}
		public String getWcon() {
			return wcon;
		}
		public void setWcon(String wcon) {
			this.wcon = wcon;
		}
		public int getPno() {
			return pno;
		}
		public void setPno(int pno) {
			this.pno = pno;
		}
		public String getCname() {
			return cname;
		}
		public void setCname(String cname) {
			this.cname = cname;
		}
		public int getEno() {
			return eno;
		}
		public void setEno(int eno) {
			this.eno = eno;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDept() {
			return dept;
		}
		public void setDept(String dept) {
			this.dept = dept;
		}
		public String getGrade() {
			return grade;
		}
		public void setGrade(String grade) {
			this.grade = grade;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		

		
		
}
