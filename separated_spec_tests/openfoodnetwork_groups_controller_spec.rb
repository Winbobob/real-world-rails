require 'spec_helper'

describe GroupsController, type: :controller do
  render_views
  let(:enterprise) { create(:distributor_enterprise) }
  let!(:group) { create(:enterprise_group, enterprises: [enterprise], on_front_page: true) }
  it "gets all visible groups" 


  it "loads all enterprises for group" 

end
