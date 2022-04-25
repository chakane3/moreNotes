import java.util.Stack;
import java.util.ArrayList;
import java.util.List;

/*
Pre-Order: NLR
In-Order: LNR
Post-Order: LRN
*/


public class TreeTraversals {
    public static void main(String[] args) {
        TreeNode root = new TreeNode(40);
        // BinaryInsert  tree = new BinaryInsert();
        BinaryInsert.insertNode(root, 30);
        BinaryInsert.insertNode(root, 50);
        BinaryInsert.insertNode(root, 10);
        BinaryInsert.insertNode(root, 35);
        BinaryInsert.insertNode(root, 45);
        BinaryInsert.insertNode(root, 60);
        BinaryInsert.insertNode(root, 31);

        List<Integer> recursivePreorder = preOrderRecursive(root);
        System.out.print("recursive pre-order: ");
        System.out.println(recursivePreorder);

        List<Integer> recursiveInOrder = inOrderRecursive(root);
        System.out.print("recursive in-order: ");
        System.out.println(recursiveInOrder);

        List<Integer> recursivePostOrder = postOrderRecursive(root);
        System.out.print("recursive post order: ");
        System.out.println(recursivePostOrder);


    }

    // Pre-Order
    public static List<Integer> preOrderRecursive(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        preOrderHelper(root, result);
        return result;
    }

    public static void preOrderHelper(TreeNode root, List<Integer> result) {
        if(root == null) {
            return;
        }
        result.add(root.value);
        preOrderHelper(root.leftChild, result);
        preOrderHelper(root.rightChild, result);
    }

    // In-Order
    public static List<Integer> inOrderRecursive(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        inOrderHelper(root, result);
        return result;
    }

    public static void inOrderHelper(TreeNode root, List<Integer> result) {
        if(root == null) {
            return;
        }

        inOrderHelper(root.leftChild, result);
        result.add(root.value);
        inOrderHelper(root.rightChild, result);
    }

    // Posr-Order
    public static List<Integer> postOrderRecursive(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        postOrderHelper(root, result);
        return result;
    }

    public static void postOrderHelper(TreeNode root, List<Integer> result) {
        if(root == null) {
            return;
        }

        postOrderHelper(root.leftChild, result);
        postOrderHelper(root.rightChild, result);
        result.add(root.value);
    }
}
