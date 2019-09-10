require "set"



class GraphNode

    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    def add_neighbors(neighbor)
        self.neighbors += neighbor
    end

end


def bfs(starting_node, target)
    visted = Set.new()
    q = [starting_node]

    until q.empty?

        curr_node = q.shift
        unless visted.include?(curr_node)
            return curr_node.val if curr_node.val == target
            q.push(*curr_node.neighbors)
            visted.add(curr_node)
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


a.add_neighbors([b, c, e])
c.add_neighbors([b, d])
e.add_neighbors([a])
f.add_neighbors([e])

puts bfs(a, "b")
puts ""
puts bfs(a, "f")


