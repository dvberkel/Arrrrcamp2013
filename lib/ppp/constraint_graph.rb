require 'set'
require './lib/ppp/constraint_edge'

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
        @edges << PPP::Constraint::Edge.new(u,v)
      end
    end
  end
end
