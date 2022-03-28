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

    public void appendNode(int num) {
        Node newNode = new Node(num);
        Node tempNode = head;
        if(head == null) {
            head = newNode;
        }
        while(tempNode.next != null) {
            tempNode = tempNode.next;
        }
        tempNode.next = newNode;
    }

    public void pushAtIndex(int num, int index) {
        Node newNode = new Node(num);
        Node tempNode = head;
        if(head == null) {
            head = newNode;
        }
        for(int i = 0; i < index-1; i++) {
            tempNode = tempNode.next;
        }
        // were at 7 here
        Node tmpRef = tempNode.next;
        tempNode.next = newNode;
        newNode.next = tmpRef;
        
    }

    public void printList() {
        Node temp = head;
        while(temp.next != null) {
            System.out.print(temp.val + " ");
            temp = temp.next;
        }
        System.out.print(temp.val+"\n");
    }

    public static void main(String[] args) {
        myLinkedList l = new myLinkedList();
        l.pushNode(10);
        l.pushNode(7);
        l.pushNode(5);
        l.appendNode(1);
        l.pushAtIndex(2, 0);
        l.printList();
    }
}
