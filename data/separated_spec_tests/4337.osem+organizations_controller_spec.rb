# frozen_string_literal: true

require 'spec_helper'

describe OrganizationsController do
  let!(:organization) { create(:organization) }
  let!(:conference) do
    create(
      :conference,
      splashpage:   create(:splashpage, public: true),
      venue:        create(:venue),
      organization: organization
    )
  end
  let!(:antiquated_conference) do
    create(
      :conference,
      splashpage:   create(:splashpage, public: true),
      venue:        create(:venue),
      organization: organization,
      start_date:   2.weeks.ago,
      end_date:     1.week.ago
    )
  end

  let!(:other_conference) { create(:conference) }
  let!(:user) { create(:user) }

  describe 'GET #index' do
    before :each do
      sign_in user
      get :index
    end

    it { expect(response).to render_template('index') }
  end

  describe 'GET #conferences' do
    before :each do
      get :conferences, id: organization.id
    end

    it 'loads the organization' 


    it 'includes organization conferences' 


    it 'does not include conferences outside organization' 


    it 'includes antiquated organization conferences' 

  end
end

