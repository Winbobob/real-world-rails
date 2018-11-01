require 'ohm'
require 'database_cleaner/ohm/truncation'

module OhmTests
  class Widget < ::Ohm::Model
    attribute :name
  end

  class Gadget < ::Ohm::Model
    attribute :name
  end
end

RSpec.describe DatabaseCleaner::Ohm::Truncation do
  around do |example|
    config = YAML::load(File.open("#{File.dirname(__FILE__)}/../../../examples/config/redis.yml"))
    Ohm.connect url: config['test']['url']
    @redis = Ohm.redis

    example.run

    @redis.flushdb
  end

  before do
    OhmTests::Widget.new(name: 'some widget').save
    OhmTests::Gadget.new(name: 'some gadget').save
  end

  context "by default" do
    it "truncates all keys" 

  end

  context "when keys are provided to the :only option" do
    subject { described_class.new(only: ['*Widget*']) }

    it "only truncates the specified keys" 

  end

  context "when keys are provided to the :except option" do
    subject { described_class.new(except: ['*Widget*']) }

    it "truncates all but the specified keys" 

  end
end


