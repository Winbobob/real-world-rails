require 'spec_helper'

describe ChefSpec::Matchers::RenderFileMatcher do
  let(:path) { '/tmp/thing' }
  let(:file) { double('file', to: path, to_s: "file[#{path}]", performed_action?: true) }
  let(:chef_run) { double('chef run', find_resource: file) }
  subject { described_class.new(path) }

  describe '#with_content' do
    it 'accepts do/end syntax' 

  end

  describe '#failure_message' do
    it 'has the right value' 

  end

  describe '#failure_message_when_negated' do
    it 'has the right value' 

  end

  describe '#description' do
    it 'has the right value' 


    it 'has the right value when with_content is chained' 

  end

  context 'when the file is correct' do
    it 'matches' 


    it 'adds the resource to the coverage report' 

  end

  context 'when the file is not correct' do
    it 'does not match' 

  end
end

