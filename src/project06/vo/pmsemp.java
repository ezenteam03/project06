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