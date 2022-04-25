
import java.util.List;
import java.util.Stack;
import java.util.ArrayList;

public class BinaryTree {
    int size = 0;
    
    static class TreeNode {
        TreeNode rightChild;
        TreeNode leftChild;
        int value;
        TreeNode(int value) {
            this.value = value;
        }
    }

    /* Recursive Solution */
    public void insertR(TreeNode root, int val) {
        // check wether or not the value to insert is greater 
        // than the current nodes value
        if(val < root.value) {

            // if the value to insert is greater then attach it on the left
            if(root.leftChild != null) {
                insertR(root, val);
            } else {
                TreeNode newNode = new TreeNode(val);
                root.leftChild = newNode;
            }
        } else {
            // the the value is less than, then attach it on the right
            if(root.rightChild != null) {
                insertR(root, val);
            } else {
                TreeNode newNode = new TreeNode(val);
                root.rightChild = newNode;
            }
        }
    }

    /* Iterative Solution */
    public TreeNode insert(TreeNode root, int val) {
        // edge case: if no root exists
        if(root == null) return new TreeNode(val);
        TreeNode currentNode = root;
        while(true) {

            // if our current node's value is less than the given value
            if(currentNode.value <= val) {

                // traverse all the way down to the right until 
                // we find a null place to put a new node
                if(currentNode.rightChild != null) {
                    currentNode = currentNode.rightChild;
                } else {
                    currentNode.rightChild = new TreeNode(val);
                    break;
                }
            } else {
                // traverse all the way down to left side until
                // we find a null place to put a new node
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

    // were given a binary tree in the form of a list and we return a List
    // this is an iterative solution
    public List <Integer> inOrderTraversal(TreeNode root) {
        Stack<TreeNode> stack = new Stack<>();
        List<Integer> output = new ArrayList<>();

        if(root == null) {
            return output;
        }

        TreeNode current = root;
        while(current != null || !stack.isEmpty()) {
            // left traversal
            while(current != null) {
                stack.push(current);
                current = current.leftChild;
            }

            // node hit
            current = stack.pop();
            output.add(current.value);

            // right traversal
            current = current.rightChild;
        }
        return output;
    }


    public List <Integer> preorderTraversal(TreeNode root) {
        Stack<TreeNode> stack = new Stack<>();
        List<Integer> output = new ArrayList<>();

        if (root == null) {
            return output;
        }

        stack.push(root);
        while(!stack.isEmpty() && root != null) {
            TreeNode node = stack.pop();
            output.add(node.value);

            if(node.rightChild != null) {
                stack.push(node.rightChild);
            }

            if(node.leftChild != null) {
                stack.push(node.leftChild);
            }
        }
        return output;
    }
 
    // similar as post order traversal except line 139
    public List<Integer> postorderTraversal(TreeNode root) {
        Stack<TreeNode> stack = new Stack<>();
        List<Integer> output = new ArrayList<>();

        if (root == null) {
            return output;
        }

        stack.push(root);
        while(!stack.isEmpty() && root != null) {
            TreeNode node = stack.pop();
            output.add(0, node.value);

            if(node.leftChild != null) {
                stack.push(node.leftChild);
            }

            if(node.rightChild != null) {
                stack.push(node.rightChild);
            }
        }
        return output;
    }

    /*
        Recursive solutions for traversals
    */

    public static List<Integer> inorder(TreeNode root) {
        List<Integer> output = new ArrayList<>();
        if(root == null) return output;
        inorderR(root, output);
        return output;
    }

    public static void inorderR(TreeNode root, List<Integer> output) {
        if(root != null) {
            inorderR(root.leftChild, output);
            output.add(root.value);
            inorderR(root.rightChild, output);
        }
    }

    public static List<Integer> preorder(TreeNode root) {
        List<Integer> output = new ArrayList<>();
        if(root == null) return output;
        preorderR(root, output);
        return output;
    }

    public static void preorderR(TreeNode root, List<Integer> output) {
        if(root != null) {
            output.add(root.value);
            preorderR(root.leftChild, output);
            preorderR(root.rightChild, output);
        }
    }

    public static List<Integer> postorder(TreeNode root) {
        List<Integer> output = new ArrayList<>();
        if(root == null) return output;
        postorderR(root, output);
        return output;
    }

    public static void postorderR(TreeNode root, List<Integer> output) {
        if(root != null) {
            postorderR(root.leftChild, output);
            postorderR(root.rightChild, output);
            output.add(root.value);
        }
    }

    public static int height(TreeNode root) {
        if(root == null) return 0;
        int left = height(root.leftChild);
        int right = height(root.rightChild);
        return 1+Math.max(left,right);
    }





    public static void main(String[] args) {
        BinaryTree bt = new BinaryTree();
        TreeNode root = new TreeNode(18);
        bt.insertR(root, 10); // test recursive solution
        bt.insertR(root, 30);
        bt.insertR(root, 8);
        bt.insertR(root, 13);
        bt.insertR(root, 15);
        bt.insertR(root, 32);
     
        System.out.println("Iterative traversals");
        List<Integer> inorder = bt.inOrderTraversal(root);
        System.out.println("inorder traversal: " + inorder);

        List<Integer> preorder = bt.preorderTraversal(root);
        System.out.println("preorder traversal: " + preorder);

        List<Integer> postorder = bt.postorderTraversal(root);
        System.out.println("postorder traversal: " + postorder);

        System.out.println("\nRecursive traversals");
        List<Integer> inorderR = bt.inorder(root);
        System.out.println("inorder traversal: " + inorderR);

        List<Integer> preorderR = bt.preorder(root);
        System.out.println("preorder traversal: " + preorderR);

        List<Integer> postorderR = bt.postorder(root);
        System.out.println("postorder traversal: " + postorderR);

        System.out.println("\nThe height of the tree is: " + height(root));

    }
}
