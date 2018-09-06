require 'rails_helper'

describe Api::V1::VisitorDetailsController, type: :request do
  let(:default_app) { FactoryBot.create(:app, name: 'default_app', auth_secret: '6Sd6T7T6Q8hKcoo0t8CTzV0IdN1EEHqXB2Ig4raZsOf') }
  let(:split) { FactoryBot.create(:split, name: 'excellent_feature', registry: { enabled: 50, disabled: 50 }, location: 'Home page') }

  let!(:variant_detail) do
    FactoryBot.create(
      :variant_detail,
      split: split,
      variant: 'enabled',
      display_name: 'Awesome feature is on',
      description: 'This awesome feature makes cool stuff happen.'
    )
  end

  let(:identifier_type) { FactoryBot.create(:identifier_type, name: 'crazy_id') }
  let(:visitor) { FactoryBot.create(:visitor) }
  let!(:identifier) { FactoryBot.create(:identifier, visitor: visitor, identifier_type: identifier_type, value: '3') }

  let!(:assignment) do
    FactoryBot.create(
      :assignment,
      visitor: visitor,
      split: split,
      variant: 'enabled',
      created_at: Time.zone.parse('2017-04-05 14:00:00')
    )
  end

  before do
    http_authenticate username: default_app.name, password: default_app.auth_secret
  end

  describe 'GET /api/v1/identifier_types/:type/identifier/:id/visitor_details' do
    it 'renders a list of assignment details for the user' 

  end
end

