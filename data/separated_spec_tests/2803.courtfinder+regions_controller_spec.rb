require 'spec_helper'

describe RegionsController do
  render_views

  before :each do
    @region = Region.create!(name: 'hobbiton').reload
    controller.should_receive(:set_vary_header).once
  end

  it "displays a list of regions" 


  it "displays a particular region by slug" 

end

