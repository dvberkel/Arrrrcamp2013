require 'spec_helper'

require './lib/ppp/constraint/parser/optional_whitespace_parser'

describe 'Constraint' do
  describe 'Parser' do
    describe 'Optional Whitespace' do
      parser = PPP::Constraint::Parser::OptionalWhitespaceParser.new

      it 'should parse an empty string' do
        expect(parser.parse('')).to be_true
      end

      it 'should parse a single space' do
        expect(parser.parse(' ')).to be_true
      end

      it 'should parse a single tab' do
        expect(parser.parse("\t")).to be_true
      end

      it 'should parse a single newline' do
        expect(parser.parse("\n")).to be_true
      end

      it 'should parse a multiple whitespace characters' do
        expect(parser.parse("  ")).to be_true
        expect(parser.parse(" \t")).to be_true
        expect(parser.parse(" \n")).to be_true
        expect(parser.parse("\t ")).to be_true
        expect(parser.parse("\t\t")).to be_true
        expect(parser.parse("\t\n")).to be_true
        expect(parser.parse("\n ")).to be_true
        expect(parser.parse("\n\t")).to be_true
        expect(parser.parse("\n\n")).to be_true
      end
    end
  end
end
