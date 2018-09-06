require 'rails_helper'

describe 'Privacy', type: :request do
  before do
    @user = FactoryGirl.create(:person)
    @head = FactoryGirl.create(:person)
    @spouse = FactoryGirl.create(:person, family: @head.family, first_name: 'Jane')
  end

  context 'given a child without parental consent' do
    before do
      @child = FactoryGirl.create(:person, family: @head.family, first_name: 'Megan', child: true)
    end

    context 'when viewed by a stranger' do
      before do
        sign_in_as @user
      end

      it 'should not show child on family page' 


      it 'should not show profile page of child' 


      it 'should not show child in search results' 

    end

    context 'when viewed by adult in same family' do
      before do
        sign_in_as @head
      end

      it 'should show child on parent profile' 


      it 'should show profile page of child' 


      it 'should not show child in search results' 

    end

    it 'should not allow child to sign in' 


    it 'should give child parental consent from parent' 

  end

  context 'given child with parental consent' do
    before do
      @child = FactoryGirl.create(:person, family: @head.family, first_name: 'Megan', child: true, parental_consent: 'consent')
    end

    it 'should allow child to sign in' 

  end
end

