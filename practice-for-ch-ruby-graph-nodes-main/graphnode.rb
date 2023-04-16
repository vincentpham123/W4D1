require 'set'
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
    #i want to had a starting point, and see if that starting point will lead to the target
    # to do that i will need a queue since this is bfs, and i will need a visited to avoid a infinite loop 
    # i will will to check each neighbor against the visited to avoid the loop 
    queue = [start]
    visited=Set.new()
    while !queue.empty? # keep looping until we go through all neighbors
        check = queue.shift # first in, first out
        if !visited.include?(check)
            return check.value if check.value == target 
            visited.add(check)
            queue += check.neighbors
        end
    end
        nil
end

def dfs(start,target,visited=Set.new())
    return start.value if start.value == target
    return nil if visited.include?(start)
    visited.add(start)
    start.neighbors.each do |neighbor|
        stack = dfs(neighbor,target,visited)
        if stack 
            return stack
        end
    end
    nil
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
p dfs(a,'f')