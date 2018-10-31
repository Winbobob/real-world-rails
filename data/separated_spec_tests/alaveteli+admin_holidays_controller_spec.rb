# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AdminHolidaysController do

  describe 'GET index' do

    before do
      @holiday_one = FactoryBot.create(:holiday, :day => Date.new(2010, 1, 1))
      @holiday_two = FactoryBot.create(:holiday, :day => Date.new(2011, 2, 2))
      @holiday_three = FactoryBot.create(:holiday, :day => Date.new(2011, 3, 3))
    end

    it 'gets a hash of holidays keyed by year' 


    it 'gets a list of years with holidays' 


    it 'renders the index template' 


  end

  describe 'GET new' do


    describe 'when not using ajax' do

      it 'renders the new template' 


    end

    describe 'when using ajax' do

      it 'renders the new form partial' 

    end

    it 'creates a new holiday' 


  end

  describe 'POST create' do

    before do
      @holiday_params = { :description => "New Year's Day",
                          'day(1i)' => '2010',
                          'day(2i)' => '1',
                          'day(3i)' => '1' }
      post :create, :holiday => @holiday_params
    end

    it 'creates a new holiday' 


    it 'shows the admin a success message' 


    it 'redirects to the index' 


    context 'when there are errors' do

      before do
        allow_any_instance_of(Holiday).to receive(:save).and_return(false)
        post :create, :holiday => @holiday_params
      end

      it 'renders the new template' 

    end

  end

  describe 'GET edit' do

    before do
      @holiday = FactoryBot.create(:holiday)
    end

    describe 'when not using ajax' do

      it 'renders the edit template' 


    end

    describe 'when using ajax' do

      it 'renders the edit form partial' 


    end

    it 'gets the holiday in the id param' 


  end

  describe 'PUT update' do

    before do
      @holiday = FactoryBot.create(:holiday, :day => Date.new(2010, 1, 1),
                                   :description => "Test Holiday")
      put :update, :id => @holiday.id, :holiday => { :description => 'New Test Holiday' }
    end

    it 'gets the holiday in the id param' 


    it 'updates the holiday' 


    it 'shows the admin a success message' 


    it 'redirects to the index' 


    context 'when there are errors' do

      before do
        allow_any_instance_of(Holiday).to receive(:update_attributes).and_return(false)
        put :update, :id => @holiday.id, :holiday => { :description => 'New Test Holiday' }
      end

      it 'renders the edit template' 

    end

  end

  describe 'DELETE destroy' do

    before(:each) do
      @holiday = FactoryBot.create(:holiday)
      delete :destroy, :id => @holiday.id
    end

    it 'finds the holiday to destroy' 


    it 'destroys the holiday' 


    it 'tells the admin the holiday has been destroyed' 


    it 'redirects to the index action' 

  end

end

