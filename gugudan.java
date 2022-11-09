package practice1;

public class gugudan {

	public static void main(String[] args) {
		int a = 1;
		for(int i=0;i<8;i++) {
			a += 1;
			int b = 1;
			for(int j=0;j<8;j++) {
				b += 1;
				System.out.println(a+"X"+b+"="+a*b);
			}System.out.println();
		}
	}
}