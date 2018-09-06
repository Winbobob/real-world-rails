require 'rails_helper'

describe AlbumsController, type: :controller do
  before do
    @user = FactoryGirl.create(:person)
  end

  context '#index' do
    context 'shallow route' do
      context 'given a public album' do
        before do
          @public_album = FactoryGirl.create(:album, is_public: true)
          get :index,
              session: { logged_in_id: @user.id }
        end

        it 'should list public albums' 

      end

      context 'given an album owned by a friend' do
        before do
          @friend = FactoryGirl.create(:person)
          Friendship.create!(person: @user, friend: @friend)
          @friend_album = FactoryGirl.create(:album, owner: @friend)
          get :index,
              session: { logged_in_id: @user.id }
        end

        it 'should list albums for friends' 

      end

      context 'given an album owned by a stranger' do
        before do
          @stranger_album = FactoryGirl.create(:album)
          get :index,
              session: { logged_in_id: @user.id }
        end

        it 'should not list albums for strangers' 

      end
    end

    context 'nested route on person' do
      context 'user is visible' do
        before do
          @album = FactoryGirl.create(:album, owner: @user)
          get :index,
              params: { person_id: @user.id },
              session: { logged_in_id: @user.id }
        end

        it 'should list all albums by person' 

      end

      context 'user is invisible' do
        before do
          @stranger = FactoryGirl.create(:person, visible: false)
          @album = FactoryGirl.create(:album, owner: @stranger)
          get :index,
              params: { person_id: @stranger.id },
              session: { logged_in_id: @user.id }
        end

        it 'should return forbidden' 

      end
    end

    context 'nested route on group' do
      before do
        @group = FactoryGirl.create(:group)
        @group.memberships.create!(person: @user)
        @album = FactoryGirl.create(:album, owner: @group)
        get :index,
            params: { group_id: @group.id },
            session: { logged_in_id: @user.id }
      end

      it 'should list all albums by group' 

    end
  end

  context '#show' do
    context 'album owned by user' do
      before do
        @album = FactoryGirl.create(:album, owner: @user)
        get :show,
            params: { id: @album.id },
            session: { logged_in_id: @user.id }
      end

      it 'renders the show template' 

    end
  end

  context '#create' do
    it 'should create an album' 


    context 'add album to a group' do
      before do
        @group = FactoryGirl.create(:group)
      end

      context 'user is a member of the group' do
        before do
          @group.memberships.create!(person: @user)
          post :create,
               params: { group_id: @group.id, album: { name: 'test name' } },
               session: { logged_in_id: @user.id }
        end

        it 'should create an album' 


        it 'sets the group as the album owner' 

      end

      context 'user is not a member of the group' do
        before do
          post :create,
               params: { group_id: @group.id, album: { name: 'test name' } },
               session: { logged_in_id: @user.id }
        end

        it 'should return forbidden' 

      end

      context 'pictures are not enabled on the group' do
        before do
          @group.memberships.create!(person: @user)
          @group.update_attributes!(pictures: false)
          post :create,
               params: { group_id: @group.id, album: { name: 'test name' } },
               session: { logged_in_id: @user.id }
        end

        it 'should return forbidden' 

      end

      context 'group does not have pictures enabled' do
        before do
          @group.update_attributes!(pictures: false)
          post :create,
               params: { group_id: @group.id, album: { name: 'test name' } },
               session: { logged_in_id: @user.id }
        end

        it 'should return forbidden' 

      end
    end
  end

  context '#update' do
    context 'album is owned by user' do
      before do
        @album = FactoryGirl.create(:album, owner: @user)
      end

      it 'should edit the album' 

    end

    context 'user does not own album' do
      before do
        @album = FactoryGirl.create(:album)
      end

      it 'should return forbidden' 


      context 'user is admin' do
        before do
          @user.update_attributes(admin: Admin.create!(manage_pictures: true))
        end

        it 'should edit the album' 

      end
    end
  end

  context '#destroy' do
    context 'album is owned by user' do
      before do
        @album = FactoryGirl.create(:album, owner: @user)
        post :destroy,
             params: { id: @album.id },
             session: { logged_in_id: @user.id }
      end

      it 'should delete the album' 


      it 'should redirect to the person album index' 

    end

    context 'user does not own album' do
      before do
        @album = FactoryGirl.create(:album)
        post :destroy,
             params: { id: @album.id },
             session: { logged_in_id: @user.id }
      end

      it 'should return forbidden' 


      context 'user is admin' do
        before do
          @user.update_attributes(admin: Admin.create!(manage_pictures: true))
          post :destroy,
               params: { id: @album.id },
               session: { logged_in_id: @user.id }
        end

        it 'should delete the album' 

      end
    end
  end
end

