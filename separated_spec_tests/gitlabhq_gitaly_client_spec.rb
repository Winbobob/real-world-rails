require 'spec_helper'

# We stub Gitaly in `spec/support/gitaly.rb` for other tests. We don't want
# those stubs while testing the GitalyClient itself.
describe Gitlab::GitalyClient, skip_gitaly_mock: true do
  describe '.stub_class' do
    it 'returns the gRPC health check stub' 


    it 'returns a Gitaly stub' 

  end

  describe '.stub_address' do
    it 'returns the same result after being called multiple times' 

  end

  describe '.stub' do
    # Notice that this is referring to gRPC "stubs", not rspec stubs
    before do
      described_class.clear_stubs!
    end

    context 'when passed a UNIX socket address' do
      it 'passes the address as-is to GRPC' 

    end

    context 'when passed a TCP address' do
      it 'strips tcp:// prefix before passing it to GRPC::Core::Channel initializer' 

    end
  end

  describe 'allow_n_plus_1_calls' do
    context 'when RequestStore is enabled', :request_store do
      it 'returns the result of the allow_n_plus_1_calls block' 

    end

    context 'when RequestStore is not active' do
      it 'returns the result of the allow_n_plus_1_calls block' 

    end
  end

  describe 'enforce_gitaly_request_limits?' do
    def call_gitaly(count = 1)
      (1..count).each do
        described_class.enforce_gitaly_request_limits(:test)
      end
    end

    context 'when RequestStore is enabled', :request_store do
      it 'allows up the maximum number of allowed calls' 


      context 'when the maximum number of calls has been reached' do
        before do
          call_gitaly(Gitlab::GitalyClient::MAXIMUM_GITALY_CALLS)
        end

        it 'fails on the next call' 

      end

      it 'allows the maximum number of calls to be exceeded within an allow_n_plus_1_calls block' 


      context 'when the maximum number of calls has been reached within an allow_n_plus_1_calls block' do
        before do
          described_class.allow_n_plus_1_calls do
            call_gitaly(Gitlab::GitalyClient::MAXIMUM_GITALY_CALLS)
          end
        end

        it 'allows up to the maximum number of calls outside of an allow_n_plus_1_calls block' 


        it 'does not allow the maximum number of calls to be exceeded outside of an allow_n_plus_1_calls block' 

      end
    end

    context 'when RequestStore is not active' do
      it 'does not raise errors when the maximum number of allowed calls is exceeded' 


      it 'does not fail when the maximum number of calls is exceeded within an allow_n_plus_1_calls block' 

    end
  end

  describe 'get_request_count' do
    context 'when RequestStore is enabled', :request_store do
      context 'when enforce_gitaly_request_limits is called outside of allow_n_plus_1_calls blocks' do
        before do
          described_class.enforce_gitaly_request_limits(:call)
        end

        it 'counts gitaly calls' 

      end

      context 'when enforce_gitaly_request_limits is called inside and outside of allow_n_plus_1_calls blocks' do
        before do
          described_class.enforce_gitaly_request_limits(:call)
          described_class.allow_n_plus_1_calls do
            described_class.enforce_gitaly_request_limits(:call)
          end
        end

        it 'counts gitaly calls' 

      end

      context 'when reset_counts is called' do
        before do
          described_class.enforce_gitaly_request_limits(:call)
          described_class.reset_counts
        end

        it 'resets counts' 

      end
    end

    context 'when RequestStore is not active' do
      before do
        described_class.enforce_gitaly_request_limits(:call)
      end

      it 'returns zero' 

    end
  end

  describe 'feature_enabled?' do
    let(:feature_name) { 'my_feature' }
    let(:real_feature_name) { "gitaly_#{feature_name}" }

    context 'when Gitaly is disabled' do
      before do
        allow(described_class).to receive(:enabled?).and_return(false)
      end

      it 'returns false' 

    end

    context 'when the feature status is DISABLED' do
      let(:feature_status) { Gitlab::GitalyClient::MigrationStatus::DISABLED }

      it 'returns false' 

    end

    context 'when the feature_status is OPT_IN' do
      let(:feature_status) { Gitlab::GitalyClient::MigrationStatus::OPT_IN }

      context "when the feature flag hasn't been set" do
        it 'returns false' 

      end

      context "when the feature flag is set to disable" do
        before do
          Feature.get(real_feature_name).disable
        end

        it 'returns false' 

      end

      context "when the feature flag is set to enable" do
        before do
          Feature.get(real_feature_name).enable
        end

        it 'returns true' 

      end

      context "when the feature flag is set to a percentage of time" do
        before do
          Feature.get(real_feature_name).enable_percentage_of_time(70)
        end

        it 'bases the result on pseudo-random numbers' 

      end

      context "when a feature is not persisted" do
        it 'returns false when opt_into_all_features is off' 


        it 'returns true when the override is on' 

      end
    end

    context 'when the feature_status is OPT_OUT' do
      let(:feature_status) { Gitlab::GitalyClient::MigrationStatus::OPT_OUT }

      context "when the feature flag hasn't been set" do
        it 'returns true' 

      end

      context "when the feature flag is set to disable" do
        before do
          Feature.get(real_feature_name).disable
        end

        it 'returns false' 

      end
    end
  end

  describe 'timeouts' do
    context 'with default values' do
      before do
        stub_application_setting(gitaly_timeout_default: 55)
        stub_application_setting(gitaly_timeout_medium: 30)
        stub_application_setting(gitaly_timeout_fast: 10)
      end

      it 'returns expected values' 

    end
  end
end

