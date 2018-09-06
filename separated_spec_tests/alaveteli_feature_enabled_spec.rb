require 'spec_helper'
require 'flipper/adapters/memory'
require 'alaveteli_features/helpers'

describe AlaveteliFeatures::Helpers do
  let(:instance) { Class.new { include AlaveteliFeatures::Helpers }.new }
  let(:test_backend) { Flipper.new(Flipper::Adapters::Memory.new) }
  let(:user_class) do
    # A test class to let us test the actor-based feature flipping
    class User
      attr_reader :id

      def initialize(id, admin)
        @id = id
        @admin = admin
      end

      def admin?
        @admin
      end

      # Must respond to flipper_id
      alias_method :flipper_id, :id
    end
  end

  before do
    AlaveteliFeatures.backend = test_backend
    # Seems to be the only way to make sure we don't register a group twice
    begin
      AlaveteliFeatures.backend.group(:admins)
    rescue Flipper::GroupNotRegistered
      Flipper.register :admins do |actor|
        actor.respond_to?(:admin?) && actor.admin?
      end
    end
  end

  describe "#feature_enabled?" do
    it "should respond true when a feature is enabled" 


    it "should respond false when a feature is disabled" 


    it "should pass on other arguments to the backend" 

  end
end

