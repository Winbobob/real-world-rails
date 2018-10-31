require_relative '../spec_helper'

def suites
  JSON.load(File.read(File.expand_path('../suite.json', __FILE__).strip))
end

module Aws
  module S3

    describe Client do

      suites.each_with_index do |suite, i|

        it "produces correct url pattern with configuration #{i}" 


      end

    end

  end
end

