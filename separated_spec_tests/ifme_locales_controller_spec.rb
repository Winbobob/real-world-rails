# frozen_string_literal: true

RSpec.describe LocalesController, type: :controller do
  let(:user) { create(:user, locale: nil) }

  Rails.configuration.i18n.available_locales.each do |locale|
    describe "GET ##{locale}" do
      context 'when the user is logged in' do
        before { sign_in user }

        it 'sets a locale cookie when prompted' 

      end

      context 'when user is not logged' do
        it 'sets a locale cookie when prompted' 

      end
    end
  end
end

