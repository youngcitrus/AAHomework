class GraphNode
  attr_accessor :val, :neighbors

  def initialize(val)
    self.val = val
    self.neighbors = []
  end

end

def bfs(starting_node, target_value)
    
    q = [starting_node]
    seen = [starting_node]
    until q.empty?
        node = q.shift
        if node.val == target_value
            return node
        else
            node.neighbors.each do |neighbor|
                q << neighbor unless seen.include?(neighbor)
                seen << neighbor
            end
        end
    end
    
    nil

end

def dfs(starting_node, target_value)
    return starting_node if starting_node.val == target_value
    # seen = [starting_node]
    starting_node.neighbors.each do |neighbor|
        # next if seen.include?(neighbor)
        # seen << neighbor
        result = dfs(neighbor, target_value)
        return result unless result.nil?
    end
    nil
end

# dfs above doesn't work for nodes that can't be accessed, can't pass a consistent
# seen array between different recursive iterations



a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "d")
p bfs(a, "f")