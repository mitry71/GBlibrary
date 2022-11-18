package library.member;

import java.sql.Date;

public class MemberVO {
	private String name;
	private String id;
	private String pwd;
	private String hp;
	private String address;
	private String email;
	private String expire;
	private Date joinDate;
	
	public MemberVO() {
		System.out.println("MemberVO 생성");
	}
	
	public MemberVO(String name, String id, String pwd, String hp, String address, String email, String expire) {
		this.name=name;
		this.id=id;
		this.pwd=pwd;
		this.hp=hp;
		this.address=address;
		this.email=email;
		this.expire=expire;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getExpire() {
		return expire;
	}

	public void setExpire(String expire) {
		this.expire = expire;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
}
