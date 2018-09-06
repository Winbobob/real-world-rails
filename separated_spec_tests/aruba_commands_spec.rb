require 'spec_helper'
require 'aruba/api'
require 'fileutils'

RSpec.describe Aruba::Api::Commands do
  include_context 'uses aruba API'

  describe '#run_command' do
    context 'when succesfully running a command' do
      before(:each) { @aruba.run_command 'cat' }
      after(:each) { @aruba.all_commands.each(&:stop) }

      it "respond to input" 


      it "respond to close_input" 


      it "pipes data" 

    end

    context 'when mode is :in_process' do
      before do
        @aruba.aruba.config.command_launcher = :in_process
      end

      after do
        @aruba.aruba.config.command_launcher = :spawn
      end

      it 'raises an error' 

    end
  end
end

