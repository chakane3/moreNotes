package NJIT_java.Trees;

public class BinaryTree {
    int size = 0;
    
    static class Node {
        Node rightChild;
        Node leftChild;
        int value;
        Node(int value) {
            this.value = value;
        }
    }

    /* Recursive Solution */
    public void insertR(Node root, int val) {
        // check wether or not the value to insert is greater 
        // than the current nodes value
        if(val < root.value) {

            // if the value to insert is greater then attach it on the left
            if(root.leftChild != null) {
                insertR(root, val);
            } else {
                Node newNode = new Node(val);
                root.leftChild = newNode;
            }
        } else {
            // the the value is less than, then attach it on the right
            if(root.rightChild != null) {
                insertR(root, val);
            } else {
                Node newNode = new Node(val);
                root.rightChild = newNode;
            }
        }
    }

    /* Iterative Solution */
    public Node insert(Node root, int val) {
        // edge case: if no root exists
        if(root == null) return new Node(val);
        Node currentNode = root;
        while(true) {

            // if our current node's value is less than the given value
            if(currentNode.value <= val) {

                // traverse all the way down to the right until 
                // we find a null place to put a new node
                if(currentNode.rightChild != null) {
                    currentNode = currentNode.rightChild;
                } else {
                    currentNode.rightChild = new Node(val);
                    break;
                }
            } else {
                // traverse all the way down to left side until
                // we find a null place to put a new node
                if(currentNode.leftChild != null) {
                    currentNode = currentNode.leftChild;
                } else {
                    currentNode.leftChild = new Node(val);
                    break;
                }
            }
        }
        return root;
    }

    public void inOrderTraversal(Node root) {
        
    }

    public static void main(String[] args) {
        BinaryTree bt = new BinaryTree();
        Node root = new Node(10);
        bt.insert(root, 12);
    }
}
