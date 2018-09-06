require 'rails_helper'

describe Administration::UpdatesController, type: :controller do
  render_views

  before do
    @person = FactoryGirl.create(:person)
    @admin = FactoryGirl.create(:person, :admin_manage_updates)
  end

  context '#index' do
    context 'unauthorized user' do
      it 'should return unauthorized' 

    end

    context 'admin user' do
      before do
        @update = @person.updates.create!(
          data: {
            person: {
              birthday: Date.new(2000, 1, 1)
            }
          }
        )
        @update_complete = @person.updates.create!(complete: true)
        get :index,
            session: { logged_in_id: @admin.id }
      end

      it 'should render the index template' 


      it 'should show pending updates' 


      it 'should show dates formatted' 

    end
  end

  context '#update' do
    before do
      @update = @person.updates.create!(
        data: {
          person: {
            first_name: 'Tim',
            last_name: 'Morgan'
          },
          family: {
            name: 'Tim Morgan'
          }
        },
        complete: false
      )
    end

    it 'should mark the update complete' 


    it 'should mark the update incomplete' 


    it 'should apply the update' 

  end

  context '#destroy' do
    before do
      @update = @person.updates.create!
    end

    it 'should destroy the update' 

  end
end

