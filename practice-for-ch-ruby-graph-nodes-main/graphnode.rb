class GraphNode 
    attr_reader :neighbors, :value
    def initialize(value)
        @neighbors=[]
        @value = value
    end

    def neighbors=(array)
        @neighbors = array 
    end
end

def bfs(start,target)
    queue = [start]
    visited = []

    while !queue.empty?
        node = queue.shift
        if !visited.include?(node)
            return node.value if node.value == target 
            visited << node 
            queue += node.neighbors
        end
    end
    return nil 
end

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

p bfs(a,'f')