require 'rails_helper'

RSpec.describe Api::V1::SplitDetailsController, type: :request do
  describe 'GET /api/v1/split_details/:id' do
    let(:default_app) { FactoryBot.create :app, name: "default_app", auth_secret: "6Sd6T7T6Q8hKcoo0t8CTzV0IdN1EEHqXB2Ig4raZsOf" }

    before do
      http_authenticate username: default_app.name, password: default_app.auth_secret
    end

    context 'with no split details' do
      let(:split_with_no_details) { FactoryBot.create :split, registry: { hammer: 99, nail: 1 }, name: "fantastic_split" }

      it "responds with empty details" 

    end

    context 'with split details' do
      let(:split_with_details) { FactoryBot.create :split, registry: { enabled: 99, disabled: 1 }, name: "fantastic_split_with_information", platform: 'mobile', description: 'Greatest Split', assignment_criteria: "Must love problem solvers", hypothesis: 'Will solve all problems', location: 'Everywhere', owner: 'Me' } # rubocop:disable Metrics/LineLength

      let!(:variant_detail_a) do
        FactoryBot.create(
          :variant_detail,
          split: split_with_details,
          variant: 'enabled',
          display_name: 'fantastic_split_with_information is on',
          description: 'This awesome feature makes cool stuff happen.'
        )
      end
      let!(:variant_detail_b) do
        FactoryBot.create(
          :variant_detail,
          split: split_with_details,
          variant: 'disabled',
          display_name: 'fantastic_split_with_information is off',
          description: 'This feature makes nothing happen.',
          screenshot: File.open(Rails.root.join('spec', 'support', 'uploads', 'ttlogo.png'))
        )
      end

      it "responds with details" 

    end

    it "blows up if split id is incorrect" 

  end
end

