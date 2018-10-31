require "spec_helper"

describe OrganizedHelper do
  describe "organized bike display" do
    let(:bike) { FactoryGirl.create(:creation_organization_bike) }
    let(:target_text) do
      "<span>#{bike.frame_colors.first} <strong>#{bike.mnfg_name}</strong></span>"
    end
    it "renders" 

  end
end

