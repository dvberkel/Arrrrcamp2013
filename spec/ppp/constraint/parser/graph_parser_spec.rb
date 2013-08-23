require 'spec_helper'

require './lib/ppp/constraint/parser/graph_parser'


describe 'Constraint' do
  describe 'Parser' do
    describe 'Graph' do
      it 'should parse an empty graph' do
        parser = PPP::Constraint::Parser::GraphParser.new

        expect(parser.parse("graph end")).to be_true
      end
    end
  end
end
