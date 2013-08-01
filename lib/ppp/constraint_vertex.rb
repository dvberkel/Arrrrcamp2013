module PPP
  module Constraint
    class Vertex
      attr_reader :weight

      def initialize(weight = 1)
        @weight = weight
      end
    end
  end
end
