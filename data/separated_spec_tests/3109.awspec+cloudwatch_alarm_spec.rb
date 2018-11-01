require 'spec_helper'

describe 'Awspec::Generator::Spec::CloudwatchAlarm' do
  before do
    Awspec::Stub.load 'cloudwatch_alarm'
  end
  let(:cloudwatch_alarm) { Awspec::Generator::Spec::CloudwatchAlarm.new }
  it 'generate_all generate spec' 

end

