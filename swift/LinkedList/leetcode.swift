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
    
    func get(_ index: Int) -> Int {
        if index >= size { return -1 }
        if size == 1 && index == 1 { return -1 }
        var currentNode = head
        for _ in 0..<index {
            print("hi")
            currentNode = currentNode?.next
        }
        return currentNode!.val
    }
    
    func addAtHead(_ val: Int) {
        let newNode = Node(val)
        if isEmpty() {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
        size += 1
    }
    
    func addAtTail(_ val: Int) {
        let newNode = Node(val)
        var currentNode = head

        if isEmpty() {
            head = newNode
            tail = newNode
            size += 1
            return
        }
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = newNode
        size += 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if isEmpty() || index <= 0 {
            self.addAtHead(val)
            return
        }

        var current = head
        var prev: Node?
        for _ in 0..<index {
            prev = current
            current = current?.next
        }
        var node = Node(val)
        prev?.next = node
        node.next = current
        size += 1

    }
    
    func deleteAtIndex(_ index: Int) {
        if isEmpty() {
            print("No elements in list, try adding some to test deletion")
            return
        }
        if index >= size || index < 0 {
            print("invalid index")
            return
        }
        var currentNode = head
        if index == 0 {
            head = head?.next
        } else {
            for _ in 0..<index-1 {
                currentNode = currentNode?.next
            }
            currentNode?.next = currentNode?.next?.next
        }
        size -= 1
        return
    }

    func printList() {
        // check if list is empty
        guard let head = head else { return }
        var currentNode: Node? = head

        while currentNode != nil {
            print(currentNode!.val, terminator: " ")
            currentNode = currentNode!.next
        }
        print()
    }

    func isEmpty() -> Bool {
        if self.head == nil {
            return true
        }
        return false
    }
}

var leetcode = MyLinkedList()
