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
        var currentNode = head
        print("size: \(size)")
        print("index: \(index)")
        if currentNode == nil || index < 0 || index > size-1 {
            return -1
        }
        for _ in 0..<index {
            currentNode = currentNode!.next
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

        let newNode = Node(val)
        var currentNode = head
        if index >= size {
            for _ in 0..<index-1 {
                
                currentNode = currentNode?.next
            }
            newNode.next = currentNode?.next
            currentNode?.next = newNode
        } else {
            for _ in 0..<index-1 {
                currentNode = currentNode?.next
            }
            newNode.next = currentNode?.next
            currentNode?.next = newNode
        }
        size += 1
    }
    
    func deleteAtIndex(_ index: Int) {
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

// 2
// leetcode.addAtHead(7)
// leetcode.addAtHead(2)
// leetcode.addAtHead(1)
// leetcode.addAtIndex(3, 0)
// leetcode.deleteAtIndex(2)
// leetcode.addAtHead(6)
// leetcode.addAtTail(4)
// leetcode.get(4)


// 10
// leetcode.addAtHead(1)
// leetcode.addAtTail(3)
// leetcode.addAtIndex(1, 2)
// print("get(1): \(leetcode.get(1))")
// leetcode.deleteAtIndex(1)
// print()
// print("get(1): \(leetcode.get(1))")
// print()

// 52
leetcode.addAtHead(4)
leetcode.get(1)
leetcode.addAtHead(1)
leetcode.addAtHead(5)
leetcode.deleteAtIndex(3)
leetcode.addAtHead(7)
print("get(3): \(leetcode.get(3))")
print("get(3): \(leetcode.get(3))")
print()
print("get(3): \(leetcode.get(3))")
print()
leetcode.addAtHead(1)
leetcode.deleteAtIndex(4)


leetcode.printList()