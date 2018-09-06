require 'rails_helper'

RSpec.describe 'admin can change weights for split variants' do
  let(:split_page) { app.admin_split_show_page }
  let(:split_config_new_page) { app.admin_split_config_new_page }

  let!(:split) { FactoryBot.create :split, registry: { red: 100, blue: 0 } }
  let!(:identifier_type) { FactoryBot.create :identifier_type, name: "ident_type_a" }

  before do
    login
  end

  it 'allows admins to change the weights of a split' 

end

