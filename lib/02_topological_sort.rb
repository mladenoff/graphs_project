require_relative '00_directed_graph'

# Implementing topological sort using Kahn's algorithm.

# def topological_sort(vertices)
#   counter = Hash.new
#   queue = []
#   result = []
#   vertices.each { |vertex| counter[vertex] = vertex.in_edges.count }

#   until counter.all? { |vertex, count| count == -1 }  
#     current_pair = counter.find { |vertex, count| count == 0 }
#     raise "graph contains cycle" unless current_pair
#     current_vertex = current_pair[0]
#     counter[current_vertex] = -1
#     result.push(current_vertex)
#     current_vertex.out_edges.each { |edge| counter[edge.to_vertex] -= 1 }
#   end

#   result
# end

# Better version
def topological_sort(vertices)
  counter = Hash.new
  queue = []
  result = []
  vertices.each do |vertex|
    num_edges = vertex.in_edges.count 
    counter[vertex] = num_edges
    queue.push(vertex) if num_edges == 0
  end

  until queue.empty?
    current_vertex = queue.shift
    result.push(current_vertex)
    current_vertex.out_edges.each do |edge| 
      queue.push(edge.to_vertex) if (counter[edge.to_vertex] -= 1) == 0
    end
  end

  raise "graph contains cycle" unless result.length == vertices.length

  result
end

# Bonus: Implement topo sort with Tarjan's DFS algorithm. Do this
# *after* implementing Prim's algorithm.

# def topological_sort(vertices)
# end
