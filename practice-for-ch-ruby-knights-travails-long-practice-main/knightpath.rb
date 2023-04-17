require_relative 'polytree'
class KnightPathFinder
    attr_reader :considered_positions, :initial_position
    def initialize (initial_position)
    @initial_position = PolyTreeNode.new(initial_position)
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
        valid_moves = KnightPathFinder.valid_moves(pos)
        valid_moves.each do |pos|
            @considered_positions<< pos if !@considered_positions.include?(pos)
        end
    end
     #Phase 2

    def build_move_tree(target)
        

        until @considered_positions.empty? 
            check = queue.shift 
            if check==target 
                return target
            else
                new_move_positions(check)
            end
        end
        nil
    end



        


    
end
