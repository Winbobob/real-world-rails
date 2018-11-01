# frozen_string_literal: true

require 'rails_helper'

describe ImportUrlJob do
  let(:user)             { create(:user) }
  let(:file_set)         { create(:file_set, user: user, import_url: 'import_url') }
  let(:log)              { double }
  let(:mock_retriever)   { double }
  let(:http_status)      { true }
  let(:mock_http_result) { instance_double('HTTParty::Response', success?: http_status) }
  let(:file_name)        { 'Development Team Projects and Milestones (not downloaded).xlsx' }
  let(:inbox)            { user.mailbox.inbox }

  before do
    allow(log).to receive(:performing!)
    allow(BrowseEverything::Retriever).to receive(:new).and_return(mock_retriever)
    allow(mock_retriever).to receive(:retrieve)
    allow(Hydra::Works::VirusCheckerService).to receive(:file_has_virus?).and_return(false)
    allow(HTTParty).to receive(:head).and_return(mock_http_result)
  end

  context 'with a successful import' do
    it 'attaches a sanitized the file name to the file set' 

  end

  context 'when the remote file is unavailable' do
    let(:http_status) { false }

    it 'logs the error and renames the file set' 

  end

  context 'when retrieval fails' do
    before { allow(mock_retriever).to receive(:retrieve).and_raise(StandardError, 'Timeout') }

    it 'logs the error and renames the file set' 

  end
end

