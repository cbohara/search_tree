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

  # iterative depth first preorder search
  def iterative_depth_first(target)
    return self if @value == target
    stack = []
    stack << self
    while !stack.empty?
      popped = stack.pop
      return popped if popped.get_value == target
      right_child = popped.get_right_pointer
      if !right_child.nil?
        stack << right_child
      end
      left_child = popped.get_left_pointer
      if !left_child.nil?
        stack << left_child
      end
    end
    return nil
  end

  # recursive depth first search
  def recursive_depth_first(target)
    match = @left.recursive_depth_first(target) unless @left.nil?
    return match unless match.nil?
    return self if @value == target
    return (@right.nil?) ? nil : @right.recursive_depth_first(target)
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

# root.iterative_depth_first(11)
# root.recursive_depth_first(11)
