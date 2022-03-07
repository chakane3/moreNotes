import Foundation

class Node {
    var val: Int
    var next: Node?
    init(_ value: Int) {
        self.val = value
    }
}

/*
    Our linkedlist has a Node -> [val | next] which must be inialized with a value upon creation.
    The linked list itself starts off with a head with an optional node value.
    We dont intialize the list when creating a new one.
*/
class MyLinkedList {
    var head: Node?
    var size: Int = 0
    init() {}
    

    /*
        To add a new node at the head, we first check if the list is empty
        if so, we just set the head as the new node.

        If our list isnt empty, we set the newNode's next to the current head
        and then set our head as the new nodes value.
    */
    func addAtHead(_ val: Int) {
        let newNode = Node(val)
        if head == nil {
            head = newNode
            size += 1
            return
        }
        newNode.next = head
        head = newNode
        size += 1
    }
    
    /*
        To add a node at the tail, we first check if the list is empty
        If so, we recycle the addAtHead(_ val: Int) method.

        If not, we need to traverse the list until we get to the last node.
        Once we're at the last node we set the tempNode's (the last node) next reference as the new node.
    */
    func addAtTail(_ val: Int) {
        let newNode = Node(val)
        var tempNode = head

        // our list is empty
        if tempNode == nil {
            addAtHead(val)
            return
        }

        // traverse to the end of the list
        for _ in 0..<size-1 {
            
            tempNode = tempNode?.next
        }
        tempNode?.next = newNode
        size += 1
    }
    
    
    /*
        This function adds a node before the given index.
        We first check if we have a valid index, then check if the list is empty.

        If were good to go, we traverse the node until the tempnode is the before the given index node
        Then we insert the newNode's next as our temp node,
        then we set the tempnode's next as the newnode
    */
    func addAtIndex(_ idx: Int, _ val: Int) {
        let newNode = Node(val)
        var tempNode = head

        // check if we have a valid index
        if idx == 0   {
            addAtHead(val)
            return
        }

        // if index equals the length, then append
        if idx == size {
            addAtTail(val)
            return
        }

        if idx < 0 || idx > size - 1{
            return
        }

        for _ in 0..<idx-1 {
            tempNode = tempNode?.next
        }
        newNode.next = tempNode?.next
        tempNode?.next = newNode
        size += 1
    }
    
    /*
        We check to see if our index is valid input for our list
        If our index is 0 we can just rplace the head with the node next to it

        Otherwise we just traverse until we get to the node we want to delete
        We then just set the tempNode's next to the .next.next as a way to skip over .next
    */
    func deleteAtIndex(_ idx: Int) {
        if idx+1 > size || idx < 0 {
            return
        }

        var tempNode = head
        if idx == 0 {
            head = tempNode?.next
            size -= 1
            return
        }
        for _ in 0..<idx - 1 {
            tempNode = tempNode?.next
        }
        tempNode?.next = tempNode?.next?.next
        size -= 1
    }
    
    func get(_ idx: Int) -> Int {
        var tempNode = head
        
        if idx < 0 || idx+1 > size {
            return -1
        } else {
            for _ in 0..<idx {
                tempNode = tempNode?.next
            }
            return tempNode!.val
        }
    }

    /*
        We set up 3 pointers: Prev, Current, Next (P,C,N)
        As long as our list isnt empty or the current node isnt nil we will set up our pointers as such:

        P       C     N
        nil ->  1 ->  2 -> 3 ->

        Everytime we run our loop we effectively reverse the reference to point to prev
        After this single reversal we then shift P,C,N to the next nodes and repeat the process until C == nil
        At the end we set our head = prev
    */
    func reverse() {
        var prev: Node? = nil
        var current = head
        var nxt: Node? = nil
        while current != nil {
            nxt = current?.next
            current?.next = prev
            prev = current
            current = nxt
        }
        head = prev
    }

    func recursivePrint(_ headNode: Node?) {
        guard headNode != nil else {
            print()
            return
        }
        print(headNode!.val, terminator: " ")
        return recursivePrint(headNode?.next)
    }
}

var ll = MyLinkedList()
ll.addAtHead(5)
ll.addAtHead(4)
ll.addAtHead(3)
ll.addAtHead(2)
ll.addAtHead(1)

ll.recursivePrint(ll.head)
ll.reverse()
ll.recursivePrint(ll.head)




/* Check is the linked list has a cycle

This uses a 2 pointer approach

func hasCycle(_ head: Node?) -> Bool {
    do {
        var slow = head
        var fast = head.next
        while(slow != fast) {
            slow = slow.next
            fast = fast.next.next
        }
        return true
    } catch {
        return false
    }
}


*/
