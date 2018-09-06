# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'System: Administration: Announcements', type: :feature do
  let(:instance) { Instance.default }

  with_tenant(:instance) do
    describe 'Pagination' do
      subject { page }

      let(:user) { create(:administrator) }

      before do
        System::Announcement.delete_all
        create_list(:system_announcement, 50)

        login_as(user, scope: :user)
        visit admin_announcements_path
      end

      it { is_expected.to have_selector('nav.pagination') }

      it 'lists each announcement' 


      context 'after clicked second page' do
        before { visit admin_announcements_path(page: '2') }

        it 'lists each announcement' 

      end
    end
  end
end
