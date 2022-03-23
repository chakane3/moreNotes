package NJIT_java.miscl;

public class sqrt {
    public static void main(String[] args) {

    }

    /*
        Using a divide and conquer approach

    */
    public static int mySqrt(int x) {
        int lowerBound = 0;
        int upperBound = x;

        while(lowerBound <= upperBound) {
            int guess = lowerBound + upperBound / 2;
            System.out.println(guess);
            break;
        }


        return 0;
    }
    
}
