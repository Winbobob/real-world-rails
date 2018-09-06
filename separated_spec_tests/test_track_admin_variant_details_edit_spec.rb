require 'rails_helper'

RSpec.describe 'admin can edit variant details' do
  let(:split_page) { app.admin_split_show_page }
  let(:variant_page) { app.admin_variant_details_edit_page }

  let!(:split) { FactoryBot.create(:split, name: 'great_feature', registry: { enabled: 100, disabled: 0 }) }
  let(:variant_to_retire) { :disabled }

  let(:variant_screenshot) { Rails.root.join('spec', 'support', 'uploads', 'ttlogo.png') }

  before do
    FactoryBot.create_list(:assignment, 2, split: split, variant: variant_to_retire)
    login
  end

  it 'allows admins to edit variant details' 


  context 'when a split variant can be retired' do
    it 'allows admins to retire variant details' 

  end
end

