require 'rails_helper'

describe SchoolsController, type: :controller do
  render_views

  before do
    @school = School.create(
      zipcode: '60657',
      name: "Josh's Finishing School"
    )
  end

  it 'fetches schools based on zipcode' 


  it 'returns an error if no zipcode is passed' 


  describe '#select_school' do
    let(:user) { create(:user) }
    let(:school_user) { create(:school_user, user: user) }

    before do
      allow(controller).to receive(:current_user) { user }
    end

    it 'should fire up the sync sales contact worker' 

  end

end

