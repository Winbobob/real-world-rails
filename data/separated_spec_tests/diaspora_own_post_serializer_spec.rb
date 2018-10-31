# frozen_string_literal: true

describe Export::OwnPostSerializer do
  let(:author) { FactoryGirl.create(:user_with_aspect).person }

  before do
    author.owner.share_with(FactoryGirl.create(:person), author.owner.aspects.first)
  end

  it_behaves_like "a federation entity serializer" do
    let(:object) { create(:status_message_with_photo, author: author) }
  end

  let(:json) { Export::OwnPostSerializer.new(post, root: false).to_json }

  context "with private post" do
    let(:post) { create(:status_message_in_aspect, author: author) }

    it "includes remote people subscriptions" 


    it "doesn't include remote pods subscriptions" 

  end

  context "with public post" do
    let(:post) {
      FactoryGirl.create(
        :status_message_with_participations,
        author:       author,
        participants: Array.new(2) { FactoryGirl.create(:person) },
        public:       true
      )
    }

    it "includes pods subscriptions" 


    it "doesn't include remote people subscriptions" 

  end
end

