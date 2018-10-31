require 'rails_helper'

RSpec.describe AdminPluginSerializer do
  let(:instance) { Plugin::Instance.new }

  subject { described_class.new(instance) }

  describe 'enabled_setting' do
    it 'should return the right value' 

  end
end

