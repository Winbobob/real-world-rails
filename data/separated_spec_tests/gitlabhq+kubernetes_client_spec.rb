# frozen_string_literal: true

require 'fast_spec_helper'

RSpec.describe Quality::KubernetesClient do
  let(:namespace) { 'review-apps-ee' }
  let(:release_name) { 'my-release' }

  subject { described_class.new(namespace: namespace) }

  describe '#cleanup' do
    it 'raises an error if the Kubernetes command fails' 


    it 'calls kubectl with the correct arguments' 

  end
end

