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

// 2
// leetcode.addAtHead(7)
// leetcode.addAtHead(2)
// leetcode.addAtHead(1)
// leetcode.addAtIndex(3, 0)
// leetcode.deleteAtIndex(2)
// leetcode.addAtHead(6)
// leetcode.addAtTail(4)
// leetcode.get(4)

// 4
// leetcode.addAtHead(1)
// leetcode.addAtTail(3)
// leetcode.addAtIndex(1, 2)
// print("get(1): \(leetcode.get(1))")
// leetcode.deleteAtIndex(0)
// print("get(0): \(leetcode.get(0))")

// 6 
// leetcode.addAtHead(1)
// leetcode.addAtTail(3)
// leetcode.addAtIndex(1, 2)
// print("get(1): \(leetcode.get(1))")
// print()
// leetcode.deleteAtIndex(1)
// print("get(1): \(leetcode.get(1))")



// 8
// leetcode.addAtHead(1)
// leetcode.addAtTail(3)
// leetcode.addAtIndex(1, 2)
// print("get(1): \(leetcode.get(1))")
// leetcode.deleteAtIndex(1)
// print()
// print("get(1): \(leetcode.get(1))")
// print()


// 10
// leetcode.addAtHead(4)
// leetcode.get(1)
// leetcode.addAtHead(1)
// leetcode.addAtHead(5)
// leetcode.addAtHead(3)
// leetcode.deleteAtIndex(7)
// leetcode.addAtHead(3)
// leetcode.get(3)
// leetcode.get(3)
// leetcode.get(1)
// leetcode.deleteAtIndex(4)


// 52
// leetcode.addAtHead(4)
// print("get(1): \(leetcode.get(1))")
// print()
// leetcode.addAtHead(1)
// leetcode.addAtHead(5)
// leetcode.deleteAtIndex(3)
// leetcode.addAtHead(7)
// print("get(3): \(leetcode.get(3))")
// print("size: \(leetcode.size)")
// print()
// print("get(3): \(leetcode.get(3))")
// print()
// print("get(3): \(leetcode.get(3))")
// print()
// leetcode.addAtHead(1)
// leetcode.deleteAtIndex(4)

// 30
// leetcode.addAtHead(4)
// print("get(1): \(leetcode.get(1))")
// print()
// leetcode.addAtHead(1)
// leetcode.addAtHead(5)
// leetcode.deleteAtIndex(3)
// leetcode.addAtHead(7)
// print("get(3): \(leetcode.get(3))")
// print()
// print("get(3): \(leetcode.get(3))")
// print()
// print("get(3): \(leetcode.get(3))")
// print()
// leetcode.addAtHead(1)
// leetcode.deleteAtIndex(4)


// 63
leetcode.addAtIndex(1, 0)
print("get(0): \(leetcode.get(0))")
// print("size: \(leetcode.size)")


print("\nprintList(): ", terminator: " ")
leetcode.printList()