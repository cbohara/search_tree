class TreeNode
  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def set_value(value)
    @value = value
  end

  def set_left_pointer(node)
    @left = node if node.is_a?(TreeNode)
  end

  def set_right_pointer(node)
    @right = node if node.is_a?(TreeNode)
  end

  def get_value
    @value
  end

  def get_left_pointer
    @left
  end

  def get_right_pointer
    @right
  end

  def to_s
    return "#{@value}"
  end

  # breadth first iterative using queue
  def iterative_breadth_first(target)
    return self if self.get_value == target
    queue = []
    queue << self
    while !queue.empty?
      front_node = queue.shift
      return front_node if front_node.get_value == target
      left_child = front_node.get_left_pointer
      if !left_child.nil?
        queue << left_child
      end
      right_child = front_node.get_right_pointer
      if !right_child.nil?
        queue << right_child
      end
    end
    return nil
  end
end

deep_node5 = TreeNode.new(5)
node11 = TreeNode.new(11)
node4 = TreeNode.new(4)
node9 = TreeNode.new(9, node4)
node6 = TreeNode.new(6, deep_node5, node11)
node7 = TreeNode.new(7, nil, node6)
shallow_node5 = TreeNode.new(5, nil, node9)
root = TreeNode.new(2, node7, shallow_node5)

# root.iterative_breadth_first(3)
