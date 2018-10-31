require 'rails_helper'

describe CropsHelper do
  describe "display_seed_availability" do
    before :each do
      @member =  create :member
      @crop = create :tomato
    end

    context "with no seeds" do
      it 'should render' 

    end

    context "with an unknown quantity of seeds" do
      before do
        create :seed, crop: @crop, quantity: nil, owner: @member
      end

      it 'should render' 

    end

    context "with an quantity of seeds" do
      before do
        a_different_crop = create :apple

        create :seed, crop: @crop, quantity: 20, owner: @member
        create :seed, crop: @crop, quantity: 13, owner: @member

        create :seed, crop: a_different_crop, quantity: 3, owner: @member
      end

      it 'should render' 

    end
  end
end

