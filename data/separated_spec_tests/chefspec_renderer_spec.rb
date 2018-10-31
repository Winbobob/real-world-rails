require 'spec_helper'

describe ChefSpec::Renderer do
  describe '.initialize' do
    it 'accepts two arguments and assigns their instance variables' 

  end

  let(:chef_run) { double('chef_run', {node: 'node'}) }
  let(:resource) { double('resource', {cookbook: 'cookbook', source: 'source', variables: {}}) }
  subject { described_class.new(chef_run, resource) }

  describe '#content' do
    before do
      allow(subject).to receive(:content_from_cookbook_file).and_return('cookbook_file content')
      allow(subject).to receive(:content_from_file).and_return('file content')
      allow(subject).to receive(:content_from_template).and_return('template content')
    end

    context 'when the resource is a cookbook_file' do
      it 'renders the cookbook_file content' 

    end

    context 'when the resource is a file' do
      it 'renders the file content' 

    end

    context 'when the resource is a template' do
      it 'renders the template content' 

    end

    context 'when the resource is not a file type' do
      it 'returns nil' 

    end
  end

  describe 'content_from_template' do
    it 'renders the template by extending modules for rendering paritals within the template' 

  end
end

