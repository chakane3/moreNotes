package NJIT_java.Sorting;

public class b {
    private static void mergeSort(int[] arr, int startIndex, int endIndex) {
        // base case
        if(startIndex >= endIndex) {
            return;
        }

        // sort each half
        int middleIndex = (startIndex + endIndex) / 2;
        mergeSort(arr, startIndex, middleIndex);
        System.out.print("FirstHalf: ");
        for(int i = 0; i < arr.length; i++) {
            System.out.print(arr[i]+" ");
        }

        mergeSort(arr, middleIndex+1, endIndex);
        System.out.print("SecondHalf: ");
        for(int i = 0; i < arr.length; i++) {
            System.out.print(arr[i]+" ");
        }
        
        // merge each half
        merge(arr, startIndex, middleIndex, endIndex);
    }
}
