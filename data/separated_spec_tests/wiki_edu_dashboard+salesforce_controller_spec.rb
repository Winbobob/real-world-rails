# frozen_string_literal: true

require 'rails_helper'

describe SalesforceController do
  let(:course) { create(:course) }
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  describe '#link' do
    context 'when user is an admin' do
      before { allow(controller).to receive(:current_user).and_return(admin) }

      it 'pushes to Salesforces and saves a valid Salesforce ID on the course' 


      it 'raises an error for an invalid Salesforce ID' 

    end

    context 'when user is not an admin' do
      before { allow(controller).to receive(:current_user).and_return(user) }

      it 'does not allow the action' 

    end
  end

  describe '#update' do
    before { allow(controller).to receive(:current_user).and_return(admin) }

    let(:course) { create(:course, flags: { salesforce_id: 'a0f1a000001Wyar' }) }

    it 'updates the Salesforce record for a course' 

  end

  describe '#create_media' do
    context 'when user is an admin' do
      before { allow(controller).to receive(:current_user).and_return(admin) }

      let(:subject) do
        put :create_media, params: {
          course_id: course.id,
          username: user.username,
          article_id:  article.id,
          before_rev_id: '0',
          after_rev_id: 123456
        }
      end

      it 'creates a media record and redirects to Salesforce' 

    end

    context 'when user it not an admin' do
      before { allow(controller).to receive(:current_user).and_return(user) }

      it 'does not allow the action' 

    end
  end
end

