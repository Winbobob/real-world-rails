require 'rails_helper'

RSpec.describe 'offices/edit', type: :view do
  let(:manager)       { create(:manager) }
  let(:admin)         { create(:admin_user) }
  let!(:office)        { assign(:office, create(:office)) }
  let!(:jurisdictions) { assign(:jurisdictions, office.jurisdictions) }

  before { assign(:becs, office.business_entities) }

  shared_examples 'an elevated user' do
    it 'renders form and jurisdiction list' 

  end

  context 'as a manager' do
    before do
      sign_in manager
      render
    end

    it_behaves_like 'an elevated user'

    it 'does not render a link to the list' 

  end

  context 'as an admin' do
    before do
      sign_in admin
      render
    end

    it_behaves_like 'an elevated user'

    it 'renders a link to the list' 

  end
end

