# frozen_string_literal: true

require 'rails_helper'

describe CurationConcerns::PermissionsController do
  let(:curation_concern) { build(:work, id: '1234') }

  describe '#copy_access' do
    before do
      allow(controller).to receive(:curation_concern).and_return(curation_concern)
      allow(controller).to receive(:authorize!).with(:edit, curation_concern).and_return(true)
    end

    it 'calls CopyPermissionsJob' 

  end
end

