require "spec_helper"
require "rspec/rails/feature_check"

if RSpec::Rails::FeatureCheck.has_active_job?
  require "rspec/rails/matchers/active_job"

  class GlobalIdModel
    include GlobalID::Identification

    attr_reader :id

    def self.find(id)
      new(id)
    end

    def initialize(id)
      @id = id
    end

    def ==(comparison_object)
      (GlobalIdModel === comparison_object) && (id == comparison_object.id)
    end

    def to_global_id(options = {})
      @global_id ||= GlobalID.create(self, :app => "rspec-suite")
    end
  end

  class FailingGlobalIdModel < GlobalIdModel
    def self.find(id)
      raise URI::GID::MissingModelIdError
    end
  end
end

RSpec.describe "ActiveJob matchers", :skip => !RSpec::Rails::FeatureCheck.has_active_job? do
  around do |example|
    original_logger = ActiveJob::Base.logger
    ActiveJob::Base.logger = Logger.new(nil) # Silence messages "[ActiveJob] Enqueued ...".
    example.run
    ActiveJob::Base.logger = original_logger
  end

  let(:heavy_lifting_job) do
    Class.new(ActiveJob::Base) do
      def perform; end
      def self.name; "HeavyLiftingJob"; end
    end
  end

  let(:hello_job) do
    Class.new(ActiveJob::Base) do
      def perform(*)
      end
      def self.name; "HelloJob"; end
    end
  end

  let(:logging_job) do
    Class.new(ActiveJob::Base) do
      def perform; end
      def self.name; "LoggingJob"; end
    end
  end

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  describe "have_enqueued_job" do
    it "raises ArgumentError when no Proc passed to expect" 


    it "passes with default jobs count (exactly one)" 


    it "passes when using alias" 


    it "counts only jobs enqueued in block" 


    it "passes when negated" 


    it "fails when job is not enqueued" 


    it "fails when too many jobs enqueued" 


    it "reports correct number in fail error message" 


    it "fails when negated and job is enqueued" 


    it "passes with job name" 


    it "passes with multiple jobs" 


    it "passes with :once count" 


    it "passes with :twice count" 


    it "passes with :thrice count" 


    it "passes with at_least count when enqueued jobs are over limit" 


    it "passes with at_most count when enqueued jobs are under limit" 


    it "generates failure message with at least hint" 


    it "generates failure message with at most hint" 


    it "passes with provided queue name" 


    it "passes with provided at date" 


    it "has an enqueued job when providing at of :no_wait and there is no wait" 


    it "has an enqueued job when not providing at and there is a wait" 


    it "does not have an enqueued job when providing at of :no_wait and there is a wait" 


    it "passes with provided arguments" 


    it "passes with provided arguments containing global id object" 


    it "passes with provided argument matchers" 


    it "generates failure message with all provided options" 


    it "throws descriptive error when no test adapter set" 


    it "fails with with block with incorrect data" 


    it "passes multiple arguments to with block" 


    it "passess deserialized arguments to with block" 


    it "ignores undeserializable arguments" 


    it "only calls with block if other conditions are met" 

  end

  describe "have_been_enqueued" do
    before { ActiveJob::Base.queue_adapter.enqueued_jobs.clear }

    it "passes with default jobs count (exactly one)" 


    it "counts all enqueued jobs" 


    it "passes when negated" 


    it "fails when job is not enqueued" 

  end
end

