# frozen_string_literal: true

describe QA::Runtime::Env do
  include Support::StubENV

  shared_examples 'boolean method' do |method, env_key, default|
    context 'when there is an env variable set' do
      it 'returns false when falsey values specified' 


      it 'returns true when anything else specified' 

    end

    context 'when there is no env variable set' do
      it "returns the default, #{default}" 

    end
  end

  describe '.signup_disabled?' do
    it_behaves_like 'boolean method', :signup_disabled?, 'SIGNUP_DISABLED', false
  end

  describe '.debug?' do
    it_behaves_like 'boolean method', :debug?, 'QA_DEBUG', false
  end

  describe '.chrome_headless?' do
    it_behaves_like 'boolean method', :chrome_headless?, 'CHROME_HEADLESS', true
  end

  describe '.running_in_ci?' do
    context 'when there is an env variable set' do
      it 'returns true if CI' 


      it 'returns true if CI_SERVER' 

    end

    context 'when there is no env variable set' do
      it 'returns true' 

    end
  end

  describe '.personal_access_token' do
    around do |example|
      described_class.instance_variable_set(:@personal_access_token, nil)
      example.run
      described_class.instance_variable_set(:@personal_access_token, nil)
    end

    context 'when PERSONAL_ACCESS_TOKEN is set' do
      before do
        stub_env('PERSONAL_ACCESS_TOKEN', 'a_token')
      end

      it 'returns specified token from env' 

    end

    context 'when @personal_access_token is set' do
      before do
        described_class.personal_access_token = 'another_token'
      end

      it 'returns the instance variable value' 

    end
  end

  describe '.personal_access_token=' do
    around do |example|
      described_class.instance_variable_set(:@personal_access_token, nil)
      example.run
      described_class.instance_variable_set(:@personal_access_token, nil)
    end

    it 'saves the token' 

  end

  describe '.forker?' do
    before do
      stub_env('GITLAB_FORKER_USERNAME', nil)
      stub_env('GITLAB_FORKER_PASSWORD', nil)
    end

    it 'returns false if no forker credentials are defined' 


    it 'returns false if only forker username is defined' 


    it 'returns false if only forker password is defined' 


    it 'returns true if forker username and password are defined' 

  end

  describe '.github_access_token' do
    it 'returns "" if GITHUB_ACCESS_TOKEN is not defined' 


    it 'returns stripped string if GITHUB_ACCESS_TOKEN is defined' 

  end

  describe '.require_github_access_token!' do
    it 'raises ArgumentError if GITHUB_ACCESS_TOKEN is not defined' 


    it 'does not raise if GITHUB_ACCESS_TOKEN is defined' 

  end

  describe '.log_destination' do
    it 'returns $stdout if QA_LOG_PATH is not defined' 


    it 'returns the path if QA_LOG_PATH is defined' 

  end
end

