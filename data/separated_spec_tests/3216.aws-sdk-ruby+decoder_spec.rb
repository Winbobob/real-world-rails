require_relative 'spec_helper'

module Aws
  module EventStream

    describe Decoder do

      describe "#decode" do
        
        Dir.glob(File.expand_path('../fixtures/encoded/positive/*', __FILE__)).each do |path|
          expect_msg = SpecHelper.expected_decoded_message(path)

          it "decodes file: #{path} correctly" 


        end

        Dir.glob(File.expand_path('../fixtures/encoded/negative/*', __FILE__)).each do |path|
          expect_error = SpecHelper.expected_decoded_error(path)

          it "detects error for file: #{path} correctly" 

        end

        it '#decode_chunk data for multiple messages' 


        it '#decode_chunk buffers partial prelude message' 


        it '#decode_chunk buffers partial message' 


      end
    end

  end
end

