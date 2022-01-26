# Our node is has 2 properties, a value, and a reference to next
from email import header


class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0

    def pushNode(self, value):
        newNode = Node(value)
        if self.head == None:
            self.head = newNode
            self.tail = newNode
            self.size += 1
            return
        else:
            newNode.next = self.head
            self.head = newNode
            self.size += 1

    def appendNode(self, value):
        newNode = Node(value)
        currentNode = self.head
        if self.head == None:
            self.pushNode(value)
            return
        else:
            while currentNode != None:
                currentNode = currentNode.next
            
            self.tail.next = newNode
            self.tail = newNode
            self.size += 1


    # stops at the n-1 index inside the while
    def printList(self):
        currentNode = self.head
        while currentNode != None:
            print(currentNode.value, end=" ")
            currentNode = currentNode.next
        print()
        

    def addNodeAfterIndex(self, value, index):
        newNode = Node(value)
        currentNode = self.head

        if self.isEmpty():
            self.pushNode(value)
            return

        # check if the given index would be out of bounds
        if index < 0:
            self.pushNode(value)
        elif index > self.size:
            self.appendNode(value)
        else:
            for index in range(0, index):
                currentNode = currentNode.next

            newNode.next = currentNode.next
            currentNode.next = newNode
            self.size += 1

    def addNodeBeforeIndex(self, value, index):
        newNode = Node(value)
        currentNode = self.head

        if self.isEmpty() or index <= 0:
            self.pushNode(value)
            self.size += 1
            return

        if index-1 > self.size:
            self.appendNode(value)
        else:
            for index in range(0, index-1):
                currentNode = currentNode.next
            newNode.next = currentNode.next
            currentNode.next = newNode
            self.size += 1

    def deleteNodeAtIndex(self, index):
        if self.isEmpty():
            print("No elements in list, try adding some")
            return
        if index > self.size or index < 0:
            print("invalid index")
            return 

        currentNode = self.head
        if index == 0:
            self.head = self.head.next
            self.size -= 1
            return

        for idx in range(0, index-1):
            if currentNode.next != None:
                currentNode = currentNode.next


        currentNode = currentNode.next.next
        self.size -= 1
                

    def isEmpty(self):
        if self.head == None:
            return True
            
L = LinkedList()
L.pushNode(10)
L.pushNode(9)
L.pushNode(8)
L.appendNode(12)
L.pushNode(5)
L.addNodeAfterIndex(6, 0)
L.addNodeAfterIndex(15, 99)
L.addNodeAfterIndex(7, 1)
L.addNodeAfterIndex(13, L.size-2)

L.pushNode(-5)
L.appendNode(22)
L.addNodeBeforeIndex(2, 1)
L.addNodeBeforeIndex(3, 2)
L.addNodeAfterIndex(-4, 0)
L.addNodeBeforeIndex(25, 13)
L.deleteNodeAtIndex(0)
L.deleteNodeAtIndex(1)





L.printList()

print("The head is: ", L.head.value)
print("The tail is: ", L.tail.value)



