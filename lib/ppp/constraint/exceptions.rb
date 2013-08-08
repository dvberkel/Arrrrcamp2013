module PPP
  module Constraint
    module Exception
      class VertexNotPresent < StandardError
      end
      class EdgeNotPresent < StandardError
      end
      class MoveNotAllowed < StandardError
      end
    end
  end
end
