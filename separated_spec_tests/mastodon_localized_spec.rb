# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  controller do
    include Localized

    def success
      head 200
    end
  end

  around do |example|
    current_locale = I18n.locale
    example.run
    I18n.locale = current_locale
  end

  before do
    routes.draw { get 'success' => 'anonymous#success' }
  end

  shared_examples 'default locale' do
    it 'sets available and preferred language' 


    it 'sets available and compatible langauge if none of available languages are preferred' 


    it 'sets default locale if none of available languages are compatible' 

  end

  context 'user with valid locale has signed in' do
    it "sets user's locale" 

  end

  context 'user with invalid locale has signed in' do
    before do
      user = Fabricate.build(:user, locale: :invalid)
      user.save!(validate: false)
      sign_in(user)
    end

    include_examples 'default locale'
  end

  context 'user has not signed in' do
    include_examples 'default locale'
  end
end

