require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!



describe Units::Creator do
  let!(:classroom) { create(:classroom) }
  let!(:teacher) { classroom.owner }

  describe 'unit_creator' do

    it 'creates a unit with teacher and kicks off an assign activity worker' 


  end
end

