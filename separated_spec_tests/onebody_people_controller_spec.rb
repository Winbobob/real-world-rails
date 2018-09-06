require 'rails_helper'

describe PeopleController, type: :controller do
  render_views

  before do
    @person, @other_person = FactoryGirl.create_list(:person, 2)
    @limited_person = FactoryGirl.create(:person, status: :pending)
  end

  it 'should redirect the index action to the currently logged in person' 


  it 'should show a person' 


  it 'should show a limited view of a person' 


  it 'should not show a person if they are invisible to the logged in user' 


  it 'should create a person update' 


  it 'should edit testimony and other non-basic person information' 


  it 'should edit a person basics when user is admin' 


  it 'should delete a person' 


  it 'should not delete self' 


  it 'should not delete a person unless admin' 


  it 'should not show xml unless user can export data' 


  it 'should show xml for admin who can export data' 


  it 'should not allow deletion of a super admin' 


  it 'should not error when viewing a person not in a family' 


  describe '#show' do
    context '?business=true' do
      context 'person has a business' do
        before do
          @person.business_name = 'Tim Morgan Enterprises'
          @person.save!
          get :show,
              params: { id: @person.id, business: true },
              session: { logged_in_id: @person.id }
        end

        it 'shows the business template' 

      end

      context 'person does not have a business' do
        before do
          get :show,
              params: { id: @person.id, business: true },
              session: { logged_in_id: @person.id }
        end

        it 'renders the profile' 

      end
    end
  end

  describe '#new' do
    let(:admin) { FactoryGirl.create(:person, :admin_edit_profiles) }

    context 'given a family id' do
      let(:family) { @person.family }

      before do
        get :new,
            params: { family_id: family.id },
            session: { logged_in_id: admin.id }
      end

      it 'renders the new template' 

    end

    context 'given no family' do
      before do
        get :new,
            session: { logged_in_id: admin.id }
      end

      it 'renders the new template' 

    end
  end

  describe '#create' do
    let!(:admin) { FactoryGirl.create(:person, :admin_edit_profiles) }

    context 'with existing family' do
      let(:family) { @person.family }

      before do
        post :create,
             params: {
               person: {
                 first_name: 'Todd',
                 last_name: 'Jones',
                 family_id: family.id,
                 child: '0'
               }
             },
             session: { logged_in_id: admin.id }
      end

      it 'creates the new person in the existing family and redirects' 

    end

    context 'with no family' do
      def do_post
        post :create,
             params: {
               person: {
                 first_name: 'Todd',
                 last_name: 'Jones',
                 family_id: '',
                 child: '0'
               },
               family: {
                 home_phone: '123-456-7890'
               }
             },
             session: { logged_in_id: admin.id }
      end

      it 'creates the new person in a new family and redirects' 

    end

    context 'with no family, invalid family attributes' do
      def do_post
        post :create,
             params: {
               person: {
                 first_name: '',
                 last_name: ''
               }
             },
             session: { logged_in_id: admin.id }
      end

      render_views

      it 'renders the new template again with errors' 

    end
  end

  describe '#update' do
    context 'given a id and a family_id and the param move_person' do
      before do
        @admin = FactoryGirl.create(:person, :admin_edit_profiles)
        @old_family = @person.family
        @other_family = FactoryGirl.create(:family)
        post :update,
             params: {
               id: @person.id,
               family_id: @other_family.id,
               move_person: true
             },
             session: { logged_in_id: @admin.id }
      end

      it 'moves the person to the family' 


      it 'redirects to the new family' 


      it 'sets a flash message' 

    end
  end
end

