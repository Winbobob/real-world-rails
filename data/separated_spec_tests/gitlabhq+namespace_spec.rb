require 'spec_helper'

describe Gitlab::Kubernetes::Namespace do
  let(:name) { 'a_namespace' }
  let(:client) { double('kubernetes client') }
  subject { described_class.new(name, client) }

  it { expect(subject.name).to eq(name) }

  describe '#exists?' do
    context 'when namespace do not exits' do
      let(:exception) { ::Kubeclient::HttpError.new(404, "namespace #{name} not found", nil) }

      it 'returns false' 

    end

    context 'when namespace exits' do
      let(:namespace) { ::Kubeclient::Resource.new(kind: 'Namespace', metadata: { name: name }) } # partial representation

      it 'returns true' 

    end

    context 'when cluster cannot be reached' do
      let(:exception) { Errno::ECONNREFUSED.new }

      it 'raises exception' 

    end
  end

  describe '#create!' do
    it 'creates a namespace' 

  end

  describe '#ensure_exists!' do
    it 'checks for existing namespace before creating' 


    it 'do not re-create an existing namespace' 

  end
end

