require 'spec_helper'

module Refinery
  describe Dragonfly do
    describe 'default configuration' do

      it 'defines a default secret' 


      it "doesn't use S3" 


      it "doesn't use a custom datastore" 

    end

    describe 'using custom configuration' do
      describe 'datastore' do
        before {
          class DummyBackend;
          end}
        after {Refinery::Dragonfly.custom_datastore_class = nil}
        let(:datastore) {DummyBackend.new}

        it 'uses the custom setting' 

      end
    end
  end
end


