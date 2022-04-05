package NJIT_java.Trees;
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



    public static void main(String[] args) {
        BinaryTree bt = new BinaryTree();
        TreeNode root = new TreeNode(18);
        bt.insertR(root, 10); // test recursive solution
        bt.insert(root, 30);
        bt.insert(root, 8);
        bt.insert(root, 13);
        bt.insert(root, 15);
        bt.insert(root, 32);
     

        List<Integer> inorder = bt.inOrderTraversal(root);
        System.out.println("inorder traversal: " + inorder);

        List<Integer> preorder = bt.preorderTraversal(root);
        System.out.println("preorder traversal: " + preorder);

        List<Integer> postorder = bt.postorderTraversal(root);
        System.out.println("postorder traversal: " + postorder);

    }
}