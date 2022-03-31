"""
A TreeNode has a value, and 2 refernces to either its left
or right child.

This node has definitions accosiated with the DT's functions
"""

class TreeNode: 
    def __init__(self, value):
        self.value = value
        self.rightChild = None
        self.leftChild = None

    def insert(self, value):
        if value < self.value:
            if self.leftChild is not None:
                self.leftChild.insert(value)
            else:
                self.leftChild = TreeNode(value)
        else:
            if self.rightChild is not None:
                self.rightChild.insert(value)
            else:
                self.rightChild = TreeNode(value)


# lnr
def inOrderTraversal(r):
    # if r checks if we have a value given
    if r:
        inOrderTraversal(r.leftChild)
        print(r.value,end=" ")
        inOrderTraversal(r.rightChild)

# nlr
def preOrderTraversal(r):
    if r:
        print(r.value, end=" ")
        preOrderTraversal(r.leftChild)
        preOrderTraversal(r.rightChild)

# lrn
def postOrderTraversal(r):
    if r:
        postOrderTraversal(r.leftChild)
        postOrderTraversal(r.rightChild)
        print(r.value, end=" ")


        

root = TreeNode(20)
root.insert(12)
root.insert(22)
print("pre order traversal: ", end=" ")
inOrderTraversal(root)
print()

print("post order traversal: ", end=" ")
preOrderTraversal(root)
print()

print("post order traversal: ", end=" ")
postOrderTraversal(root)


