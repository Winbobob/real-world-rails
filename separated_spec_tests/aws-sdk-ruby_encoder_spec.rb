require 'fileutils'
require 'tempfile'
require_relative 'spec_helper'

module Aws
  module EventStream 
    
    describe Encoder do

      describe "#encode" do
        
        Dir.glob(File.expand_path('../fixtures/decoded/positive/*', __FILE__)).each do |path|

          suit_name = File.basename(path)
          expect_path = File.join(File.expand_path('../fixtures/encoded/positive', __FILE__), suit_name)

          msg_raw = SpecHelper.convert_msg(path) # msg to be encoded

          it "encode suit: #{suit_name} correctly" 


        end

      end
    end
  end
end

