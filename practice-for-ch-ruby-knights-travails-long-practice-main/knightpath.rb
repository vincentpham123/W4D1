require_relative 'polytree'
class KnightPathFinder
    attr_reader :considered_positions, :initial_position
    attr_accessor :root_node

    def initialize (initial_position)
    @initial_position = initial_position
    @considered_positions=[initial_position]
    end

    def self.valid_moves(position)
        
        row = position[0]
        col = position[1]
        valid = [row+2,col+1],[row-2,col-1],[row+1,col+2],[row-1,col-2],[row-2,col+1],[row+2,col-1],[row+1,col-2],[row-1,col+2]
     
        valid.select! do |positions|
            positions.all? {|position| position <8 && position>-1}
        end
        valid
    end

    def new_move_positions(pos)
        result = []
        moves = KnightPathFinder.valid_moves(pos)
        moves.each do |pos1|
            if !@considered_positions.include?(pos1)
                @considered_positions<< pos1
                result << pos1
            end
        end
        result
    end
     #Phase 2

    def build_move_tree
        self.root_node = PolyTreeNode.new(initial_position)
        queue=[root_node]
        until queue.empty?
            check = queue.shift
            check_pos = check.value
            moves = new_move_positions(check_pos)
            moves.each do |next_move|
                next_node = PolyTreeNode.new(next_move)
                queue << next_node
              
                check.add_child(next_node)
            end
        end
    end
    def trace_path_back(node)
        path =[]
        queue=[node]
        until queue.empty?
            next_level =  queue.shift
            path << next_level.value
            if !next_level.parent.nil?
                queue << next_level.parent
            end
        end
        path.reverse

    end
        
    def find_path_bfs(end_pos)
        queue = [root_node]
        until queue.empty?
            check = queue.shift
            if check.value == end_pos
                return check
            else
                check.children.each do |child|
                    queue << child 
                end
            end
        end
        nil

    end


    def find_path_dfs(end_pos)
        root_node.dfs(end_pos)  

    end

end

test= KnightPathFinder.new([0,0])
test.build_move_tree
test_bfs = test.find_path_bfs([6,2])
p test.trace_path_back(test_bfs)

        


