# frozen_string_literal: true

require 'rails_helper'

describe ResolrizeJob, :clean do
  let(:user) { create(:jill) }
  let!(:file_set) { create(:file_set, :with_png, id: "abc#{(Random.rand * 10_000).to_i}", depositor: user.login) }
  let(:job) { described_class.new }

  describe '#perform' do
    before do
      allow(ActiveFedora::Base).to receive(:find).and_call_original
    end
    it 'Updates the index for all parts of the records' 

  end
end

