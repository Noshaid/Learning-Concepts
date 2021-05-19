class Node<T> {
    var next: Node?
    weak var prev: Node?
    var data: T
    
    init(data: T) {
        self.data = data
    }
}

class LinkedList<T> {
    //head and rear node
    private var head: Node<T>?
    private var rear: Node<T>?
    
    var isEmpty: Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }
    var getHead: Node<T>? {
        guard head != nil else {
            return nil
        }
        return head
    }
    
    var getRear: Node<T>? {
        guard rear != nil else {
            return nil
        }
        return rear
    }
    var count: Int {
        if head == nil {
            return 0
        } else {
            var count = 1
            var traverser = head!.next
            while head !== traverser {
                count = count + 1
                traverser = traverser!.next
            }
            return count
        }
    }
    
    func insertAtEnd(node: Node<T>) {
        if head == nil {
            head = node
            rear = node
            node.next = node
            node.prev = node
        }else {
            var traverser = head
            // Last will point to new
            rear!.next = node
            //New next points to head
            node.next = head
            //New node's previous points to prev last
            node.prev = rear
            head?.prev = node
            rear = node
        }
    }
    
    func printList() {
        guard var node = head else {
            print("Linked List Empty")
            return
        }
        while head !== node.next {
            print("Item Data: \(node.data)")
            node = node.next!
        }
        print("Item Data: \(node.data)")
    }
}

//Initialize
let list1 = LinkedList<String>()
//Sample array elements to create items and insert.
let items1 = ["Hello","World","Welcome","To","Circular","Swift"]

for itm in items1 {
    let node = Node<String>(data: itm)
    list1.insertAtEnd(node: node)
}

print(list1.isEmpty)


