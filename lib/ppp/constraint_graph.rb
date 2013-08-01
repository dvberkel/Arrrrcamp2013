require 'set'
require './lib/ppp/constraint_edge'
require './lib/ppp/constraint_exceptions.rb'

module PPP
  module Constraint
    class Graph
      attr_reader :vertices
      attr_reader :edges

      def initialize()
        @vertices = Set.new []
        @edges = Set.new []
      end

      def addVertex(v)
        @vertices << v
      end

      def addEdge(u, v)
        if not @vertices.member?(u) or not @vertices.member?(v) then
          raise PPP::Constraint::Exception::VertexNotPresent
        end
        @edges << PPP::Constraint::Edge.new(u,v)
      end
    end
  end
end
