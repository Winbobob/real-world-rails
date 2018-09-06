# frozen_string_literal: true

require 'rails_helper'

describe CreateDerivativesJob do
  let(:file_set) { build(:file_set) }

  context 'when the job fails' do
    before do
      allow(CurationConcerns::WorkingDirectory).to receive(:find_or_retrieve).and_return('filename')
      allow(file_set).to receive(:create_derivatives).and_raise(StandardError, 'failed to create derivatives')
    end

    it 'sends a message to the user' 

  end
end

