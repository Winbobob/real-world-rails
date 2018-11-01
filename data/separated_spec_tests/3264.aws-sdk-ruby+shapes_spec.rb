require_relative '../../spec_helper'
require 'set'

module Seahorse
  module Model
    module Shapes
      describe ShapeRef do

        it 'defaults #shape to nil' 


        it 'defaults #location to nil' 


        it 'defaults #location_name to nil' 


        it 'defaults #deprecated to false' 


        it 'provides metadata access via #[] and #[]=' 


        it 'provides read access to the shape metadata' 


        it 'can be populated via .new' 


      end

      describe StructureShape do

        let(:shape_ref) {
          ShapeRef.new(shape: Shape.new, location_name: 'LocName')
        }

        it 'is a Shape' 


        it 'allows members to be added' 


        it 'provides a list of required members' 


        it 'provides access to members by their location name' 


      end

      describe ListShape do

        let(:shape_ref) {
          ShapeRef.new(shape: Shape.new, location_name: 'LocName')
        }

        it 'is a Shape' 


        it 'defaults #min to nil' 


        it 'defaults #max to nil' 


        it 'has a #member reference' 


      end

      describe MapShape do

        let(:shape_ref) {
          ShapeRef.new(shape: Shape.new, location_name: 'LocName')
        }

        it 'is a Shape' 


        it 'defaults #min to nil' 


        it 'defaults #max to nil' 


        it 'has a #key reference' 


        it 'has a #value reference' 


      end

      describe BlobShape do

        it 'is a Shape' 


        it 'defaults #min to nil' 


        it 'defaults #max to nil' 


      end

      describe BooleanShape do

        it 'is a Shape' 


      end

      describe FloatShape do

        it 'is a Shape' 


      end

      describe IntegerShape do

        it 'is a Shape' 


        it 'defaults #min to nil' 


        it 'defaults #max to nil' 


      end

      describe StringShape do

        it 'is a Shape' 


        it 'defaults #enum to nil' 


        it 'defaults #min to nil' 


        it 'defaults #max to nil' 


      end

      describe TimestampShape do

        it 'is a Shape' 


      end
    end
  end
end

