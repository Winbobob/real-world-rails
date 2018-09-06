require 'spec_helper'
require 'rspec-puppet/adapters'

def context_double(options = {})
  double({:environment => 'rp_puppet'}.merge(options))
end

describe RSpec::Puppet::Adapters::Base do
  describe '#setup_puppet' do
    it "sets up all settings listed in the settings map" 

  end

  describe '#set_setting' do
    describe "with a context specific setting" do
      it "sets the Puppet setting based on the example group setting" 


      it "does not persist settings between example groups" 

    end

    describe "with a global RSpec configuration setting" do
      before do
        allow(RSpec.configuration).to receive(:confdir).and_return("/etc/bunraku")
      end

      it "sets the Puppet setting based on the global configuration value" 

    end

    describe "with both a global RSpec configuration setting and a context specific setting" do
      before do
        allow(RSpec.configuration).to receive(:confdir).and_return("/etc/bunraku")
      end

      it "prefers the context specific setting" 

    end

    describe "when the setting is not available on the given version of Puppet" do
      it "logs a warning about the setting" 

    end
  end
end

describe RSpec::Puppet::Adapters::Adapter35, :if => (3.5 ... 4.0).include?(Puppet.version.to_f) do

  let(:test_context) { double :environment => 'rp_env' }

  context 'when running on puppet 3.5 or later', :if => (3.5 ... 4.0).include?(Puppet.version.to_f) do
    it 'sets Puppet[:strict_variables] to false by default' 


    it 'reads the :strict_variables setting' 

  end

end

describe RSpec::Puppet::Adapters::Adapter34, :if => (3.4 ... 4.0).include?(Puppet.version.to_f) do

  let(:test_context) { double :environment => 'rp_env' }

  context 'when running on puppet 3.4 or later', :if => (3.4 ... 4.0).include?(Puppet.version.to_f) do
    it 'sets Puppet[:trusted_node_data] to false by default' 


    it 'reads the :trusted_node_data setting' 

  end

end

describe RSpec::Puppet::Adapters::Adapter33, :if => (3.3 ... 4.0).include?(Puppet.version.to_f) do

  let(:test_context) { double :environment => 'rp_env' }

  context 'when running on puppet ~> 3.3', :if => (3.3 ... 4.0).include?(Puppet.version.to_f) do
    it 'sets Puppet[:stringify_facts] to true by default' 


    it 'reads the :stringify_facts setting' 


    it 'sets Puppet[:ordering] to title-hash by default' 


    it 'reads the :ordering setting' 

  end

end

describe RSpec::Puppet::Adapters::Adapter32, :if => (3.2 ... 4.0).include?(Puppet.version.to_f) do

  let(:test_context) { double :environment => 'rp_env' }

  context 'when running on puppet ~> 3.2', :if => (3.2 ... 4.0).include?(Puppet.version.to_f) do
    it 'sets Puppet[:parser] to "current" by default' 


    it 'reads the :parser setting' 

  end

end

describe RSpec::Puppet::Adapters::Adapter4X, :if => Puppet.version.to_f >= 4.0 do

  let(:test_context) { double :environment => 'rp_env' }

  it 'sets Puppet[:strict_variables] to false by default' 


  it 'reads the :strict_variables setting' 


  it 'overrides the environmentpath set by Puppet::Test::TestHelper' 


  describe '#manifest' do
    it 'returns the configured environment manifest when set' 


    it 'returns nil when the configured environment manifest is not set' 

  end
end

