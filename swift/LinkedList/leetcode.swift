import Foundation

class Node {
    var val: Int
    var next: Node?
    init(_ value: Int) {
        self.val = value
    }
}

class MyLinkedList {
    var head: Node?
    var tail: Node?
    var size: Int = 0
    init() {}
    

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
    
    
    func addAtIndex(_ idx: Int, _ val: Int) {
        let newNode = Node(val)
        var tempNode = head



        // check if we have a valid index
        if idx == 0   {
            addAtHead(val)
            return
        } 

        if idx < 0 || idx > size {
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

    func reverse() {
        var prev: Node? = nil
        var current = head
        while current != nil {
            let nextTmp = current?.next
            current?.next = prev
            prev = current
            current = nextTmp
        }
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
