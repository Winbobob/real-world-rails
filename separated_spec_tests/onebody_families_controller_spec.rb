require 'rails_helper'

describe Checkin::FamiliesController, type: :controller do
  let(:family) { FactoryGirl.create(:family) }
  let(:user)   { FactoryGirl.create(:person) }

  describe '#show' do
    before do
      get :show,
          params: { id: family.id, format: :js },
          session: { logged_in_id: user.id },
          xhr: true
    end

    it 'renders the show template' 


    it 'assigns attendance records' 

  end

  describe '#new' do
    before do
      get :new,
          session: { logged_in_id: user.id },
          xhr: true
    end

    it 'renders the new template' 


    it 'assigns new family and people' 

  end

  describe '#create' do
    def people_attributes(people, barcode_id = '1234567890')
      people = people.each_with_index
                     .each_with_object({}) { |(p, i), h| h[i.to_s] = p }
      {
        family: {
          barcode_id: barcode_id,
          people_attributes: people
        }
      }
    end

    context 'given 1 adult' do
      before do
        post :create,
             params: people_attributes([
               { first_name: 'Tim', last_name: 'Morgan' }
             ]),
             session: { logged_in_id: user.id }
      end

      it 'renders the create template' 


      it 'creates a family and 1 person' 

    end

    context 'given 2 adults' do
      before do
        post :create,
             params: people_attributes([
               { first_name: 'Tim', last_name: 'Morgan' },
               { first_name: 'Jennie', last_name: 'Morgan' }
             ]),
             session: { logged_in_id: user.id }
      end

      it 'renders the create template' 


      it 'creates a family and 2 people' 

    end

    context 'given 1 adult and 1 kid missing a birthday' do
      before do
        post :create,
             params: people_attributes([
               { first_name: 'Tim', last_name: 'Morgan' },
               {},
               { first_name: 'Mac', last_name: 'Morgan', birthday: '' }
             ]),
             session: { logged_in_id: user.id }
      end

      it 'renders the new template' 


      it 'does not create the family' 


      it 'does not move the child up to the 2nd adult positition' 

    end

    context 'given 2 adults and 2 kids' do
      before do
        post :create,
             params: people_attributes([
               { first_name: 'Tim',    last_name: 'Morgan' },
               { first_name: 'Jennie', last_name: 'Morgan' },
               { first_name: 'Mac',    last_name: 'Morgan', birthday: '1/1/2014' },
               { first_name: 'Kai',    last_name: 'Morgan', birthday: '1/1/2015' }
             ]),
             session: { logged_in_id: user.id }
      end

      it 'renders the create template' 


      it 'creates a family and 4 people' 

    end

    context 'given a kid without a birthday' do
      before do
        post :create,
             params: people_attributes([
               { first_name: 'Tim',    last_name: 'Morgan' },
               { first_name: 'Jennie', last_name: 'Morgan' },
               { first_name: 'Mac',    last_name: 'Morgan', birthday: '' },
               { first_name: 'Kai',    last_name: 'Morgan', birthday: '1/1/2015' }
             ]),
             session: { logged_in_id: user.id }
      end

      it 'renders the new template' 


      it 'does not create a family' 

    end

    context 'given no people' do
      before do
        post :create,
             params: people_attributes([]),
             session: { logged_in_id: user.id }
      end

      it 'renders the new template' 


      it 'does not create a family' 

    end

    context 'given no parents' do
      before do
        post :create,
             params: people_attributes([
               {},
               {},
               { first_name: 'Mac', last_name: 'Morgan', birthday: '1/1/2014' }
             ]),
             session: { logged_in_id: user.id }
      end

      it 'renders the new template' 


      it 'does not create a family' 

    end

    context 'given no barcode' do
      before do
        post :create,
             params: people_attributes([
               { first_name: 'Tim', last_name: 'Morgan' }
             ], ''),
             session: { logged_in_id: user.id }
      end

      it 'renders the new template' 


      it 'does not create a family' 

    end
  end

  describe '#update' do
    before do
      patch :update,
            params: {
              id: family.id,
              family: {
                barcode_id: '1234567890',
                alternate_barcode_id: '5678901234'
              },
              format: :js
            },
            session: {
              logged_in_id: user.id
            },
            xhr: true
    end

    it 'renders the update template' 


    it 'updates the barcode' 

  end
end

