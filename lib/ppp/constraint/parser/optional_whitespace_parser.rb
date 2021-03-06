# Autogenerated from a Treetop grammar. Edits may be lost.


require 'treetop'
require './lib/ppp/constraint/parser/whitespace_parser'

module PPP
  module Constraint
    module Parser
      module OptionalWhitespace
        include Treetop::Runtime

        def root
          @root ||= :optional_whitespaces
        end

        include PPP::Constraint::Parser::Whitespace

        def _nt_optional_whitespaces
          start_index = index
          if node_cache[:optional_whitespaces].has_key?(index)
            cached = node_cache[:optional_whitespaces][index]
            if cached
              cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
              @index = cached.interval.end
            end
            return cached
          end

          i0 = index
          r1 = _nt_whitespaces
          if r1
            r0 = r1
          else
            r2 = _nt_empty
            if r2
              r0 = r2
            else
              @index = i0
              r0 = nil
            end
          end

          node_cache[:optional_whitespaces][start_index] = r0

          r0
        end

        def _nt_empty
          start_index = index
          if node_cache[:empty].has_key?(index)
            cached = node_cache[:empty][index]
            if cached
              cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
              @index = cached.interval.end
            end
            return cached
          end

          if has_terminal?('', false, index)
            r0 = instantiate_node(SyntaxNode,input, index...(index + 0))
            @index += 0
          else
            terminal_parse_failure('')
            r0 = nil
          end

          node_cache[:empty][start_index] = r0

          r0
        end

      end

      class OptionalWhitespaceParser < Treetop::Runtime::CompiledParser
        include OptionalWhitespace
      end

    end
  end
end
