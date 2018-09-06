# frozen_string_literal: true

require 'rails_helper'

describe AlertsListController do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }

  describe '#index' do
    let!(:alert) { create(:alert) }

    context 'for admins' do
      render_views
      before { allow(controller).to receive(:current_user).and_return(admin) }

      it 'renders the alerts list' 


      it 'renders resolve button for resolvable alerts' 

    end

    context 'for non-admins' do
      before { allow(controller).to receive(:current_user).and_return(user) }
      it 'redirects to the home page' 

    end
  end

  describe '#show' do
    let(:course) { create(:course) }
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    let(:alert) { create(:alert, type: 'NeedHelpAlert', course_id: course.id, user_id: user.id) }
    let(:articles_for_deletion_alert) do
      create(:alert, article_id: article.id,
                     course_id: course.id,
                     type: 'ArticlesForDeletionAlert')
    end

    context 'for admins' do
      render_views
      before { allow(controller).to receive(:current_user).and_return(admin) }

      it 'renders the alert' 


      it 'renders the alert with resolve button' 

    end

    context 'for non-admins' do
      before { allow(controller).to receive(:current_user).and_return(user) }
      it 'redirects to the home page' 

    end
  end
end

