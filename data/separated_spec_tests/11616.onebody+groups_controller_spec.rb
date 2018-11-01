require 'rails_helper'

describe GroupsController, type: :controller do
  render_views

  before do
    @person, @other_person = FactoryGirl.create_list(:person, 2)
    @group = FactoryGirl.create(:group, name: 'Morgan Group', creator: @person, category: 'Small Groups')
    @group.memberships.create(person: @person, admin: true)
  end

  describe '#index' do
    context 'for a person' do
      before do
        get :index,
            params: { person_id: @person.id },
            session: { logged_in_id: @person.id }
      end

      it 'assigns the person' 


      it 'renders the index_for_person template' 

    end

    context 'for a person with a hidden group' do
      before do
        @hidden_group = FactoryGirl.create(:group, hidden: true)
        @hidden_group.memberships.create!(person: @person)
      end

      context 'user is not an admin' do
        before do
          get :index,
              params: { person_id: @person.id },
              session: { logged_in_id: @person.id }
        end

        it 'does not list the hidden group' 

      end

      context 'user is admin with manage_groups privilege' do
        before do
          @person.admin = Admin.create(manage_groups: true)
          @person.save!
          get :index,
              params: { person_id: @person.id },
              session: { logged_in_id: @person.id }
        end

        it 'lists the hidden group' 

      end
    end

    context 'for a category' do
      before do
        get :index,
            params: { category: 'Small Groups' },
            session: { logged_in_id: @person.id }
      end

      it 'assigns groups matching the category' 


      it 'renders the search template' 

    end

    context 'for a group name' do
      before do
        get :index,
            params: { name: 'Morgan' },
            session: { logged_in_id: @person.id }
      end

      it 'assigns groups matching the name' 


      it 'renders the search template' 

    end

    context 'overview page' do
      before do
        get :index,
            session: { logged_in_id: @person.id }
      end

      it 'assigns categories' 


      it 'renders the index template' 

    end

    context 'overview page with an unapproved group' do
      before do
        @unapproved_group = FactoryGirl.create(:group, approved: false, creator: @person)
      end

      context 'user is group creator' do
        before do
          get :index,
              session: { logged_in_id: @person.id }
        end

        it 'assigns the unapproved group' 

      end

      context 'user is not group creator' do
        before do
          get :index,
              session: { logged_in_id: @other_person.id }
        end

        it 'does not assign the unapproved group' 

      end

      context 'user is admin with manage_groups privilege' do
        before do
          @person.admin = Admin.create(manage_groups: true)
          @person.save!
          get :index,
              session: { logged_in_id: @person.id }
        end

        it 'assigns the unapproved group' 

      end
    end
  end

  describe '#show' do
    context 'group is not private' do
      before do
        get :show,
            params: { id: @group.id },
            session: { logged_in_id: @person.id }
      end

      it 'renders the show template' 

    end

    context 'group is private' do
      before do
        @group.update_attribute(:private, true)
      end

      context 'user is a member' do
        before do
          get :show,
              params: { id: @group.id },
              session: { logged_in_id: @person.id }
        end

        it 'renders the show template' 

      end

      context 'user is not a member' do
        before do
          get :show,
              params: { id: @group.id },
              session: { logged_in_id: @other_person.id }
        end

        it 'renders the show template' 

      end
    end

    context 'group is hidden' do
      before do
        @group.update_attribute(:hidden, true)
      end

      context 'user is a member' do
        before do
          get :show,
              params: { id: @group.id },
              session: { logged_in_id: @person.id }
        end

        it 'renders the show template' 

      end

      context 'user is not a member' do
        before do
          get :show,
              params: { id: @group.id },
              session: { logged_in_id: @other_person.id }
        end

        it 'renders the show template (this may change in the future)' 

      end

      context 'user is an admin who can manage groups' do
        before do
          @person.admin = Admin.create(manage_groups: true)
          @person.save!
          get :show,
              params: { id: @group.id },
              session: { logged_in_id: @person.id }
        end

        it 'renders the show template' 

      end
    end
  end

  context '#update' do
    context 'given a photo file' do
      before do
        post :update,
             params: {
               id: @group.id,
               group: {
                 photo: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/image.jpg'), 'image/jpeg', true)
               }
             },
             session: { logged_in_id: @person.id }
      end

      it 'saves the photo' 


      it 'redirects to the group page' 

    end

    context 'given photo="remove"' do
      before do
        @group.photo = File.open(Rails.root.join('spec/fixtures/files/image.jpg'))
        @group.save!
        post :update,
             params: { id: @group.id, group: { photo: 'remove' } },
             session: { logged_in_id: @person.id }
      end

      it 'removes the photo' 


      it 'redirects to the group page' 

    end
  end

  describe '#edit' do
    context 'user is group admin' do
      before do
        get :edit,
            params: { id: @group.id },
            session: { logged_in_id: @person.id }
      end

      it 'renders the edit template' 

    end

    context 'user is admin with manage_groups privilege' do
      before do
        @other_person.admin = Admin.create!(manage_groups: true)
        @other_person.save!
        get :edit,
            params: { id: @group.id },
            session: { logged_in_id: @other_person.id }
      end

      it 'renders the edit template' 

    end

    context 'user is not group admin' do
      before do
        get :edit,
            params: { id: @group.id },
            session: { logged_in_id: @other_person.id }
      end

      it 'returns unauthorized' 

    end
  end

  describe '#update' do
    context 'user is group admin' do
      before do
        put :update,
            params: {
              id: @group.id,
              group: {
                name: 'test name',
                category: 'test cat'
              }
            },
            session: { logged_in_id: @person.id }
      end

      it 'updates the group' 


      it 'redirect to the group page' 

    end

    context 'user is not group admin' do
      before do
        put :update,
            params: {
              id: @group.id,
              group: {
                name: 'test name',
                category: 'test cat'
              }
            },
            session: { logged_in_id: @other_person.id }
      end

      it 'returns unauthorized' 

    end
  end

  describe '#batch' do
    before do
      @admin = FactoryGirl.create(:person, :admin_manage_groups)
      @group2 = FactoryGirl.create(:group)
    end

    context 'GET' do
      before do
        get :batch,
            session: { logged_in_id: @admin.id }
      end

      it 'renders the batch template' 

    end

    context 'POST' do
      context 'given valid data' do
        before do
          post :batch,
               params: {
                 groups: {
                   @group.id.to_s => {
                     name: 'foobar',
                     members_send: '0'
                   },
                   @group2.id.to_s => {
                     address: 'baz'
                   }
                 }
               },
               session: { logged_in_id: @admin.id }
        end

        it 'renders the batch template again' 


        it 'updates the groups' 

      end

      context 'given invalid data' do
        before do
          post :batch,
               params: {
                 groups: {
                   @group.id.to_s => {
                     address: 'bad*address'
                   }
                 }
               },
               session: { logged_in_id: @admin.id }
        end

        it 'shows errors' 

      end
    end

    context 'POST via ajax' do
      context 'given valid data' do
        before do
          post :batch,
               params: {
                 format: 'js',
                 groups: {
                   @group.id.to_s => {
                     name: 'lorem',
                     members_send: 'true'
                   },
                   @group2.id.to_s => {
                     address: 'ipsum'
                   }
                 }
               },
               session: { logged_in_id: @admin.id }
        end

        it 'updates the groups' 

      end

      context 'given invalid data' do
        before do
          post :batch,
               params: {
                 format: 'js',
                 groups: {
                   @group.id.to_s => {
                     address: 'bad*address'
                   }
                 }
               },
               session: { logged_in_id: @admin.id }
        end

        it 'shows errors' 

      end
    end
  end

  describe '#new' do
    before do
      get :new,
          session: { logged_in_id: @person.id }
    end

    it 'renders the new group form' 

  end

  context '#create' do
    context 'user is not an admin' do
      before do
        post :create,
             params: { group: { name: 'test name', category: 'test cat' } },
             session: { logged_in_id: @person.id }
        @group = Group.last
      end

      it 'creates the group' 


      it 'does not mark the group as approved' 


      it 'adds the creator as a group member' 


      it "redirects to the group's URL" 

    end

    context 'user is an admin' do
      before do
        @person.admin = Admin.create(manage_groups: true)
        @person.save!
        post :create,
             params: { group: { name: 'test name', category: 'test cat' } },
             session: { logged_in_id: @person.id }
        @group = Group.last
      end

      it 'creates the group' 


      it 'marks the group as approved' 


      it 'does not add the creator as a group member' 


      it "redirects to the group's URL" 

    end
  end
end

