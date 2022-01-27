import Foundation

/* Binary Trees

Each node has a root value and a list of references to other nodes 
called child nodes (left and right child nodes). We view a tree as 
having N nodes and N-1 edges (references).

*/


public class Node {
    var leftChild: Node?
    var rightChild: Node?
    var value: Int?
    init(_ value: Int) {
        self.value = value
    }
}

struct BinaryTree {
    var parent: Node?
    var leftChild: Node?
    var rightChild: Node?
    var size = 0
    init() {}

    mutating func addNode(_ value: Int) {
        var currentNode = self.parent
        if self.parent == nil {
            print("we have nothing here")
        }
    }
}

var bt = BinaryTree()
bt.addNode(3)
