require 'spec_helper'

require './lib/ppp/constraint_graph'
require './lib/ppp/constraint_vertex'

describe 'Constraint' do
  describe 'Graph' do
    describe 'Vertices' do
      it 'should hold vertices' do
        graph = PPP::Constraint::Graph.new

        graph.addVertex(PPP::Constraint::Vertex.new)

        expect(graph.vertices.size).to be(1)
      end
    end

    describe 'Edges' do
      it 'should connect edges' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new)
        graph.addVertex(v = PPP::Constraint::Vertex.new)

        graph.addEdge(u, v)

        expect(graph.edges.size).to be(1)
      end
    end
  end
end
