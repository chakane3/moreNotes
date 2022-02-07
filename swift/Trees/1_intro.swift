import Foundation

/* Binary Trees

Recall, binary search. 2 assumptions we can make is that our input is sorted
and that it runs in O(log n) due to its divide and conquer appraoch

Each node has a root value and a list of references to other nodes 
called child nodes (left and right child nodes). We view a tree as 
having N nodes and N-1 edges (references).

When inserting a value, if the value is less than the root value it goes on 
the left of the parent node. if the value is greater than or equal to the root
value, it goes on the right.


Theres different traversal methods we can use tp search for a node
1. breadth - first
2. depth - first
    in-order
    pre order
    post order

*/

// TODO: See if we can create a BT instance
// struct BinaryTree {
//     var parent: Node?
//     var leftChild: Node?
//     var rightChild: Node?
//     var size = 0
//     init() {}
// }

public class Node {
    var leftChild: Node?
    var rightChild: Node?
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
}

extension Node {
    func insert(_ value: Int) {

        // go left if the inserted value is greater than the current nodes value
        if value < self.value {
            if leftChild != nil {
                // keep calling insert recursivelt on our left node
                leftChild!.insert(value)
            } else {
                // create a new node and attach as left child
                leftChild = Node(value)
            }
        } else {
            if rightChild != nil {
                // call insert recursively on the right child
                rightChild!.insert(value)
            } else {
                rightChild = Node(value)
            }
        }
    }

    func inOrderTraversal() {
        leftChild?.inOrderTraversal()
        print("\(value)", terminator: " ")
        rightChild?.inOrderTraversal()

    }
}

let rootNode = Node(12)
rootNode.insert(5)
rootNode.insert(14)
rootNode.insert(34)
rootNode.insert(0)
rootNode.insert(13)

rootNode.inOrderTraversal()








