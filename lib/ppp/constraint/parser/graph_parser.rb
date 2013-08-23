# Autogenerated from a Treetop grammar. Edits may be lost.


require 'treetop'
require './lib/ppp/constraint/parser/optional_whitespace_parser'

module PPP
  module Constraint
    module Parser
      module Graph
        include Treetop::Runtime

        def root
          @root ||= :graph_definition
        end

        include PPP::Constraint::Parser::OptionalWhitespace

        module GraphDefinition0
          def graph_header
            elements[0]
          end

          def graph_body
            elements[1]
          end

          def graph_footer
            elements[2]
          end
        end

        def _nt_graph_definition
          start_index = index
          if node_cache[:graph_definition].has_key?(index)
            cached = node_cache[:graph_definition][index]
            if cached
              cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
              @index = cached.interval.end
            end
            return cached
          end

          i0, s0 = index, []
          r1 = _nt_graph_header
          s0 << r1
          if r1
            r2 = _nt_graph_body
            s0 << r2
            if r2
              r3 = _nt_graph_footer
              s0 << r3
            end
          end
          if s0.last
            r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
            r0.extend(GraphDefinition0)
          else
            @index = i0
            r0 = nil
          end

          node_cache[:graph_definition][start_index] = r0

          r0
        end

        module GraphHeader0
          def optional_whitespaces
            elements[0]
          end

        end

        def _nt_graph_header
          start_index = index
          if node_cache[:graph_header].has_key?(index)
            cached = node_cache[:graph_header][index]
            if cached
              cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
              @index = cached.interval.end
            end
            return cached
          end

          i0, s0 = index, []
          r1 = _nt_optional_whitespaces
          s0 << r1
          if r1
            if has_terminal?('graph', false, index)
              r2 = instantiate_node(SyntaxNode,input, index...(index + 5))
              @index += 5
            else
              terminal_parse_failure('graph')
              r2 = nil
            end
            s0 << r2
          end
          if s0.last
            r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
            r0.extend(GraphHeader0)
          else
            @index = i0
            r0 = nil
          end

          node_cache[:graph_header][start_index] = r0

          r0
        end

        def _nt_graph_body
          start_index = index
          if node_cache[:graph_body].has_key?(index)
            cached = node_cache[:graph_body][index]
            if cached
              cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
              @index = cached.interval.end
            end
            return cached
          end

          r0 = _nt_whitespaces

          node_cache[:graph_body][start_index] = r0

          r0
        end

        module GraphFooter0
          def optional_whitespaces
            elements[1]
          end
        end

        def _nt_graph_footer
          start_index = index
          if node_cache[:graph_footer].has_key?(index)
            cached = node_cache[:graph_footer][index]
            if cached
              cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
              @index = cached.interval.end
            end
            return cached
          end

          i0, s0 = index, []
          if has_terminal?('end', false, index)
            r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure('end')
            r1 = nil
          end
          s0 << r1
          if r1
            r2 = _nt_optional_whitespaces
            s0 << r2
          end
          if s0.last
            r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
            r0.extend(GraphFooter0)
          else
            @index = i0
            r0 = nil
          end

          node_cache[:graph_footer][start_index] = r0

          r0
        end

      end

      class GraphParser < Treetop::Runtime::CompiledParser
        include Graph
      end

    end
  end
end
