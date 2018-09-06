require 'spec_helper'

describe Gitlab::Middleware::ReleaseEnv do
  let(:inner_app) { double(:app, call: 'yay') }
  let(:app) { described_class.new(inner_app) }
  let(:env) { { 'action_controller.instance' => 'something' } }

  describe '#call' do
    it 'calls the app and clears the env' 

  end
end

