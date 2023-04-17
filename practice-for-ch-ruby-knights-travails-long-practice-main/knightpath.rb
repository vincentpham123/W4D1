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
        valid_moves = KnightPathFinder.valid_moves(pos)
        valid_moves.each do |pos|
            if !@considered_positions.include?(pos)
                @considered_positions<< pos
                result << pos
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
end


        


