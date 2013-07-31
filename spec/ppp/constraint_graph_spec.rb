require 'spec_helper'

require './lib/ppp/constraint_graph'
require './lib/ppp/constraint_vertex'

describe 'Constraint' do
  describe 'Graph' do
    describe 'Vertices' do
      it 'should be added' do
        graph = PPP::Constraint::Graph.new

        graph.addVertex(PPP::Constraint::Vertex.new)

        expect(graph.vertices.size).to be(1)
      end

      it 'can be added only once' do
        graph = PPP::Constraint::Graph.new
        v = PPP::Constraint::Vertex.new

        graph.addVertex(v)
        graph.addVertex(v)

        expect(graph.vertices.size).to be(1)
      end
    end

    describe 'Edges' do
      it 'should be added' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new)
        graph.addVertex(v = PPP::Constraint::Vertex.new)

        graph.addEdge(u, v)

        expect(graph.edges.size).to be(1)
      end

      it 'can be added only once' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new)
        graph.addVertex(v = PPP::Constraint::Vertex.new)

        graph.addEdge(u, v)
        graph.addEdge(u, v)

        expect(graph.edges.size).to be(1)
      end

      it 'different directions are similar' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new)
        graph.addVertex(v = PPP::Constraint::Vertex.new)

        graph.addEdge(u, v)
        graph.addEdge(v, u)

        expect(graph.edges.size).to be(1)
      end
    end
  end
end
