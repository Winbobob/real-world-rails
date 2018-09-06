# frozen_string_literal: true

require 'rails_helper'

describe BatchEditForm do
  describe '::build_permitted_params' do
    subject { described_class }

    its(:build_permitted_params) { is_expected.to include(:visibility) }
    its(:build_permitted_params) { is_expected.to include(creators: [
                                                            :id,
                                                            :display_name,
                                                            :given_name,
                                                            :sur_name,
                                                            :psu_id,
                                                            :email,
                                                            :orcid_id,
                                                            :_destroy
                                                          ]) }
  end

  describe '#initialize_combined_fields' do
    let(:user) { build(:user) }
    let(:ability) { Ability.new(user) }
    let(:work1) { create(:work, :with_complete_metadata, title: ['First batch work']) }
    let(:work2) { create(:work, :with_complete_metadata, title: ['Second batch work']) }
    let(:batch) { [work1.id, work2.id] }
    let(:model) { BatchEditItem.new(batch: batch) }
    let(:form) { described_class.new(model, ability, batch) }

    it 'sets names and model to a combined set of attributes' 

  end
end

