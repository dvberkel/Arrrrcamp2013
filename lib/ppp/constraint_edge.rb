module PPP
  module Constraint
    class Edge
      attr_reader :from
      attr_reader :to

      def initialize(u, v)
        @from = u
        @to = v
      end

      def eql?(edge)
        same_endpoints?(edge)
      end

      def hash()
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
