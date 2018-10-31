require "rails_helper"

describe ImportsController do
  describe "#create" do
    context "when the import fails to save" do
      it "apologizes to the user" 

    end

  end

  def stub_current_user
    allow(controller).to(receive(:authenticate_user!))
    allow(controller).to(receive(:current_user))
  end
end

