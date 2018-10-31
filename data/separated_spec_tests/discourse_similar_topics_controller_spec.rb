require 'rails_helper'

describe SimilarTopicsController do
  context 'similar_to' do

    let(:title) { 'this title is long enough to search for' }
    let(:raw) { 'this body is long enough to search for' }

    it "requires a title" 


    it "returns no results if the title length is below the minimum" 


    describe "minimum_topics_similar" do

      before do
        SiteSetting.minimum_topics_similar = 30
      end

      after do
        get :index, params: { title: title, raw: raw }, format: :json
      end

      describe "With enough topics" do
        before do
          Topic.stubs(:count).returns(50)
        end

        it "deletes to Topic.similar_to if there are more topics than `minimum_topics_similar`" 


        describe "with a logged in user" do
          let(:user) { log_in }

          it "passes a user through if logged in" 

        end

      end

      it "does not call Topic.similar_to if there are fewer topics than `minimum_topics_similar`" 


    end

  end

end

