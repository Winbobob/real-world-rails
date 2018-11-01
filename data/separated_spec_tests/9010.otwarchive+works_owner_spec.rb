require 'spec_helper'

describe WorksOwner do

  before do
    @tag = Tag.new
    @tag.id = 666
    @time = "2013-09-27 19:14:18 -0400".to_datetime
    @time_string = @time.to_i.to_s
    Delorean.time_travel_to @time
    @tag.update_works_index_timestamp!
    Delorean.back_to_the_present
  end

  describe "works_index_timestamp" do
    it "should retrieve the owner's timestamp" 

  end

  describe "works_index_cache_key" do
    it "should return the full cache key" 


    it "should accept a tag argument and return the tag's timestamp" 

  end

  describe "update_works_index_timestamp!" do
    it "should update the timestamp for the owner" 

  end

  describe "index_cache_key" do

    shared_examples_for "an owner" do
      it "should change after a work is updated" 


      it "should change after a work is deleted" 

    end

    shared_examples_for "an owner tag" do
      it "should change after a new work is created" 

    end

    shared_examples_for "an owner collection" do
      it "should change after a new work is created" 

    end

    shared_examples_for "an owner user" do
      it "should change after a new work is created" 


      it "should change after a work is orphaned" 

    end

    describe "for a canonical tag" do
      before do
        Delorean.time_travel_to "10 minutes ago"
        @owner = FactoryGirl.create(:fandom, canonical: true)
        @work = FactoryGirl.create(:work, fandom_string: @owner.name, posted: true)
        @original_cache_key = @owner.works_index_cache_key
        Delorean.back_to_the_present
      end
      it_should_behave_like "an owner"
      it_should_behave_like "an owner tag"

      describe "with a synonym" do
        before do
          Delorean.time_travel_to "10 minutes ago"
          @syn_tag = FactoryGirl.create(:fandom, canonical: false)
          @syn_tag.syn_string = @owner.name
          @syn_tag.save
          @work2 = @work
          @work = FactoryGirl.create(:work, fandom_string: @syn_tag.name, posted: true)
          @original_cache_key = @owner.works_index_cache_key
          Delorean.back_to_the_present
        end
        it_should_behave_like "an owner"
        it_should_behave_like "an owner tag"

        it "should change after a new work is created in the synonym" 


      end
    end

    describe "for a collection" do
      before do
        Delorean.time_travel_to "10 minutes ago"
        @owner = FactoryGirl.create(:collection)
        @work = FactoryGirl.create(:work, collection_names: @owner.name, posted: true)

        # we have to approve the collection items before we get a change in
        # the cache key, since it uses approved works
        @owner.collection_items.each {|ci| ci.approve(nil); ci.save}

        @original_cache_key = @owner.works_index_cache_key
        Delorean.back_to_the_present
      end
      it_should_behave_like "an owner"
      it_should_behave_like "an owner collection"

      describe "with a child" do
        before do
          Delorean.time_travel_to "10 minutes ago"
          @owner = FactoryGirl.create(:collection)
          # Stub out User.current_user to get past the collection needing to be owned by same person as parent
          allow(User).to receive(:current_user).and_return(@owner.owners.first.user)
          @child = FactoryGirl.create(:collection, parent_name: @owner.name)
          # reload the parent collection
          @owner.reload
          @work1 = @work
          @work = FactoryGirl.create(:work, collection_names: @child.name, posted: true)
          @child.collection_items.each {|ci| ci.approve(nil); ci.save}
          @original_cache_key = @owner.works_index_cache_key
          Delorean.back_to_the_present
        end
        it_should_behave_like "an owner"
        it_should_behave_like "an owner collection"
      end

      describe "with a subtag" do
        before do
          @fandom = FactoryGirl.create(:fandom)
          @work.fandom_string = @fandom.name
          @work.save
          @original_cache_key = @owner.works_index_cache_key(@fandom)
          @original_cache_key_without_subtag = @owner.works_index_cache_key
        end

        it "should have a different key than without the subtag" 


        describe "when a new work is added with that tag" do
          before do
            Delorean.time_travel_to "1 second from now"
            @work2 = FactoryGirl.create(:work, fandom_string: @fandom.name, collection_names: @owner.name, posted: true)
            @owner.collection_items.each {|ci| ci.approve(nil); ci.save}
            Delorean.back_to_the_present
          end

          it "should update both the cache keys" 

        end

        describe "when a new work is added without that tag" do
          before do
            @fandom2 = FactoryGirl.create(:fandom)
            Delorean.time_travel_to "1 second from now"
            @work2 = FactoryGirl.create(:work, fandom_string: @fandom2.name, collection_names: @owner.name, posted: true)
            @owner.collection_items.each { |ci| ci.approve(nil); ci.save }
            Delorean.back_to_the_present
          end

          it "should update the main cache key without the tag" 


          it "should not update the cache key with the tag" 

        end

      end

    end

    describe "for a user" do
      before do
        @owner = FactoryGirl.create(:user)
        @work = FactoryGirl.create(:work, authors: [@owner.default_pseud], posted: true)
      end
      it_should_behave_like "an owner"
      it_should_behave_like "an owner user"
    end

    describe "for a pseud" do
      before do
        user = FactoryGirl.create(:user)
        @owner = FactoryGirl.create(:pseud, user: user)
        @work = FactoryGirl.create(:work, authors: [@owner], posted: true)
      end
      it_should_behave_like "an owner"
      it_should_behave_like "an owner user"
    end

  end
end

