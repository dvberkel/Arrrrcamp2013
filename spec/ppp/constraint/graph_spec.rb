require 'spec_helper'

require './lib/ppp/constraint/graph'
require './lib/ppp/constraint/vertex'
require './lib/ppp/constraint/exceptions.rb'

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

      it 'should throw an exception if the vertex is not present' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new)
        v = PPP::Constraint::Vertex.new

        expect { graph.addEdge(u,v) }.to raise_error PPP::Constraint::Exception::VertexNotPresent
        expect { graph.addEdge(v,u) }.to raise_error PPP::Constraint::Exception::VertexNotPresent
      end
    end

    describe 'satisfied?' do
      it 'satisfied example' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new(weight=2))
        graph.addVertex(v = PPP::Constraint::Vertex.new)
        graph.addVertex(w = PPP::Constraint::Vertex.new)
        graph.addEdge(v, u, weight=2)
        graph.addEdge(w, v)
        graph.addEdge(u, w)

        expect(graph.satisfied?).to be(true)
      end

      it 'unsatisfied example' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new(weight=2))
        graph.addVertex(v = PPP::Constraint::Vertex.new)
        graph.addVertex(w = PPP::Constraint::Vertex.new)
        graph.addEdge(v, u)
        graph.addEdge(w, v)
        graph.addEdge(u, w)

        expect(graph.satisfied?).to be(false)
      end
    end

    describe 'moves' do
      it 'no moves example' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new)
        graph.addVertex(v = PPP::Constraint::Vertex.new)
        graph.addVertex(w = PPP::Constraint::Vertex.new)
        graph.addEdge(v, u)
        graph.addEdge(w, v)
        graph.addEdge(u, w)

        expect(graph.moves.empty?).to be(true)
      end

      it 'one move example' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new(weight=0))
        graph.addVertex(v = PPP::Constraint::Vertex.new)
        graph.addVertex(w = PPP::Constraint::Vertex.new)
        e = graph.addEdge(v, u)
        graph.addEdge(w, v)
        graph.addEdge(u, w)

        expect(graph.moves).to include(e)
      end
    end

    describe 'move' do
      it 'one move example' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new(weight=0))
        graph.addVertex(v = PPP::Constraint::Vertex.new)
        graph.addVertex(w = PPP::Constraint::Vertex.new)
        e = graph.addEdge(v, u)
        graph.addEdge(w, v)
        graph.addEdge(u, w)

        graph.switch(e)

        expect(e.from).to eq(u)
        expect(e.to).to eq(v)
      end

      it 'no moves example' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new)
        graph.addVertex(v = PPP::Constraint::Vertex.new)
        graph.addVertex(w = PPP::Constraint::Vertex.new)
        e = graph.addEdge(v, u)
        graph.addEdge(w, v)
        graph.addEdge(u, w)

        expect { graph.switch(e) }.to raise_error PPP::Constraint::Exception::MoveNotAllowed
      end

      it 'edge not present' do
        graph = PPP::Constraint::Graph.new
        e = PPP::Constraint::Edge.new(PPP::Constraint::Vertex, PPP::Constraint::Vertex)

        expect { graph.switch(e) }.to raise_error PPP::Constraint::Exception::EdgeNotPresent
      end

      describe 'events' do
        it 'should notify observers when a edge switches' do
          graph = PPP::Constraint::Graph.new
          graph.addVertex(u = PPP::Constraint::Vertex.new(weight = 0))
          graph.addVertex(v = PPP::Constraint::Vertex.new(weight = 0))
          e = graph.addEdge(u, v)

          observer = TestMoveObserver.new
          graph.add_observer(observer)

          graph.switch(e)

          expect(observer.edge).to be(e)
        end
      end
    end

    describe 'target' do
      it 'should be able to set' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new(weight = 0))
        graph.addVertex(v = PPP::Constraint::Vertex.new(weight = 0))
        e = graph.addEdge(u, v)

        graph.target(e)

        expect(graph.target_switched?).to be(false)
      end

      it 'should be reached when target is switched' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new(weight = 0))
        graph.addVertex(v = PPP::Constraint::Vertex.new(weight = 0))
        e = graph.addEdge(u, v)
        graph.target(e)

        graph.switch(e)

        expect(graph.target_switched?).to be(true)
      end

      it 'should be able to pick new target' do
        graph = PPP::Constraint::Graph.new
        graph.addVertex(u = PPP::Constraint::Vertex.new(weight = 0))
        graph.addVertex(v = PPP::Constraint::Vertex.new(weight = 0))
        graph.addVertex(w = PPP::Constraint::Vertex.new(weight = 0))
        uv = graph.addEdge(u, v)
        vw = graph.addEdge(v, w)
        graph.target(uv)

        graph.target(vw)
        graph.switch(uv)

        expect(graph.target_switched?).to be(false)
      end
    end
  end
end

class TestMoveObserver < Struct.new(:edge)
  def update(e)
    self.edge = e
  end
end
