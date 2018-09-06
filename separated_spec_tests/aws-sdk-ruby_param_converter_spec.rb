require_relative '../spec_helper'
require 'stringio'

module Aws
  describe ParamConverter do
    describe 'convert' do

      it 'performs a deeply nested conversion of values' 


    end

    describe 'default converstions' do

      describe 'undescribed' do

        it 'returns the value unmodified if the shape class is unknown' 


        it 'returns the value unmodified if the value class is unknown' 


      end

      describe 'structures' do

        let(:shape_class) { Seahorse::Model::Shapes::StructureShape }

        it 'returns duplicate hashes' 


        it 'does not modify structs' 


      end

      describe 'maps' do

        let(:shape_class) { Seahorse::Model::Shapes::MapShape }

        it 'returns duplicate hashes' 


        it 'creates a hash from a struct' 


      end

      describe 'lists' do

        let(:shape_class) { Seahorse::Model::Shapes::ListShape }

        it 'duplicates arrays' 


        it 'converts enumerables into arrays' 


      end

      describe 'strings' do

        let(:shape_class) { Seahorse::Model::Shapes::StringShape }

        it 'returns strings unmodified' 


        it 'converts symbols to strings' 


      end

      describe 'integers' do

        let(:shape_class) { Seahorse::Model::Shapes::IntegerShape }

        it 'returns integers unmodified' 


        it 'converts floats to integers' 


        it 'casts strings to integers' 


        it 'returns strings unmodified if cast fails' 


      end

      describe 'floats' do

        let(:shape_class) { Seahorse::Model::Shapes::FloatShape }

        it 'returns floats unmodified' 


        it 'converts integers to floats' 


        it 'casts strings to floats' 


        it 'returns strings unmodified if cast fails' 


      end

      describe 'timestamps' do

        let(:shape_class) { Seahorse::Model::Shapes::TimestampShape }

        it 'returns Time objects unmodfied' 


        it 'returns DateTime objects as a Time object' 


        it 'returns Date objects as a Time object' 


        it 'converts integers to Time objects' 


        it 'parses strings as time objets' 


        it 'returns strings unmodified if they can not be parsed' 


      end

      describe 'booleans' do

        let(:shape_class) { Seahorse::Model::Shapes::BooleanShape }

        it 'returns true and false' 


        it 'does not translate nil' 


      end

      describe 'blobs' do

        let(:shape_class) { Seahorse::Model::Shapes::BlobShape }

        it 'accepts io objects (like file)' 


        it 'accepts io objects (like stringio)' 


        it 'accepts io objects (like tempfiles)' 


        it 'accepts strings' 


      end

    end

    describe '.add' do

      it 'registers a new converter' 


      it 'can convert values based on parent value classes' 


      it 'can convert values based on parent shape classes' 


      it 'replaces an existing converter' 


    end
  end
end

