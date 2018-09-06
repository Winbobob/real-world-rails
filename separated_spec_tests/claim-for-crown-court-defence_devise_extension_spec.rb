require 'rails_helper'

describe DeviseExtension do
  let(:example_class) { Class.new { extend DeviseExtension } }

  context '#override_paranoid_setting (original value being true)' do
    before { Devise.paranoid = true }

    it 'should override the setting and call the passed block' 

  end

  context '#override_paranoid_setting (original value being false)' do
    before { Devise.paranoid = false }

    it 'should override the setting and call the passed block' 

  end
end

