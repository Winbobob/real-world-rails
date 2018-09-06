require 'spec_helper'

describe ChefSpec::Matchers::NotificationsMatcher do
  subject { described_class.new('execute[install]') }
  let(:package) do
    double('package',
      name: 'package',
      to_s: 'package[foo]',
      is_a?: true,
      performed_action?: true,
      immediate_notifications: [],
      delayed_notifications: [],
      before_notifications: []
    )
  end

  describe '#failure_message' do
    it 'has the right value' 

  end

  describe '#failure_message_when_negated' do
    it 'has the right value' 

  end

  describe '#description' do
    it 'has the right value' 

  end
end

