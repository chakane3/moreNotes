
public class BinaryInsert {
    

    public static void main(String[] args) {
        // TreeNode node = new TreeNode(50);
        // insertNode(node, 45);
        // insertNode(node, 70);
        // insertNode(node, 77);
        // insertNode(node, 12);
        // insertNodeIterative(node, 45);
        // insertNodeIterative(node, 12);
        // insertNodeIterative(node, 30);
        // insertNodeIterative(node, 44);

    }

    // Recursive
    // Uses the call stack to traverse down either 
    // left or right depending on the value of the given root node.
    public static void insertNode(TreeNode root, int val) {

        if(val < root.value) {
            if(root.leftChild != null) {
                insertNode(root.leftChild, val);
            } else {
                TreeNode newNode = new TreeNode(val);
                root.leftChild = newNode;
            }

        } else {
            if(root.rightChild != null) {
                insertNode(root.rightChild, val);
            } else {
                TreeNode newNode = new TreeNode(val);
                root.rightChild = newNode;
            }

        }

    }

    // Iterative
    // 
    public static TreeNode insertNodeIterative(TreeNode root, int val) {
        if(root == null) return new TreeNode(val);
        TreeNode currentNode = root;
        while(true) {
            if(currentNode.value <= val) {
                if(currentNode.rightChild != null) {
                    currentNode = currentNode.rightChild;
                } else {
                    currentNode.rightChild = new TreeNode(val);
                    break;
                }
            } else {
                if(currentNode.leftChild != null) {
                    currentNode = currentNode.leftChild;
                } else {
                    currentNode.leftChild = new TreeNode(val);
                    break;
                }
            }
        }
        return root;
    }
}
