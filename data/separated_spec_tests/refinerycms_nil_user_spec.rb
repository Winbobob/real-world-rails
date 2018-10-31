require 'spec_helper_no_rails'
require 'refinery/core/nil_user'

module Refinery
  module Core
    RSpec.describe NilUser do
      describe "plugins" do
        it "has all" 

      end

      describe "landing url" do
        let(:active_plugins) { double("active_plugins") }

        before do
          allow(subject).to receive(:active_plugins).and_return(active_plugins)
        end

        it "queries for the first landable url" 

      end


      describe "roles" do
        it "responds to #has_role?" 


        it "should have all roles by default" 

      end
    end
  end
end

