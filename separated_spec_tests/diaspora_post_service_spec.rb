# frozen_string_literal: true

describe PostService do
  let(:post) { alice.post(:status_message, text: "ohai", to: alice.aspects.first) }
  let(:public) { alice.post(:status_message, text: "hey", public: true) }

  describe "#find" do
    context "with user" do
      it "returns the post, if it is the users post" 


      it "returns the post, if the user can see the it" 


      it "returns the post, if it is public" 


      it "does not return the post, if the post cannot be found" 


      it "does not return the post, if user cannot see the post" 

    end

    context "without user" do
      it "returns the post, if it is public" 


      it "does not return the post, if the post is private" 


      it "does not return the post, if the post cannot be found" 

    end
  end

  describe "#find!" do
    context "with user" do
      it "returns the post, if it is the users post" 


      it "works with guid" 


      it "returns the post, if the user can see the it" 


      it "returns the post, if it is public" 


      it "RecordNotFound if the post cannot be found" 


      it "RecordNotFound if user cannot see the post" 

    end

    context "without user" do
      it "returns the post, if it is public" 


      it "works with guid" 


      it "NonPublic if the post is private" 


      it "RecordNotFound if the post cannot be found" 

    end

    context "id/guid switch" do
      let(:public) { alice.post(:status_message, text: "ohai", public: true) }

      it "assumes ids less than 16 chars are ids and not guids" 


      it "assumes ids more than (or equal to) 16 chars are actually guids" 

    end
  end

  describe "#mark_user_notifications" do
    let(:status_text) { text_mentioning(alice) }

    it "marks a corresponding notifications as read" 


    it "marks a corresponding mention notification as read" 


    it "marks a corresponding mention in comment notification as read" 


    it "does not change the update_at date/time for post notifications" 


    it "does not change the update_at date/time for mention notifications" 


    it "does nothing without a user" 

  end

  describe "#destroy" do
    it "let a user delete his message" 


    it "sends a retraction on delete" 


    it "will not let you destroy posts visible to you but that you do not own" 


    it "will not let you destroy posts that are not visible to you" 

  end

  describe "#mentionable_in_comment" do
    describe "semi-integration test" do
      let(:post_author_attributes) { {first_name: "Ro#{r_str}"} }
      let(:post_author)  { FactoryGirl.create(:person, post_author_attributes) }
      let(:current_user) { FactoryGirl.create(:user_with_aspect) }
      let(:post_service) { PostService.new(current_user) }

      shared_context "with commenters and likers" do
        # randomize ids of the created people so that the test doesn't pass just because of
        # the id sequence matched against the expected ordering
        let(:ids) { (1..4).map {|i| Person.maximum(:id) + i }.shuffle }

        before do
          # in case when post_author has't been instantiated before this context, specify id
          # in order to avoid id conflict with the people generated here
          post_author_attributes.merge!(id: ids.max + 1)
        end

        let!(:commenter1) {
          FactoryGirl.create(:person, id: ids.shift, first_name: "Ro1#{r_str}").tap {|person|
            FactoryGirl.create(:comment, author: person, post: post)
          }
        }

        let!(:commenter2) {
          FactoryGirl.create(:person, id: ids.shift, first_name: "Ro2#{r_str}").tap {|person|
            FactoryGirl.create(:comment, author: person, post: post)
          }
        }

        let!(:liker1) {
          FactoryGirl.create(:person, id: ids.shift, first_name: "Ro1#{r_str}").tap {|person|
            FactoryGirl.create(:like, author: person, target: post)
          }
        }

        let!(:liker2) {
          FactoryGirl.create(:person, id: ids.shift, first_name: "Ro2#{r_str}").tap {|person|
            FactoryGirl.create(:like, author: person, target: post)
          }
        }
      end

      shared_context "with a current user's friend" do
        let!(:current_users_friend) {
          FactoryGirl.create(:person).tap {|friend|
            current_user.contacts.create!(
              person:    friend,
              aspects:   [current_user.aspects.first],
              sharing:   true,
              receiving: true
            )
          }
        }
      end

      context "with private post" do
        let(:post) { FactoryGirl.create(:status_message, text: "ohai", author: post_author) }

        context "when the post doesn't have a visibility for the current user" do
          it "doesn't find a post and raises an exception" 

        end

        context "when the post has a visibility for the current user" do
          before do
            ShareVisibility.batch_import([current_user.id], post)
          end

          context "with commenters and likers" do
            include_context "with commenters and likers"

            it "returns mention suggestions in the correct order" 

          end

          context "with a current user's friend" do
            include_context "with a current user's friend"

            it "doesn't include a contact" 

          end

          it "doesn't include a non contact" 

        end
      end

      context "with public post" do
        let(:post) { FactoryGirl.create(:status_message, text: "ohai", public: true, author: post_author) }

        context "with commenters and likers and with a current user's friend" do
          include_context "with commenters and likers"
          include_context "with a current user's friend"

          it "returns mention suggestions in the correct order" 


          it "doesn't include people with non-matching names" 

        end

        shared_examples "current user can't mention themself" do
          before do
            current_user.profile.update(first_name: "Ro#{r_str}")
          end

          it "doesn't include current user" 

        end

        context "when current user is a post author" do
          let(:post_author) { current_user.person }

          include_examples "current user can't mention themself"
        end

        context "current user is a participant" do
          before do
            current_user.like!(post)
            current_user.comment!(post, "hello")
          end

          include_examples "current user can't mention themself"
        end

        context "current user is a stranger matching a search pattern" do
          include_examples "current user can't mention themself"
        end

        it "doesn't fail when the post author doesn't match the requested pattern" 


        it "renders a commenter with multiple comments only once" 

      end
    end

    describe "unit test" do
      let(:post_service) { PostService.new(alice) }

      before do
        expect(post_service).to receive(:find!).and_return(post)
      end

      it "calls Person.allowed_to_be_mentioned_in_a_comment_to" 


      it "calls Person.find_by_substring" 


      it "calls Person.sort_for_mention_suggestion" 


      it "calls Person.limit" 


      it "contains a constraint on a current user" 

    end
  end
end

