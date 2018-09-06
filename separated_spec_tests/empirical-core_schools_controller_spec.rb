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


end

