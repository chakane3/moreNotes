import Foundation

// A Linked list is a collection of nodes with refrences to either another node or a nil (null) node.
// Heres what it would look like on paper: [nil] -> [1] -> [3] -> [2] -> [44] -> nil
// Here's and example of a single node in code:
public class Node {
    var val: Int
    var next: Node?

    // initialize our class with the given value
    init(_ value: Int) {
        self.val = value
        next = nil
    }
}

// We can then create another class to encapsulate our CRUD functions
struct LinkedList {
    var head: Node? 
    var tail: Node?
    var size: Int = 0
    init() {}

    mutating func pushNode(val: Int) {
        let newNode = Node(val)
        if head == nil {
            head = newNode
            tail = head
        } else {
            newNode.next = head
            head = newNode
        }
        size += 1
    }

    mutating func appendNode(val: Int) {
        let newNode = Node(val)
        var tempNode = head
        
        if head == nil {
            head = newNode
        } else {
            while tempNode != nil {
                tempNode = tempNode?.next
            }
            tail?.next = newNode
        }
        size += 1
    }

    mutating func addNodeAfterIndex(index: Int, val: Int) {
        let newNode = Node(val)
        var currentNode = head
        
        // check if the given index is bigger than the size of the list
        if self.size < index {
            appendNode(val: val)
            return
        }

        // check if the given index is smaller than 0
        if 0 > index {
            pushNode(val: val)
            return
        } 

        // check if our index is 0
        if index == 0 {
            newNode.next = currentNode?.next
            currentNode?.next = newNode
            size += 1
            return
        }

        // normal operation
        // The operation for adding after an index may look like this (i.e index = 1)
        //     [1] -> [2]   [4] -> [5]
        //             |     ^
        //             v     |
        // (new node) [3] -->
        // The reference at [3] should be pointed at [4] (newnode.next = currentnode.next)
        // The reference at [2] should be pointed to [3] (currentnode.next = newnode)
        for _ in 0...index-1{
            currentNode = currentNode?.next
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
        size += 1
    }

    mutating func addNodeBeforeIndex(index: Int, val: Int) {
        let newNode = Node(val)
        var currentNode = head

        // check if the given index is bigger than the size of the list
        if self.size < index {
            appendNode(val: val)
            return
        }

        // check if the given index is smaller than 0
        if 0 >= index {
            pushNode(val: val)
            return
        }

        // check if the index is 1
        if index == 1 {
            for _ in 0...index-1 {
                currentNode = currentNode?.next
            }
            newNode.next = currentNode
            head?.next = newNode
            size += 1
            return
        }
        
        // normal operation (assumes we have 2+ nodes)
        for _ in 0...index-2 {
            currentNode = currentNode?.next
        }
        // same process as appending at index
        newNode.next = currentNode?.next
        currentNode?.next = newNode
        size += 1
    }

    func get(forIndex index: Int) -> Int? {
        var currentNode = head

        if currentNode == nil {
            return -9999
        }

        for _ in 0...index-1 {
            currentNode = currentNode?.next
        }
        return currentNode?.val
    }

    mutating func deleteAtIndex(forIndex index: Int) {
        if head == nil {
            return
        }

        if index == 0 {
            head = head?.next
            return
        }
        // TODO: - Delete as normal
    }

    func printList() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.val, terminator: " ")
            currentNode = currentNode?.next
        }
        print()
    }

    
}


// This single node can have a link (reference) to another node. 
// Theres 2 ways we can add a node.
// Either, we can add BEFORE an index or AFTER an index
var ll = LinkedList()
ll.pushNode(val: 10)
ll.pushNode(val: 9)
ll.pushNode(val: 7)
ll.pushNode(val: 5)
ll.pushNode(val: 0)

ll.appendNode(val: 14)

// ll.addNodeAfterIndex(index: 0, val: 9)
// ll.addNodeAfterIndex(index: 2, val: 7)
// ll.addNodeAfterIndex(index: 3, val: 6)
// ll.addNodeAfterIndex(index: 22, val: -1)
// ll.addNodeAfterIndex(index: -2, val: 16)

// ll.addNodeBeforeIndex(index: 0, val: 18)
// ll.addNodeBeforeIndex(index: 1, val: 17)
// ll.addNodeBeforeIndex(index: 3, val: 12)

// ll.deleteAtIndex(forIndex: 0)
// ll.deleteAtIndex(forIndex: 22)

ll.printList()
