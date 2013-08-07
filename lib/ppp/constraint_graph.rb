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

      def addEdge(u, v, weight = 1)
        if not @vertices.member?(u) or not @vertices.member?(v) then
          raise PPP::Constraint::Exception::VertexNotPresent
        end
        @edges << (edge = PPP::Constraint::Edge.new(u,v, weight=weight))
        edge
      end

      def switch(e)
        if not @edges.member?(e) then
          raise PPP::Constraint::Exception::EdgeNotPresent
        end
        if not edge_playable?(e) then
          raise PPP::Constraint::Exception::MoveNotAllowed
        end
        e.switch
      end

      def satisfied?
        @vertices.each do |v|
          if not vertex_satisfied?(v) then
            return false
          end
        end
        true
      end

      def moves
        @edges.to_a.select { |e| edge_playable?(e) }
      end

      private
      def edge_playable?(e)
        incoming_weight_for(e.to) - e.weight >= e.to.weight
      end

      def vertex_satisfied?(v)
        v.weight <= incoming_weight_for(v)
      end

      def incoming_weight_for(v)
        @edges.to_a.select { |e| e.to == v }.map { |e| e.weight }.inject(0) { |x,y| x + y }
      end
    end
  end
end
