package NJIT_java.miscl;

public class LengthOfLastWord {
    public static void main(String[] args) {
        String str = "Hello World";
        String[] strArr = str.split(" ");
        for(int i = 0; i < strArr.length; i++) {
            System.out.println(strArr[i]);
        }

    }

    public static int lengthOfLastWord(String s) {
        String[] strArr = s.split(" ");
        return strArr[strArr.length-1].length();
    }
    
}
