require 'spec_helper'

module Calagator
  describe 'Calagator.title' do
    it "should use default value" 


    it "should be configurable" 


    around do |example|
      original = Calagator.title
      example.run
      Calagator.title = original
    end
  end
end

