# frozen_string_literal: true

require 'spec_helper'
require 'rubocop'
require 'parser/current'
require_relative '../../rubocop/code_reuse_helpers'

describe RuboCop::CodeReuseHelpers do
  def parse_source(source, path = 'foo.rb')
    buffer = Parser::Source::Buffer.new(path)
    buffer.source = source

    builder = RuboCop::AST::Builder.new
    parser = Parser::CurrentRuby.new(builder)

    parser.parse(buffer)
  end

  let(:cop) do
    Class.new do
      include RuboCop::CodeReuseHelpers
    end.new
  end

  describe '#send_to_constant?' do
    it 'returns true when sending to a constant' 


    it 'returns false when sending to something other than a constant' 

  end

  describe '#send_receiver_name_ends_with?' do
    it 'returns true when the receiver ends with a suffix' 


    it 'returns false when the receiver is the same as a suffix' 

  end

  describe '#file_path_for_node' do
    it 'returns the file path of a node' 

  end

  describe '#name_of_constant' do
    it 'returns the name of a constant' 

  end

  describe '#in_finder?' do
    it 'returns true for a node in the finders directory' 


    it 'returns false for a node outside the finders directory' 

  end

  describe '#in_model?' do
    it 'returns true for a node in the models directory' 


    it 'returns false for a node outside the models directory' 

  end

  describe '#in_service_class?' do
    it 'returns true for a node in the services directory' 


    it 'returns false for a node outside the services directory' 

  end

  describe '#in_presenter?' do
    it 'returns true for a node in the presenters directory' 


    it 'returns false for a node outside the presenters directory' 

  end

  describe '#in_serializer?' do
    it 'returns true for a node in the serializers directory' 


    it 'returns false for a node outside the serializers directory' 

  end

  describe '#in_worker?' do
    it 'returns true for a node in the workers directory' 


    it 'returns false for a node outside the workers directory' 

  end

  describe '#in_api?' do
    it 'returns true for a node in the API directory' 


    it 'returns false for a node outside the API directory' 

  end

  describe '#in_directory?' do
    it 'returns true for a directory in the CE app/ directory' 


    it 'returns true for a directory in the EE app/ directory' 


    it 'returns false for a directory in the lib/ directory' 

  end

  describe '#name_of_receiver' do
    it 'returns the name of a send receiver' 

  end

  describe '#each_class_method' do
    it 'yields every class method to the supplied block' 

  end

  describe '#each_send_node' do
    it 'yields every send node to the supplied block' 

  end

  describe '#disallow_send_to' do
    it 'disallows sending a message to a constant' 

  end
end

