require 'rails_helper'

RSpec.describe 'split decision flow' do
  let(:split_page) { app.admin_split_show_page }
  let(:split_decision_page) { app.admin_split_decision_new_page }
  let(:user_id_values) { %w(4 8 15 16 23) }
  let!(:split) { FactoryBot.create :split }
  let!(:id_type_user_ids) { FactoryBot.create :identifier_type, name: "user_ids" }

  let!(:existing_identifiers) do
    user_id_values.map { |user_id| FactoryBot.create(:identifier, value: user_id, identifier_type: id_type_user_ids) }
  end
  let!(:existing_assignments) do
    existing_identifiers.map do |identifier|
      FactoryBot.create(:assignment, visitor: identifier.visitor, split: split, variant: "hammer_time")
    end
  end

  before do
    login
  end

  it 'allows an admin to decide a split' 

end

