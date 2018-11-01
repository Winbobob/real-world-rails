require 'rails_helper'

describe GroupsController do
  let(:user) { Fabricate(:user) }
  let(:group) { Fabricate(:group, users: [user]) }
  let(:moderator_group_id) { Group::AUTO_GROUPS[:moderators] }
  let(:admin) { Fabricate(:admin) }
  let(:moderator) { Fabricate(:moderator) }

  describe '#index' do
    let(:staff_group) do
      Fabricate(:group, name: '0000', visibility_level: Group.visibility_levels[:staff])
    end

    context 'when group directory is disabled' do
      before do
        SiteSetting.enable_group_directory = false
      end

      it 'should deny access for an anon user' 


      it 'should deny access for a normal user' 


      it 'should not deny access for an admin' 


      it 'should not deny access for a moderator' 

    end

    context 'searchable' do
      it 'should return the right response' 

    end

    context 'sortable' do
      let!(:other_group) { Fabricate(:group, name: "zzzzzz", users: [user]) }

      %w{
        desc
        asc
      }.each do |order|
        context "#{order} order" do
          it 'should return the right response' 

        end
      end

      context 'ascending order' do
        it 'should return the right response' 

      end
    end

    it 'should return the right response' 


    context 'viewing groups of another user' do
      describe 'when an invalid username is given' do
        it 'should return the right response' 

      end

      it 'should return the right response' 

    end

    context 'viewing as an admin' do
      let(:admin) { Fabricate(:admin) }

      before do
        sign_in(admin)
        group.add(admin)
        group.add_owner(admin)
      end

      it 'should return the right response' 


      context 'filterable by type' do
        def expect_type_to_return_right_groups(type, expected_group_ids)
          get "/groups.json", params: { type: type }

          expect(response.status).to eq(200)

          response_body = JSON.parse(response.body)
          group_ids = response_body["groups"].map { |g| g["id"] }

          expect(response_body["total_rows_groups"]).to eq(expected_group_ids.count)
          expect(group_ids).to contain_exactly(*expected_group_ids)
        end

        describe 'my groups' do
          it 'should return the right response' 

        end

        describe 'owner groups' do
          it 'should return the right response' 

        end

        describe 'automatic groups' do
          it 'should return the right response' 

        end

        describe 'public groups' do
          it 'should return the right response' 

        end

        describe 'close groups' do
          it 'should return the right response' 

        end
      end
    end
  end

  describe '#show' do
    it "ensures the group can be seen" 


    it "returns the right response" 


    context 'as an admin' do
      it "returns the right response" 

    end

    it 'should respond to HTML' 


    describe 'when viewing activity filters' do
      it 'should return the right response' 

    end
  end

  describe "#posts" do
    it "ensures the group can be seen" 


    it "calls `posts_for` and responds with JSON" 

  end

  describe "#members" do

    it "returns correct error code with invalid params" 


    it "ensures the group can be seen" 


    it "ensures that membership can be paginated" 

  end

  describe '#posts_feed' do
    it 'renders RSS' 

  end

  describe '#mentions_feed' do
    it 'renders RSS' 


    it 'fails when disabled' 

  end

  describe '#mentionable' do
    it "should return the right response" 

  end

  describe '#messageable' do
    it "should return the right response" 

  end

  describe '#update' do
    let(:group) do
      Fabricate(:group,
        name: 'test',
        users: [user],
        public_admission: false,
        public_exit: false
      )
    end

    context "when user is group owner" do
      before do
        group.add_owner(user)
        sign_in(user)
      end

      it "should be able update the group" 


      it 'should not be allowed to update automatic groups' 

    end

    context "when user is group admin" do
      before do
        user.update_attributes!(admin: true)
        sign_in(user)
      end

      it 'should be able to update the group' 


      it "should be able to update an automatic group" 


      it 'triggers a extensibility event' 

    end

    context "when user is not a group owner or admin" do
      it 'should not be able to update the group' 

    end
  end

  describe '#members' do
    let(:user1) do
      Fabricate(:user,
        last_seen_at: Time.zone.now,
        last_posted_at: Time.zone.now - 1.day,
        email: 'b@test.org'
      )
    end

    let(:user2) do
      Fabricate(:user,
        last_seen_at: Time.zone.now - 1 .day,
        last_posted_at: Time.zone.now,
        email: 'a@test.org'
      )
    end

    let(:user3) do
      Fabricate(:user,
        last_seen_at: nil,
        last_posted_at: nil,
        email: 'c@test.org'
      )
    end

    let(:bot) { Fabricate(:user, id: -999) }

    let(:group) { Fabricate(:group, users: [user1, user2, user3, bot]) }

    it "should allow members to be sorted by" 


    it "should not allow members to be sorted by columns that are not allowed" 


    describe 'filterable' do
      describe 'as a normal user' do
        it "should not allow members to be filterable by email" 

      end

      describe 'as an admin' do
        before do
          sign_in(Fabricate(:admin))
        end

        it "should allow members to be filterable by username" 


        it "should allow members to be filterable by email" 

      end
    end
  end

  describe "#edit" do
    let(:group) { Fabricate(:group) }

    context 'when user is not signed in' do
      it 'should be fobidden' 


      context 'public group' do
        it 'should be fobidden' 

      end
    end

    context 'when user is not an owner of the group' do
      before do
        sign_in(user)
      end

      it "refuses membership changes to unauthorized users" 

    end

    context 'when user is an admin' do
      let(:user) { Fabricate(:admin) }
      let(:group) { Fabricate(:group, users: [user], automatic: true) }

      before do
        sign_in(user)
      end

      it "cannot add members to automatic groups" 

    end
  end

  describe "membership edits" do
    let(:admin) { Fabricate(:admin) }

    before do
      sign_in(admin)
    end

    context '#add_members' do
      it "can make incremental adds" 


      it "cannot add members to automatic groups" 


      context "is able to add several members to a group" do
        let(:user1) { Fabricate(:user) }
        let(:user2) { Fabricate(:user, username: "UsEr2") }

        it "adds by username" 


        it "adds by id" 


        it "adds by email" 


        it 'fails when multiple member already exists' 

      end

      it "returns 422 if member already exists" 


      it "returns 400 if member is not found" 


      context 'public group' do
        let(:other_user) { Fabricate(:user) }

        before do
          group.update!(
            public_admission: true,
            public_exit: true
          )
        end

        context 'admin' do
          it "can make incremental adds" 

        end

        it 'should allow a user to join the group' 


        it 'should not allow an underprivilege user to add another user to a group' 

      end
    end

    context '#remove_member' do
      it "cannot remove members from automatic groups" 


      it "raises an error if user to be removed is not found" 


      context "is able to remove a member" do
        it "removes by id" 


        it "removes by username" 


        it "removes user.primary_group_id when user is removed from group" 


        it "removes by user_email" 


        context 'public group' do
          let(:other_user) { Fabricate(:user) }
          let(:group) { Fabricate(:public_group, users: [other_user]) }

          context "admin" do
            it "removes by username" 

          end

          it 'should allow a user to leave a group' 


          it 'should not allow a underprivilege user to leave a group for another user' 

        end
      end

      context '#remove_members' do
        context "is able to remove several members from a group" do
          let(:user1) { Fabricate(:user) }
          let(:user2) { Fabricate(:user, username: "UsEr2") }
          let(:group1) { Fabricate(:group, users: [user1, user2]) }

          it "removes by username" 


          it "removes by id" 


          it "removes by email" 


          it "only removes users in that group" 

        end
      end
    end
  end

  describe "#histories" do
    context 'when user is not signed in' do
      it 'should raise the right error' 

    end

    context 'when user is not a group owner' do
      before do
        sign_in(user)
      end

      it 'should be forbidden' 

    end

    describe 'when user is a group owner' do
      before do
        group.add_owner(user)
        sign_in(user)
      end

      describe 'when viewing a public group' do
        before do
          group.update_attributes!(
            public_admission: true,
            public_exit: true
          )

          GroupActionLogger.new(user, group).log_change_group_settings
        end

        it 'should allow group owner to view history' 

      end

      it 'should not be allowed to view history of an automatic group' 

    end

    context 'when user is an admin' do
      let(:admin) { Fabricate(:admin) }

      before do
        sign_in(admin)
      end

      it 'should be able to view history' 


      it 'should be able to view history of automatic groups' 


      it 'should be able to filter through the history' 

    end
  end

  describe '#request_membership' do
    let(:new_user) { Fabricate(:user) }

    it 'requires the user to log in' 


    it 'requires a reason' 


    it 'should create the right PM' 

  end

  describe '#search ' do
    let(:hidden_group) do
      Fabricate(:group,
        visibility_level: Group.visibility_levels[:owners],
        name: 'KingOfTheNorth'
      )
    end

    before do
      group.update!(
        name: 'GOT',
        full_name: 'Daenerys Targaryen'
      )

      hidden_group
    end

    context 'as an anon user' do
      it "returns the right response" 

    end

    context 'as a normal user' do
      it "returns the right response" 

    end

    context 'as a group owner' do
      before do
        hidden_group.add_owner(user)
      end

      it "returns the right response" 

    end

    context 'as an admin' do
      it "returns the right response" 

    end
  end

  describe '#new' do
    describe 'for an anon user' do
      it 'should return 404' 

    end

    describe 'for a normal user' do
      before { sign_in(user) }

      it 'should return 404' 

    end

    describe 'for an admin user' do
      before { sign_in(Fabricate(:admin)) }

      it 'should return 404' 

    end
  end

  describe '#check_name' do
    describe 'for an anon user' do
      it 'should return the right response' 

    end

    it 'should return the right response' 

  end
end

