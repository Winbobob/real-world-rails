require_relative '../../../spec_helper'
require 'stringio'

module Seahorse
  module Client
    module Http
      describe Request do

        def request(*args) Request.new(*args) end

        describe '#endpoint' do

          it 'defaults to nil' 


          it 'can be set in the constructor' 


          it 'can be blanked out' 


          it 'converts strings to URIs' 


          it 'supports https endpoints' 


        end

        describe '#http_method' do

          it 'defaults to GET' 


          it 'can be set in the constructor' 


        end

        describe '#headers' do

          it 'defaults to a Http::Headers' 


          it 'casts incoming headers as a Http::Headers object' 


        end

        describe '#body' do

          it 'defaults to an empty IO-like object' 


          it 'can be set in the constructor' 


          it 'can be set as a string in the constructor' 


          it 'converts nil bodies into empty io objects' 


          it 'can be set as a string in accessor' 


        end
      end
    end
  end
end

