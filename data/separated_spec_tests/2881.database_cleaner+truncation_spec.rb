require 'redis'
require 'database_cleaner/redis/truncation'

RSpec.describe DatabaseCleaner::Redis::Truncation do
  around do |example|
    config = YAML::load(File.open("#{File.dirname(__FILE__)}/../../../examples/config/redis.yml"))
    @redis = ::Redis.new :url => config['test']['url']

    example.run

    @redis.flushdb
  end

  before do
    @redis.set 'Widget', 1
    @redis.set 'Gadget', 1
  end

  context "by default" do
    it "truncates all keys" 

  end

  context "when keys are provided to the :only option" do
    subject { described_class.new(only: ['Widge*']) }

    it "only truncates the specified keys" 

  end

  context "when keys are provided to the :except option" do
    subject { described_class.new(except: ['Widg*']) }

    it "truncates all but the specified keys" 

  end
end


