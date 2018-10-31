# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AttachmentsController, type: :controller do
  let(:instance) { Instance.default }
  render_views

  with_tenant(:instance) do
    let(:user) { create(:administrator) }
    before { sign_in(user) }

    describe '#create' do
      let(:attachment) { create(:attachment) }
      let(:json) { JSON.parse(response.body) }
      subject { post :create, format: :json }

      context 'when file is not specified or invalid' do
        before do
          controller.instance_variable_set(:@attachment, nil)
          subject
        end

        it 'returns success: false in the response' 

      end

      context 'when file is valid' do
        before do
          controller.instance_variable_set(:@attachment, attachment)
          subject
        end

        it 'returns success: true in the response' 


        it 'returns the url of the attachment' 

      end
    end
  end
end

