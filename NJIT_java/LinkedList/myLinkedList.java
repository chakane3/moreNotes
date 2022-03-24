package NJIT_java.LinkedList;

public class myLinkedList {
    Node head;

    static class Node {
        int val;
        Node next;
        Node(int value) {
            this.val = value;
        }
    }

    public void pushNode(int num) {
        Node newNode = new Node(num);
        if(head == null) {
            head = newNode;
        } else {
            newNode.next = head;
            head = newNode;
        }
    }

    public void printList() {
        Node temp = head;
        while(head.next != null) {
            System.out.print(temp.val + " ");
            temp = temp.next;
        }
        System.out.print(temp.val+"\n");
    }

    public static void main(String[] args) {
        myLinkedList l = new myLinkedList();
        l.pushNode(10);
        l.printList();
    }
}
