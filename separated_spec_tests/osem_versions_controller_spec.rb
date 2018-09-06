# frozen_string_literal: true

require 'spec_helper'

describe Admin::VersionsController do

  let!(:conference) { create(:conference, short_title: 'exampletitle', description: 'Example Description') }
  let(:admin) { create(:admin) }
  let(:role_organizer) { conference.roles.find_by(name: 'organizer') }
  let(:role_cfp) { conference.roles.find_by(name: 'cfp') }
  let(:role_info_desk) { conference.roles.find_by(name: 'info_desk') }

  with_versioning do
    describe 'GET #revert' do
      before :each do
        sign_in admin
      end

      it 'reverts all changes for update actions' 


      it 'shows correct flash on trying to revert create event of a deleted object' 


      it 'reverting deletion of object  creates it again' 


      it 'reverting creation of object deletes it ' 


      it 'reverting creation of conference is not permitted' 

    end

    describe 'GET #revert_attribute' do
      before :each do
        sign_in admin
      end

      it 'reverts specified change for update actions' 


      it 'shows correct flash on trying to revert to the current state' 


      it 'fails on trying to revert deleted object' 


      it 'fails on trying to revert creation event' 


      it 'revert fails when attribute is invalid' 

    end

    describe 'GET #index' do
      it 'raises error if user is not of any role' 


      context 'with conference' do
        before :each do
          @user = create(:user)

          conference.update_attributes(short_title: 'testtitle', description: 'Some random text')
          @version_organizer = PaperTrail::Version.last
          create(:cfp, program: conference.program)
          @version_cfp = PaperTrail::Version.last
          registration = create(:registration, conference: conference)
          registration.update_attributes(attended: true)
          @version_info_desk = PaperTrail::Version.last
        end

        it 'when user has role cfp' 


        it 'when user has role info_desk' 


        it 'when user has role organizer' 

      end
    end
  end
end

