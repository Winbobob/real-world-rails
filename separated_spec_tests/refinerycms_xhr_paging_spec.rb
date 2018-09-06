require "spec_helper"

module Refinery
  describe "Crudify", type: :feature do
    refinery_login

    describe "xhr_paging", :js do
      # Refinery::Admin::ImagesController specifies :order => 'created_at DESC' in crudify
      let(:first_image) { Image.order('created_at DESC').first }
      let(:last_image) { Image.order('created_at DESC').last }
      let!(:image_1) { FactoryBot.create :image }
      let!(:image_2) { FactoryBot.create :image }

      before do
        allow(Image).to receive(:per_page).and_return(1)
      end

      it 'performs ajax paging of index' 

    end
  end

end

