require 'rails_helper'

describe PlantingsHelper do
  describe "display_planting" do
    let!(:member) { FactoryBot.build(:member, login_name: 'crop_lady') }

    it "does not have a quantity nor a planted from value provided" 


    it "does not have a quantity provided" 


    context "when quantity is greater than 1" do
      it "does not have a planted from value provided" 


      it "does have a planted from value provided" 

    end

    context "when quantity is 1" do
      it "does not have a planted from value provided" 


      it "does have a planted from value provided" 

    end
  end
end

