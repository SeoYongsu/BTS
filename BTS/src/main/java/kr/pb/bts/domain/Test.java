package kr.pb.bts.domain;

// domain 폴더 내에 클래스들은 수업시간 기준으로 말하자면 VO 클래스가 위치함
// 클래스이름은 뒤에 아무 형용사를 안붙인 Test, User 이런식으로 이름을 지정
public class Test {

	private String name;
	private int age;
	private int count;

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	
	
}
