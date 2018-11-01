require 'spec_helper'

describe CourtTypesController do
  render_views

  before :each do
    @court_type = CourtType.create!.reload
    controller.should_receive(:set_vary_header).once
  end

  it "displays a list of court types" 


  it "displays a particular court type" 

end

