require '01_undirected_graph'
require 'set'

def prims_algorithm(vertices)
  spanning_tree = []
  visited = Set.new
  fringe = Hash.new

  first_vertex = vertices.first
  visited.add(first_vertex)
  first_vertex.edges.each { |edge| fringe[edge.other_vertex(first_vertex)] = edge }

  until spanning_tree.length == vertices.length - 1
    min_vertex = fringe.min_by { |_vertex, edge| edge.cost }&.first
    edge = fringe.delete(min_vertex)
    spanning_tree.push(edge)
    visited.add(min_vertex)

    min_vertex.edges.each do |edge|
      current_vertex = edge.other_vertex(min_vertex)

      next if visited.include?(current_vertex)

      unless fringe[current_vertex] && edge.cost > fringe[current_vertex].cost
        fringe[current_vertex] = edge
      end
    end
  end

  spanning_tree
end
