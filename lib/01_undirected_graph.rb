class UndirectedVertex
  attr_reader :value, :edges

  def initialize(value)
    @value = value
    @edges = []
  end
end

class UndirectedEdge
  attr_reader :vertices, :cost

  def initialize(vertex1, vertex2, cost = 1)
    @vertices = [vertex1, vertex2]
    vertex1.edges.push(self)
    vertex2.edges.push(self)
    @cost = cost
  end

  def destroy!
    @vertices.first.edges.delete(self)
    @vertices.last.edges.delete(self)
    @vertices = nil
  end

  def other_vertex(vertex)
    raise "vertex is at neither end" unless @vertices.include?(vertex)
    @vertices.each { |v| return v if v != vertex }
  end
end
