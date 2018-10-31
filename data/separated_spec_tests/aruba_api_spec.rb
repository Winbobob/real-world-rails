require 'spec_helper'
require 'aruba/api'
require 'fileutils'

describe Aruba::Api do
  include_context 'uses aruba API'

  describe 'tags' do
    describe '@announce_stdout' do
      after(:each) { @aruba.all_commands.each(&:stop) }

      context 'enabled' do
        before :each do
          @aruba.aruba.announcer = instance_double 'Aruba::Platforms::Announcer'
          expect(@aruba.aruba.announcer).to receive(:announce).with(:stdout) { "hello world\n" }
          allow(@aruba.aruba.announcer).to receive(:announce)
        end

        it "should announce to stdout exactly once" 

      end

      context 'disabled' do
        it "should not announce to stdout" 

      end
    end
  end

  describe 'fixtures' do
    let(:api) do
      klass = Class.new do
        include Aruba::Api

        def root_directory
          expand_path('.')
        end
      end

      klass.new
    end
  end

  describe "#set_environment_variable" do
    after(:each) do
      @aruba.all_commands.each(&:stop)
    end

    it "set environment variable" 


    it "overwrites environment variable" 

  end
end # Aruba::Api

