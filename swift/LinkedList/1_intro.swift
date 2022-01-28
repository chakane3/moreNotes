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

    /*
        Create a new node
        Check if our list is empty
            If it is, setup our head and tail as the node
        If its not empty, push the node in by setting newNode.next = head
        Increase our size
    */
    mutating func pushNode(val: Int) {
        let newNode = Node(val)
        if isEmpty() {
            head = newNode
            tail = head
        } else {
            newNode.next = head
            head = newNode
        }
        size += 1
    }

    /*
        Setup a the new node to append, and a temporary node
        Check if our list is empty
            If its empty, set the head and tail to our new node
            Increase size and return
        If our list isnt empty
            Traverse the list until were at the last element
            Then set the tail.next = newNode
            Set the tail = newNode
            Increase size and return
    */
    mutating func appendNode(val: Int) {
        let newNode = Node(val)
        var tempNode = head
        
        if isEmpty() {
            head = newNode
            tail = newNode
            size += 1
            return
        } else {
            while tempNode != nil {
                tempNode = tempNode?.next
            }
            tail?.next = newNode
            tail = newNode
            size += 1
            return
        }
    }

    mutating func addNodeAfterIndex(index: Int, val: Int) {

        if isEmpty() {
            self.pushNode(val: val)
            return
        }
        let newNode = Node(val)
        var currentNode = head

        if index > size {
            self.appendNode(val: val)
            return
        }

        for _ in 0..<index {
            currentNode = currentNode?.next
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
        size += 1

    }

    /*
        Push node if our list is empty or the given index is <= 0
            Return
        If neither of those apply above then setup our newNode and tempNode
        If index is >= self.size treat it as if the given index is size-1
            Return
        If anything else doesnt apply the traverse the list until we get to the gien index
    */
    mutating func addNodeBeforeIndex(index: Int, val: Int) {
        if isEmpty() || index <= 0 {
            self.pushNode(val: val)
            size += 1
            return
        }

        let newNode = Node(val)
        var currentNode = head

        if index >= size {
            for _ in 0..<self.size-3 {
                currentNode = currentNode?.next
            }
            newNode.next = currentNode?.next
            currentNode?.next = newNode
            size += 1
            return
        } else {
            for _ in 0..<index-1 {
                currentNode = currentNode?.next
            }
            newNode.next = currentNode?.next
            currentNode?.next = newNode
            size += 1
            return
        }
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
        if isEmpty() {
            print("No elements in list, try adding some to test deletion")
            return
        }
        if index > size || index < 0 {
            print("invalid index")
            return
        }
        var currentNode = head
        if index == 0 {
            head = head?.next
            size -= 1
            return
        }

        for _ in 0..<index-1 {
            currentNode = currentNode?.next
        }
        currentNode?.next = currentNode?.next?.next
        size -= 1
        return
    }

    mutating func updateNodeAtIndex(forIndex index: Int, value: Int) {
        if index < 0 || index > size || head == nil {
            print("nothing to see here")
        }
        var currentNode = head
        for _ in 0..<index {
            currentNode = currentNode?.next
        }
        currentNode?.val = value
    }

    func printList() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.val, terminator: " ")
            currentNode = currentNode?.next
        }
        print()
    }

    func recursivePrint(_ headNode: Node?) {
        guard headNode != nil else {
            print()
            return
        }
        print(headNode!.val, terminator: " ")
        return recursivePrint(headNode?.next)
    }

    func isEmpty() -> Bool {
        if self.head == nil {
            return true
        }
        return false
    }
}

var ll = LinkedList()
ll.pushNode(val: 10)
ll.appendNode(val: 12)
ll.pushNode(val: 5)
ll.addNodeAfterIndex(index: 0, val: 6)
ll.addNodeAfterIndex(index: 1, val: 7)
ll.addNodeAfterIndex(index: ll.size-2, val: 13)
ll.addNodeBeforeIndex(index: 3, val: 9)
ll.addNodeBeforeIndex(index: 0, val: 0)
ll.addNodeBeforeIndex(index: 90, val: 19)
ll.addNodeBeforeIndex(index: 6, val: 11)
ll.addNodeAfterIndex(index: 0, val: 4)
ll.deleteAtIndex(forIndex: 0)
ll.deleteAtIndex(forIndex: 1)
ll.deleteAtIndex(forIndex: 2)
ll.updateNodeAtIndex(forIndex: 0, value: 0)
ll.updateNodeAtIndex(forIndex: 6, value: 15)


ll.printList()
ll.recursivePrint(ll.head)
print("The head element is: \(ll.head!.val)")
print("The head element is: \(ll.tail!.val)")
