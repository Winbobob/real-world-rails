# frozen_string_literal: true

describe Workers::CleanupOldExports do
  let(:user) { FactoryGirl.create(:user) }

  context "with profile data" do
    before do
      user.perform_export!
    end

    it "removes old archives" 


    it "does not remove new archives" 

  end

  context "with photos" do
    before do
      user.perform_export_photos!
    end

    it "removes old archives" 


    it "does not remove new archives" 

  end
end

