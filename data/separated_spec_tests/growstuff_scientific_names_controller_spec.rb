require 'rails_helper'

describe ScientificNamesController do
  login_member(:crop_wrangling_member)

  before(:each) do
    @crop = FactoryBot.create(:tomato)
  end

  def valid_attributes
    { name: 'Solanum lycopersicum', crop_id: @crop.id }
  end

  describe "GET new" do
    it "assigns crop if specified" 

  end
end

