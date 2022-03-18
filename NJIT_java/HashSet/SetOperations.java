package NJIT_java.HashSet;
import java.util.Scanner;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Arrays;
import java.util.Set;
import java.util.Iterator;

public class SetOperations {
    public static final int INTERSECTION_OPERATION = 0;
    public static final int UNION_OPERATION = 1;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // have the user choose what operation they want
        System.out.println("Input 1 for Intersection, 2 for Union");
        int operation = Integer.parseInt(sc.nextLine());

        // variables for processing input
        String[] numberStrings;
        Integer[] numbers;
        String input;

        // parse our first set
        Set<Integer> set1;
        input = sc.nextLine();
        if(input.equals("")) {
            set1 = new HashSet<Integer>();
        } else {
            numberStrings = input.split(" ");
            numbers = new Integer[numberStrings.length];
            for(int i = 0; i < numberStrings.length; i++) {
                numbers[i] = Integer.parseInt(numberStrings[i]);
            }
            set1 = new HashSet<Integer>(Arrays.asList(numbers));
        }

        for(int ele: set1) {
            System.out.print(ele + " ");
        }

    }
    
}
