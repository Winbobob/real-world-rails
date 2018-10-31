# frozen_string_literal: true

require 'rails_helper'

describe Sufia::ChangeContentDepositorService do
  let!(:depositor) { create(:user) }
  let!(:receiver)  { create(:user) }
  let!(:file)      { create(:file_set, :public, user: depositor) }
  let!(:work)      { create(:public_work, depositor: depositor.user_key) }

  before do
    work.members << file
    described_class.call(work, receiver, reset)
  end

  context 'by default, when permissions are not reset' do
    let(:reset) { false }

    it 'changes the depositor and records an original depositor' 


    it 'changes the depositor of the child file sets' 

  end

  context 'when permissions are reset' do
    let(:reset) { true }

    it 'excludes the depositor from the edit users' 


    it 'changes the depositor of the child file sets' 

  end
end

