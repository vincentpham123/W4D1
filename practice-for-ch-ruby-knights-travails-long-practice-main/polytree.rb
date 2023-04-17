

class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        if parent == nil
            @parent = node
            node.children << self
        else
            @parent.children.delete(self)
            @parent = node
            node.children << self if !@parent.nil?
        end
    end

    def add_child(node)
        if self.children.none?(node)
            node.parent= self
        end
    end

    def remove_child(node)
        if self.children.include?(node)
            self.children.delete(node)
            node.parent= nil
        else
            raise "this is not a child"
        end
    end

    def dfs(target)
        return self if self.value == target

        self.children.each do |child|
            rec = child.dfs(target)
            return rec if !rec.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            first_ele = queue.shift
            if first_ele.value == target
                return first_ele
            else
                first_ele.children.each do |child|
                    queue << child
                end
            end
        end
        nil
    end
end