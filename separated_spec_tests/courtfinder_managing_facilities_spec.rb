require 'spec_helper'

feature 'As an admin I should be able to manage facility' do
  let!(:user) { create(:admin) }
  let(:file) { File.open(Rails.root.join('spec', 'fixtures', 'assets', 'firstaid.png').to_s) }
  let(:facility) { create(:facility, name: 'baby', image_file: file) }

  before do
    visit '/admin'
    sign_in user
  end

  it 'I am able to create facility' 


  context 'existing facility' do
    before do
      visit edit_admin_facility_path(facility)
    end

    it 'I am able to update facility' 


    it 'List of facilities with image file' 

  end

  def upload_icon(name)
    image_path = Rails.root.join('spec', 'fixtures', 'assets', name.to_s)
    attach_file('facility_image_file', image_path.to_s)
  end
end

