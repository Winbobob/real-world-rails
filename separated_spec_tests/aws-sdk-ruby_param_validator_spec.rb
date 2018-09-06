require_relative '../spec_helper'

module Aws
  describe ParamValidator do

    let(:shapes) { ApiHelper.sample_shapes }

    let(:api) { ApiHelper.sample_api(shapes: shapes) }

    def validate(params, expected_errors = [])
      rules = api.operation(:example_operation).input
      if expected_errors.empty?
        ParamValidator.new(rules).validate!(params)
      else
        expect {
          ParamValidator.new(rules).validate!(params)
        }.to raise_error(ArgumentError) do |error|
          match_errors(error, expected_errors)
        end
      end
    end

    def match_errors(error, expected_errors)
      expected_errors = [expected_errors] unless expected_errors.is_a?(Array)
      expected_errors.each do |expected_error|
        if String === expected_error
          expect(error.message).to include(expected_error)
        else
          expect(error.message).to match(expected_error)
        end
      end
    end

    describe 'empty rules' do

      it 'accepts an empty hash of params when rules are empty' 


    end

    describe 'structures' do

      it 'validates nested structures' 


      it 'accepts hashes' 


      it 'raises an error when a required paramter is missing' 


      it 'raises an error when a given parameter is unexpected' 


      it 'accepts members that pass validation' 


      it 'aggregates errors for members' 


    end

    describe 'lists' do

      it 'accepts arrays' 


      it 'expects the value to be an Array' 


      it 'validates each member of the list' 


    end

    describe 'maps' do

      it 'accepts hashes' 


      it 'validates map keys' 


      it 'validates map values' 


    end

    describe 'integers' do

      it 'accepts integers' 


    end

    describe 'floats' do

      it 'accepts integers' 


    end

    describe 'timestamps' do

      it 'accepts time objects' 


    end

    describe 'booleans' do

      it 'accepts TrueClass and FalseClass' 


    end

    describe 'blobs' do

      it 'accepts strings and io objects for payload members' 


    end

    describe 'strings' do

      it 'accepts string objects' 


    end
  end
end

