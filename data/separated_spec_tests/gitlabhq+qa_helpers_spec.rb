# frozen_string_literal: true

require 'spec_helper'
require 'rubocop'
require_relative '../../rubocop/qa_helpers'

describe RuboCop::QAHelpers do
  def parse_source(source, path = 'foo.rb')
    buffer = Parser::Source::Buffer.new(path)
    buffer.source = source

    builder = RuboCop::AST::Builder.new
    parser = Parser::CurrentRuby.new(builder)

    parser.parse(buffer)
  end

  let(:cop) do
    Class.new do
      include RuboCop::QAHelpers
    end.new
  end

  describe '#in_qa_file?' do
    it 'returns true for a node in the qa/ directory' 


    it 'returns false for a node outside the qa/ directory' 

  end
end

