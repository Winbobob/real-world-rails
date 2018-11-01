require 'spec_helper'

describe 'Awspec::Generator::Spec::CloudwatchEvent' do
  before do
    Awspec::Stub.load 'cloudwatch_event'
  end
  let(:cloudwatch_event) { Awspec::Generator::Spec::CloudwatchEvent.new }
  it 'generate_all generate spec' 

end

