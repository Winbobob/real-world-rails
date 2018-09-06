require 'rails_helper'

RSpec.describe 'admin can add details to a split' do
  let(:split_page) { app.admin_split_show_page }
  let(:split_details_page) { app.admin_split_details_page }

  let!(:split) { FactoryBot.create :split }

  let(:owner_name) { "Go Getters" }
  let(:description) { "We go and get" }
  let(:platform) { "mobile" }
  let(:location) { "On the page that sells cheese" }
  let(:hypothesis) { "Users who like cheese will also like investing in cheese companies" }
  let(:assignment_criteria) { "Users must love cheese" }

  before do
    login
  end

  it 'allows admins to add details to a split' 

end

