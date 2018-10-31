require 'spec_helper'

describe PluginWorker do
  include RepoHelpers

  let(:filename) { 'my_plugin.rb' }
  let(:data) { { 'event_name' => 'project_create' } }

  subject { described_class.new }

  describe '#perform' do
    it 'executes Gitlab::Plugin with expected values' 


    it 'logs message in case of plugin execution failure' 

  end
end

