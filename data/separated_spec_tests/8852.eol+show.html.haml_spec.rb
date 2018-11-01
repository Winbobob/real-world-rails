# EXEMPLAR

describe "content_partners/show" do
  let(:user) { build_stubbed(:user) }
  let(:partner) { build_stubbed(:content_partner, user: user) }

  subject { render }

  before(:each) do
    view.stub(:meta_open_graph_data) { {} }
    view.stub(:tweet_data) { {} }
    view.stub(:current_user) { user }
    assign(:partner, partner)
  end

  it { expect(subject).to have_tag("a") }

  context "without collections" do
    it "shows empty collections message" 

  end

  context "with collections" do
    let(:collection) { build_stubbed(:collection) }
    before(:each) do
      allow(partner).to receive(:collections) { [collection] }
    end

    it "has list of collections" 

  end

  context "user can update" do
    context "with empty notes" do
      it "shows empty notes message" 

    end

    context "with notes" do
      before(:each) do
        allow(partner).to receive(:notes) { "Hi there" }
      end

      it "shows notes" 

    end
  end

  context "when user is admin" do
    before(:each) do
      allow(user).to receive(:is_admin?) { true }
    end
    context "with admin notes" do
      before(:each) do
        allow(partner).to receive(:admin_notes) { "Hi Admin!" }
      end

      it "shows notes message" 

    end

    context "without admin notes" do
      it "shows notes missing message" 

    end
  end

  context "without content_partner homepage" do
    it "has no link to the homepage" 

  end

  context "with content_partner homepage" do
    before(:each) do
      allow(partner).to receive(:homepage) { "My home page!!" }
    end
    it "shows the link to homepage" 

  end

  context "with agreement" do
    let(:agreement) do
      build_stubbed(:content_partner_agreement, content_partner: partner)
    end

    before(:each) do
      allow(partner).to receive(:agreement) { agreement }
    end

    context "when user owns content_partner" do

      it { expect(subject).to have_selector("dl.agreement") }
    end

    context "when user does not own content_partner" do
      let(:partner) { build_stubbed(:content_partner) }
      it { expect(subject).to_not have_selector("dl.agreement") }
    end
  end

  context "when user can update content partner" do
    context "with description of data" do
      before(:each) do
        allow(partner).to receive(:description_of_data) { "All described!" }
      end
      it "shows data description" 

    end

    context "without description of data" do
      before(:each) do
        allow(partner).to receive(:description_of_data) { "" }
      end

      it "shows empty data description message" 

    end
  end

  context "when user cannot update content partner" do
    let(:partner) { build_stubbed(:content_partner) }

    it "does not show header for data description" 

  end
end

