# frozen_string_literal: true

describe EvilQuery::MultiStream do
  let(:evil_query) { EvilQuery::MultiStream.new(alice, "created_at", Time.zone.now, true) }

  describe 'community_spotlight_posts!' do
    it 'does not raise an error' 

  end

  describe "make_relation!" do
    it "includes public posts of someone you follow" 


    it "includes private posts of contacts with a mutual relationship" 


    it "doesn't include posts of followers that you don't follow back" 


    it "doesn't include posts with tags from ignored users" 

  end
end

describe EvilQuery::Participation do
  before do
    @status_message = FactoryGirl.create(:status_message, :author => bob.person)
  end

  it "includes posts liked by the user" 


  it "includes posts commented by the user" 


  it "should include your statusMessages" 


  describe "ordering" do
    before do
      @status_messageA = FactoryGirl.create(:status_message, :author => bob.person)
      @status_messageB = FactoryGirl.create(:status_message, :author => bob.person)
      @status_messageD = FactoryGirl.create(:status_message, :author => bob.person)
      @status_messageE = FactoryGirl.create(:status_message, :author => bob.person)

      time = Time.now

      Timecop.freeze do
        Timecop.travel time += 1.month

        alice.comment!(@status_messageB, "party")
        Timecop.travel time += 1.month

        alice.like!(@status_messageA)
        Timecop.travel time += 1.month

        alice.comment!(@status_messageE, "party")
      end
    end

    let(:posts) {EvilQuery::Participation.new(alice).posts}

    it "doesn't include Posts that aren't acted on" 


    it "returns the posts that the user has commented on most recently first" 

  end

  describe "multiple participations" do
    before do
      @like = alice.like!(@status_message)
      @comment = alice.comment!(@status_message, "party")
    end

    let(:posts) { EvilQuery::Participation.new(alice).posts }

    it "includes Posts with multiple participations" 


    it "includes Posts with multiple participations only once" 


    it "includes Posts with multiple participations only once for the post author" 


    it "includes Posts with multiple participation after removing one participation" 


    it "doesn't includes Posts after removing all of their participations" 

  end
end

