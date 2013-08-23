require 'spec_helper'

require './lib/ppp/constraint/parser/graph_parser'

describe 'Constraint' do
  describe 'Parser' do
    describe 'Graph' do
      it 'should parse an empty graph' do
        parser = PPP::Constraint::Parser::GraphParser.new

        expect(parser.parse("graph end")).to be_true
        expect(parser.parse("   graph end")).to be_true
        expect(parser.parse("graph end  ")).to be_true
        expect(parser.parse("graph\n\t\nend")).to be_true
      end

      it 'should parse an empty graph with no vertices' do
        parser = PPP::Constraint::Parser::GraphParser.new

        expect(parser.parse(<<-GRAPH_END
          graph
            vertices end
          end
        GRAPH_END
        )).to be_true
      end

      it 'should parse a totally disconnected graph' do
        parser = PPP::Constraint::Parser::GraphParser.new

        expect(parser.parse(<<-GRAPH_END
          graph
            vertices
              1, 2, 3
            end
          end
        GRAPH_END
        )).to be_true
        expect(parser.parse(<<-GRAPH_END
          graph
            vertices
              u1, u2, u3
            end
          end
        GRAPH_END
        )).to be_true
        expect(parser.parse(<<-GRAPH_END
          graph
            vertices
              0
            end
          end
        GRAPH_END
        )).to be_true
      end

      it 'should parse a totally disconnected graph with no edges' do
        parser = PPP::Constraint::Parser::GraphParser.new

        expect(parser.parse(<<-GRAPH_END
          graph
            vertices
              1, 2, 3
            end

            edges end
          end
        GRAPH_END
        )).to be_true
      end

      it 'should parse a graph with one edge' do
        parser = PPP::Constraint::Parser::GraphParser.new

        expect(parser.parse(<<-GRAPH_END
          graph
            vertices
              1, 2, 3
            end

            edges
              1: 2, 3
            end
          end
        GRAPH_END
        )).to be_true
      end

      it 'should parse a graph with multiple edges' do
        parser = PPP::Constraint::Parser::GraphParser.new

        expect(parser.parse(<<-GRAPH_END
          graph
            vertices
              1, 2, 3
            end

            edges
              1: 2, 3;
              2: 1;
              3: 1
            end
          end
        GRAPH_END
        )).to be_true
      end
    end
  end
end
