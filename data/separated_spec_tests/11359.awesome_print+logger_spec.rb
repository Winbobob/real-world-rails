require 'spec_helper'


require 'logger'
require 'awesome_print/core_ext/logger'

RSpec.describe 'AwesomePrint logging extensions' do
  before(:all) do
    @logger = Logger.new('/dev/null') rescue Logger.new('nul')
  end

  describe 'ap method' do
    it 'should awesome_inspect the given object' 


    describe 'the log level' do
      before do
        AwesomePrint.defaults = {}
      end

      it 'should fallback to the default :debug log level' 


      it 'should use the global user default if no level passed' 


      it 'should use the passed in level' 

    end
  end
end



