require 'rails_helper'

describe ColorSchemeRevisor do

  let(:color)        { Fabricate.build(:color_scheme_color, hex: 'FFFFFF', color_scheme: nil) }
  let(:color_scheme) { Fabricate(:color_scheme, created_at: 1.day.ago, updated_at: 1.day.ago, color_scheme_colors: [color]) }
  let(:valid_params) { { name: color_scheme.name, colors: nil } }

  describe "revise" do
    it "does nothing if there are no changes" 


    it "can change the name" 


    it "can update the base_scheme_id" 


    it 'can change colors' 


    it "doesn't make changes when a color is invalid" 

  end

end

