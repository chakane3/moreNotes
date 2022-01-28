# Our node is has 2 properties when created, a value, and a reference to next
class Node:
    def __init__(self, value):
        self.value = value
        self.next = None

# Our linked list has 3 properties when created
# a head, tail, and the size of the list
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
        
    def addNodeAfterIndex(self, value, index):
        newNode = Node(value)
        currentNode = self.head
        # check if our list is empty
        if self.isEmpty == True:
            self.pushNode(value)
            return

        # check if the given index would be out of bounds
        elif index > self.size:
            self.appendNode(value)
        else:
            for index in range(0, index):
                currentNode = currentNode.next

            newNode.next = currentNode.next
            currentNode.next = newNode
            self.size += 1

    def addNodeBeforeIndex(self, value, index):

        # check if the list is empty or if the index is <= 0
        if self.isEmpty == True or index <= 0:
            self.pushNode(value)
            self.size += 1
            return

        # setup newnode and tempnode
        newNode = Node(value)
        currentNode = self.head   

        # if index is >= self.size treat it as if the given index is size-1
        if index >= self.size:
            for index in range(0, self.size-3):
                currentNode = currentNode.next
            newNode.next = currentNode.next
            currentNode.next = newNode
            self.size += 1
            return
            
        else:
            for index in range(0, index-1):
                currentNode = currentNode.next
            newNode.next = currentNode.next
            currentNode.next = newNode
            self.size += 1

    def deleteNodeAtIndex(self, index):
        if self.isEmpty == True:
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
        currentNode.next = currentNode.next.next
        self.size -= 1
        return
                

    def isEmpty(self):
        if self.head == None:
            return True
        return False

    # stops at the n-1 index inside the while
    def printList(self):
        currentNode = self.head
        while currentNode != None:
            print(currentNode.value, end=" ")
            currentNode = currentNode.next
        print()
            
L = LinkedList()
L.pushNode(10)
L.appendNode(12)
L.pushNode(5)
L.addNodeAfterIndex(6, 0)
L.addNodeAfterIndex(7, 1)
L.addNodeAfterIndex(13, L.size-2)
L.addNodeBeforeIndex(9, 3)
L.addNodeBeforeIndex(0, 0)
L.addNodeBeforeIndex(19, 90)
L.addNodeBeforeIndex(11, 6)
L.addNodeAfterIndex(4, 0)

L.deleteNodeAtIndex(0)
L.deleteNodeAtIndex(1)
L.deleteNodeAtIndex(2)

L.printList()
print("The head is: ", L.head.value)
print("The tail is: ", L.tail.value)


""" final output

4 6 9 10 11 13 19 12 
The head is:  4
The tail is:  12
"""