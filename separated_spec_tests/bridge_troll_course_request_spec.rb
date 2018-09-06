require 'rails_helper'

describe "courses", js: :true do
  let(:admin) { create(:user, admin: true) }

  before do
    sign_in_as(admin)
  end

  it 'allows an admin to create a course with levels' 


  describe 'editing courses' do
    let!(:course) { create(:course, levels_count: 3) }

    it 'allows an admin to remove levels from a course' 

  end

  describe 'reordering course levels' do
    let!(:course) { create(:course, levels_count: 2) }

    it 'reorders course levels if you assign the position to an existing level' 

  end
end

