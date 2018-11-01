# frozen_string_literal: true

require 'spec_helper'

describe AuditEventService do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:project_member) { create(:project_member, user: user) }
  let(:service) { described_class.new(user, project, { action: :destroy }) }
  let(:logger) { instance_double(Gitlab::AuditJsonLogger) }

  describe '#security_event' do
    before do
      expect(service).to receive(:file_logger).and_return(logger)
    end

    it 'creates an event and logs to a file' 

  end
end

