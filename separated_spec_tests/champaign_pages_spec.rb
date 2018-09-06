# frozen_string_literal: true

require 'rails_helper'

describe 'pages' do
  describe 'GET show' do
    let!(:page) { create(:page, title: 'I am a page', content: 'super awesome text content yo!') }

    it 'is case insensitive to campaign pages slugs' 


    it 'redirects pages that really are not found' 


    describe 'Mega tags' do
      it 'includes the default description meta tags' 


      it 'includes the custom description meta tag if overriden' 

    end
  end

  describe 'POST create' do
    let(:english)     { create :language }
    let(:page_params) { { title: 'Away we go!', language_id: english.id } }
    before do
      login_as(create(:user), scope: :user)
    end

    it 'has the right follow-up url if liquid layout has a default follow-up url' 


    it 'has a blank follow-up url if liquid layout has no default follow-up url' 

  end
end

