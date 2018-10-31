require 'rails_helper'

describe 'help/instance_configuration' do
  describe 'General Sections:' do
    let(:instance_configuration) { build(:instance_configuration)}
    let(:settings) { instance_configuration.settings }
    let(:ssh_settings) { settings[:ssh_algorithms_hashes] }

    before do
      assign(:instance_configuration, instance_configuration)
    end

    it 'has links to several sections' 


    it 'has several sections' 

  end
end

