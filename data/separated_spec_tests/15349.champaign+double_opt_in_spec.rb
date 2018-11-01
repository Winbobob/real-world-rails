# frozen_string_literal: true

require 'rails_helper'

describe 'Double opt-in' do
  let(:params) do
    {
      email:    'hello@example.com',
      form_id:  form.id,
      source:   'fb',
      country:  'DE',
      name: 'John Doe'
    }
  end

  describe 'creating an action' do
    let(:pending_action) { PendingAction.last }
    let(:form) { create(:form_with_email_and_optional_country) }

    context 'without petiton plugin' do
      let(:page) {
        create(:page, :with_call_tool, title: 'Foo Bar',
                                       slug: 'foo-bar',
                                       language: create(:language, :german))
      }

      it 'does not record a pending action' 

    end

    context 'with petition plugin' do
      let(:page) {
        create(:page, :with_petition, title: 'Foo Bar',
                                      slug: 'foo-bar',
                                      follow_up_liquid_layout: create(:liquid_layout),
                                      language: create(:language, :german))
      }

      let(:client) { double }

      before do
        allow(Aws::SNS::Client).to receive(:new) { client }
        allow(client).to receive(:publish)
      end

      context 'with existing member' do
        let!(:member) { create(:member, email: 'hello@example.com') }

        context 'without consent' do
          before do
            member.update(consented: false)
          end

          it 'creates pending action' 

        end

        context 'with consent' do
          before do
            member.update(consented: true)
          end

          it 'does not create a pending action' 

        end
      end

      it 'records email address' 


      it 'increments email count (number of confirmation emails sent)' 


      it 'triggers an sns event' 


      it 'records when email was sent' 


      it 'redirects to follow up' 

    end
  end
end

