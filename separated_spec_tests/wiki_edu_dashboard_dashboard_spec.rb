# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard', type: :feature, js: true do
  let(:user) do
    create(:user,
           onboarded: true, real_name: 'test',
           email: 'email@email.com', permissions: permissions)
  end

  context 'with no courses' do
    describe 'for students' do
      let(:permissions) { User::Permissions::NONE }

      before :each do
        login_as(user, scope: :user)
      end

      it 'describes joining a course' 

    end

    describe 'for instructors' do
      let(:permissions) { User::Permissions::INSTRUCTOR }

      before :each do
        login_as(user, scope: :user)
      end

      it 'links to orientation' 


      it 'allows creating a course if they\'ve completed orientation' 

    end
  end

  context 'populated with courses' do
    context 'for returning instructors' do
      let(:permissions) { User::Permissions::INSTRUCTOR }

      before :each do
        login_as(user, scope: :user)
      end

      it 'allows creation of second course even if orientation is not complete' 

    end
  end

  context 'archived courses' do
    let(:permissions) { User::Permissions::INSTRUCTOR }

    before :each do
      login_as(user, scope: :user)
    end

    it 'does not initially show archived' 


    it 'show archived courses when there are past courses for the user' 


    it 'shows both archived and non-archived' 

  end

  context 'campaigns' do
    let(:permissions) { User::Permissions::NONE }

    before do
      create(:campaign) # arbitrary campaign
      login_as(user, scope: :user)
    end

    it "should not show a campaigns section if the user isn't organizing any campaigns" 


    it 'should list campaigns the user organizes' 

  end
end

