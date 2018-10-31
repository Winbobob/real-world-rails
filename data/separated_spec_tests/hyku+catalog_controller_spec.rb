RSpec.describe CatalogController do
  describe "GET /show" do
    let(:file_set) { create(:file_set) }

    context "with access" do
      before do
        sign_in create(:user)
        allow(controller).to receive(:can?).and_return(true)
      end

      it "is successful" 

    end

    context "without access" do
      it "is redirects to sign in" 

    end
  end
end

