# frozen_string_literal: true

require 'rails_helper'

describe RDFAuthorityImportJob do
  let(:file) { double }

  context 'with no authority' do
    it 'raises and error' 

  end

  context 'with an authority' do
    before { allow(described_class).to receive(:authority).and_return('the law') }
    it 'imports the authority from a file using Questioning Authority' 

  end
end

