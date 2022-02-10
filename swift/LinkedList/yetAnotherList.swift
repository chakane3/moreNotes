import Foundation

public class Node {
    var val: Int
    var next: Node?

    init(_ val: Int) {
        self.val = val
        next = nil
    }
}
struct LinkedList {
    var head: Node?
    var tail: Node?
    var size: Int = 0
    init() {}
}

extension LinkedList {

    mutating func pushNode(_ val: Int) {
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

    mutating func appendNode(_ val: Int) {
        let newNode = Node(val)
        var tempNode = head

        // our list is empty
        if tempNode == nil {
            pushNode(val)
            return
        }

        // traverse to the end of the list
        for _ in 0..<size-1 {
            
            tempNode = tempNode?.next
        }
        tempNode?.next = newNode
        size += 1
    }

    mutating func insertBefore(_ val: Int, _ idx: Int) {
        let newNode = Node(val)
        var tempNode = head

        // check if list is empty
        if tempNode == nil || idx <= 0 {
            pushNode(val)
            return
        }

        for _ in 0..<idx-1 {
            tempNode = tempNode?.next
        }
        newNode.next = tempNode?.next
        tempNode?.next = newNode
        size += 1
    }

    mutating func deleteAtIndex(_ idx: Int) {
        if idx > size || idx < 0 {
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
        
        if idx < 0 || idx > size {
            return -1
        } else {
            for _ in 0..<idx {
                tempNode = tempNode?.next
            }
            return tempNode!.val
        }
    }

    func printList(_ headNode: Node?) {
        guard headNode != nil else {
            print()
            return
        }
        print(headNode!.val, terminator: " ")
        return printList(headNode!.next)
    }

}

var ll = LinkedList()
ll.pushNode(5)
ll.appendNode(7)
ll.insertBefore(6, 0)
ll.deleteAtIndex(0)

ll.printList(ll.head)