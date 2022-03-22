package NJIT_java.Sorting;

public class a {
    private static void merge(int[] arr, int startIndex, int middleIndex, int endIndex) {
        // declare seperate arrays for the first list and the second list
        int[] firstHalf = new int[middleIndex - startIndex + 1];
        int[] secondHalf = new int[endIndex - middleIndex];

        // populate the first half
        for(int i = startIndex; i < middleIndex + 1; i++) {
            firstHalf[i-startIndex] = arr[i];
        }

        // populate the second half
        for(int i = middleIndex + 1; i <= endIndex; i++) {
            secondHalf[i-middleIndex-1] = arr[i];
        }

        // setup pointers for each list
        int firstHalfPointer = 0;
        int secondHalfPointer = 0;

        // populate the original list with merged elements
        for(int i = startIndex; i <= endIndex; i++) {
            // check for out of bounds
            if(firstHalfPointer >= firstHalf.length) {
                arr[i] = secondHalf[secondHalfPointer];
                secondHalfPointer++;
                continue;
            }
            if(secondHalfPointer >= secondHalf.length) {
                arr[i] = firstHalf[firstHalfPointer];
                firstHalfPointer++;
                continue;
            }

            // populate with smaller of the 2 elements
            if(firstHalf[firstHalfPointer] <= secondHalf[secondHalfPointer]) {
                arr[i] = firstHalf[firstHalfPointer];
                firstHalfPointer++;
            } else {
                arr[i] = secondHalf[secondHalfPointer];
                secondHalfPointer++;
            }
        }
    }
}