require 'spec_helper'

# HTML email
describe "alert_notifier/alert.html.haml" do
  let(:application) do
    VCR.use_cassette('planningalerts') do
      create(:application,
             description: "Alterations & additions",
             address: "24 Bruce Road Glenbrook")
    end
  end

  before(:each) do
    assign(:applications, [application])
    assign(:comments, [])
    assign(:replies, [])
    assign(:host, "foo.com")
    assign(:theme, "default")
  end

  it "should not use html entities to encode the description" 


  context "when there is a comment to an authority" do
    before do
      comment = VCR.use_cassette('planningalerts') do
        create(:comment_to_authority,
               name: "Matthew Landauer",
               application: application)
      end
      assign(:comments, [comment])
      assign(:alert, create(:alert))

      render
    end

    it { expect(rendered).to have_content("Matthew Landauer commented") }
    it { expect(rendered).to have_content("On “Alterations & additions” at 24 Bruce Road Glenbrook") }
  end

  context "when there is a comment to a councillor" do
    let(:comment) do
      VCR.use_cassette('planningalerts') do
        create(:comment_to_councillor, name: "Matthew Landauer")
      end
    end

    before :each do
      assign(:comments, [comment])
      assign(:alert, create(:alert))
    end

    it "includes the comment" 


    context "and it has not be replied to" do
      before :each do
        render
      end

      it { expect(rendered).to have_content("Delivered to local councillor Louise Councillor") }
      it { expect(rendered).to have_content("They are yet to respond") }
    end

    context "and it has be replied to" do
      let(:reply) { create(:reply, comment: comment, councillor: comment.councillor) }

      before :each do
        assign(:replies, [reply])

        render
      end

      it { expect(rendered).to_not have_content("They are yet to respond") }
    end
  end

  context "when there is a reply from a councillor" do
    before do
      comment = VCR.use_cassette('planningalerts') do
        create(:comment_to_councillor, name: "Matthew Landauer")
      end
      multi_line_reply_text = "Thanks for your comment\n\nBest wishes,\nLouise"
      reply = create(
        :reply,
        text: multi_line_reply_text,
        comment: comment,
        councillor: comment.councillor
      )
      assign(:replies, [reply])
      assign(:alert, create(:alert))

      render
    end

    it { expect(rendered).to have_content "Local councillor Louise Councillor replied to Matthew Landauer"}

    it "renders linebreak formatting into html" 

  end
end

# Text only email
describe "alert_notifier/alert.text.erb" do
  let(:application) do
    VCR.use_cassette('planningalerts') do
      create(:application,
             description: "Alterations & additions",
             address: "24 Bruce Road Glenbrook")
    end
  end

  before(:each) do
    assign(:applications, [application])
    assign(:comments, [])
    assign(:replies, [])
    assign(:host, "foo.com")
    assign(:theme, "default")
  end

  context "when there is a comment to an authority" do
    before do
      comment = VCR.use_cassette('planningalerts') do
        create(:comment_to_authority,
               name: "Matthew Landauer",
               application: application)
      end
      assign(:comments, [comment])
      assign(:alert, create(:alert))

      render
    end

    it { expect(rendered).to have_content("Matthew Landauer commented") }
    it { expect(rendered).to have_content("on “Alterations & additions” at 24 Bruce Road Glenbrook") }
  end

  context "when there is a comment to a councillor" do
    before do
      comment = VCR.use_cassette('planningalerts') do
        create(:comment_to_councillor, name: "Matthew Landauer")
      end
      assign(:comments, [comment])
      assign(:alert, create(:alert))

      render
    end

    it { expect(rendered).to have_content("Matthew Landauer wrote to local councillor Louise Councillor") }
  end

  context "when there is a reply from a councillor" do
    before do
      comment = VCR.use_cassette('planningalerts') do
        create(:comment_to_councillor, name: "Matthew Landauer")
      end
      reply = create(:reply, comment: comment, councillor: comment.councillor)
      assign(:replies, [reply])
      assign(:alert, create(:alert))

      render
    end

    it { expect(rendered).to have_content "Local councillor Louise Councillor replied to Matthew Landauer"}
  end
end

