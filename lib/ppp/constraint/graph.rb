require 'set'
require 'observer'
require './lib/ppp/constraint/edge'
require './lib/ppp/constraint/exceptions.rb'

module PPP
  module Constraint
    class Graph
      include Observable

      attr_reader :vertices
      attr_reader :edges

      def initialize()
        @vertices = Set.new []
        @edges = Set.new []
        @target = nil
        @target_switched = false
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
        changed
        notify_observers(e)
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

      def target(e)
        if @target then
          @target_switched = false
          @target.delete_observer(self)
        end
        @target = e
        @target.add_observer(self)
      end

      def target_switched?
        @target_switched
      end

      def update(e)
        @target_switched = @target == e
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
