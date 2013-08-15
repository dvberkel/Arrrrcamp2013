require 'observer'

module PPP
  module Constraint
    class Edge
      include Observable

      attr_reader :from
      attr_reader :to
      attr_reader :weight

      def initialize(u, v, weight = 1)
        @from = u
        @to = v
        @weight = weight
      end

      def switch
        @from, @to = @to, @from
        changed
        notify_observers(self)
      end

      def eql?(edge)
        same_endpoints?(edge)
      end

      def hash
        @from.hash ^ @to.hash
      end

      private
      def same_endpoints?(edge)
        from_to_eql?(edge.from, edge.to) or from_to_eql?(edge.to, edge.from)
      end

      def from_to_eql?(u, v)
        @from == u and @to == v
      end
    end
  end
end
