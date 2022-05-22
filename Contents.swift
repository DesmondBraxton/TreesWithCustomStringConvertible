import UIKit


class Node {
  var value: String
  var children: [Node] = []
  weak var parent: Node?

  init(value: String) {
    self.value = value
  }

  func add(child: Node) {
    children.append(child)
    child.parent = self
  }
}

// 1
extension Node: CustomStringConvertible {
  // 2
  var description: String {
    // 3
    var text = "\(value)"
    
   // 4
    if !children.isEmpty {
      text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
    }
    return text
  }
}

extension Node {
  // 1
  func search(value: String) -> Node? {
    // 2
    if value == self.value {
      return self
    }
    // 3
    for child in children {
      if let found = child.search(value: value) {
        return found
      }
    }
    // 4
    return nil
  }
}

