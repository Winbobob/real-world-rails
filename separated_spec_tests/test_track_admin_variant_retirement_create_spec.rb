require 'rails_helper'

RSpec.describe 'admin can retire a variant for a split' do
  let(:split_page) { app.admin_split_show_page }
  let(:variant_page) { app.admin_variant_details_edit_page }
  let!(:split) { FactoryBot.create :split, registry: { red: 25, blue: 0, green: 25, yellow: 25, orange: 25 } }

  before do
    FactoryBot.create(:assignment, split: split, variant: :red)
    FactoryBot.create(:assignment, split: split, variant: :green)
    FactoryBot.create(:assignment, split: split, variant: :yellow)
    FactoryBot.create_list(:assignment, 8, split: split, variant: :blue)

    login
  end

  it 'allows admins to retire a variant' 

end

