package NJIT_java.Sorting;

public class MergeSortedArray {
    public static void main(String[] args) {
        // int[] nums1 = {1, 2, 3, 0, 0, 0};
        // int[] nums2 = {2, 5, 6};
        // int[] nums1 = {2, 3, 4, 5, 0, 0, 0, 0};
        // int[] nums2 = {4, 6, 7, 8, 9};

        int[] nums3 = merge(nums1, 1, nums2, 1);
        for(int i = 0; i < nums3.length; i++) {
            System.out.print(nums3[i] + " ");
        }

    }

    // nums1 = 1, 2, 3, 0, 0, 0
    // nums2 = 2, 5, 6
    // output -> 1, 2, 2, 3, 5, 6

    // nums1 = 1
    // nums2 = 
    // output -> 1

    // nums1 = 0
    // nums2 = 1
    // output -> 1
    public static int[] merge(int[] nums1, int m, int[] nums2, int n) {
        // try using 2 pointers 
        int j = 0;
        int[] nums3 = new int[nums1.length+nums2.length];
        for(int i = 0; i < nums1.length; i++) {
            if(j == n) {
                break;
            }
            
            if(nums1[i] < nums2[j] && nums1[i] != 0) {
                nums3[i] = nums1[i];
            }
            else if(nums1[i] == nums2[j]) {
                nums3[i] = nums1[i];
                j++;
            }
            else if(nums1[i] > nums2[j] ) {
                nums3[i] = nums2[j];
                j++;
            } 
            else if(nums1[i] < nums2[j] && nums1[i] == 0) {
                nums3[i] = nums2[j];
                j++;
            }
        }
        return nums3;
    }
}
