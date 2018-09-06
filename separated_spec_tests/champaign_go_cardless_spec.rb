# coding: utf-8
# frozen_string_literal: true

require 'rails_helper'

describe 'GoCardless API' do
  let(:page) { create(:page, title: 'Foo Bar', slug: 'foo-bar') }
  let(:usd_amount) { 9.99 }
  let(:gbp_amount) { 11.55 }

  let(:bad_request_errors) do
    [{
      code: 422,
      message: 'Our technical team has been notified. Please double check your info or try a different payment method.'
    }]
  end

  let(:meta) do
    hash_including(title:      'Foo Bar',
                   uri:        '/a/foo-bar',
                   slug:       'foo-bar',
                   first_name: 'Bernie',
                   last_name:  'Sanders',
                   action_id:  instance_of(Integer),
                   created_at: be_within(30.seconds).of(Time.now),
                   country: 'United States')
  end

  before :each do
    allow_any_instance_of(Money).to receive(:exchange_to).and_return(
      instance_double(Money, cents: (gbp_amount * 100).to_i)
    )

    allow(MobileDetector).to receive(:detect).and_return(action_mobile: 'tablet')
  end

  describe 'redirect flow' do
    let(:page) { create :page, slug: 'implement-synergistic-cooperation', id: 1 }

    describe 'successful' do
      before :each do
        allow(SecureRandom).to receive(:uuid).and_return('the-session-id')
      end

      subject do
        VCR.use_cassette('go_cardless redirect flow request success') do
          get api_go_cardless_path(page, amount: 3, currency: 'EUR')
        end
      end

      it 'sets the go_cardless_session_id and passes that to the redirect flow' 


      it 'passes all url params to the redirect url' 


      it 'passes the description to go_cardless' 


      it 'redirects to a page hosted on GoCardless' 

    end

    describe 'unsuccessful' do
      before :each do
        allow(SecureRandom).to receive(:uuid).and_return(nil)
      end

      subject do
        VCR.use_cassette('go_cardless redirect flow request failure') do
          get api_go_cardless_path(page, amount: 5, currency: 'EUR')
        end
      end

      it 'renders payment/donation_errors in the sumofus template' 


      it 'assigns errors to be the relevant error message' 

    end
  end

  describe 'after successful redirect flow' do
    let(:sdk_params) do
      {
        params: {
          amount: (gbp_amount * 100).to_i,
          currency: 'GBP',
          links: {
            mandate: mandate_id # a_string_matching(/\AMD[0-9A-Z]+\z/)
          },
          metadata: {
            customer_id: customer_id # a_string_matching(/\ACU[0-9A-Z]+\z/)
          }
        }
      }
    end

    let(:redirect_flow_id) { 'RE00004631S7XT20JATGRP6QQ8VZEHRZ' }
    let(:creditor_id)      { 'CR000045KKQEY8' }
    let(:mandate_id)       { 'MD0000PSV8N7FR' }
    let(:customer_id)      { 'CU0000RR39FMVB' }
    let(:customer_bank_account_id) { 'BA0000P8MREF5F' }

    let(:email) { 'test@example.com' }
    let(:payment_id_regexp) { /^PM[0-9A-Z]+/ }
    let(:subscription_id_regexp) { /^SB[0-9A-Z]+/ }

    let(:base_params) do
      {
        amount: usd_amount.to_s,
        currency: 'USD',
        provider: 'GC',
        recurring: 'false',
        redirect_flow_id: redirect_flow_id,
        user: {
          name: 'Bernie Sanders',
          email: 'test@example.com',
          postal: '11225',
          address1: '25 Elm Drive',
          akid: '123.456.789',
          source: 'fb',
          country: 'US',
          action_registered_voter: '1',
          form_id: '127'
        }
      }
    end

    let(:completed_flow) do
      GoCardlessPro::Resources::RedirectFlow.new('id' => redirect_flow_id,
                                                 'description' => nil,
                                                 'session_token' => 'iamatoken',
                                                 'scheme' => nil,
                                                 'success_redirect_url' => 'http://localhost:3000/api/go_cardless/payment_complete?amount=10&user%5Bform_id%5D=127&user%5Bemail%5D=nealjmd%40gmail.com&user%5Bname%5D=Neal+Donnelly&user%5Bcountry%5D=US&user%5Bpostal%5D=01060&currency=USD&recurring=false&provider=GC',
                                                 'created_at' => '2016-04-11T19:15:07.713Z',
                                                 'links' => {
                                                   'creditor' => creditor_id,
                                                   'mandate'  => mandate_id,
                                                   'customer' => customer_id,
                                                   'customer_bank_account' => customer_bank_account_id
                                                 })
    end

    before :each do
      allow_any_instance_of(GoCardlessPro::Services::RedirectFlowsService).to receive(:complete).and_return(completed_flow)
    end

    context 'successful' do
      shared_examples 'donation action' do
        it 'creates a PaymentMethod record with relevant data and associations' 


        it 'creates an Action associated with the Page and Member' 


        it 'increments redis counters' 


        it 'leaves a cookie with the member_id' 


        it 'increments action count on Page' 


        it "redirects to the page's follow-up path" 


        it 'creates a Customer record with relevant data and associations' 

      end

      describe 'transaction' do
        let(:params) { base_params.merge(recurring: false) }
        let(:converted_money) { instance_double(Money, cents: 9001) }

        let(:donation_push_params) do
          {
            type: 'donation',
            payment_provider: 'go_cardless',
            meta: meta,
            params: {
              donationpage: {
                name: "#{page.slug}-donation",
                payment_account: 'GoCardless GBP'
              },
              order: hash_including(
                amount: gbp_amount.to_s,
                currency:       'GBP',
                card_num:       'DDEB',
                card_code:      '007',
                exp_date_month: '01',
                exp_date_year:  '99'
              ),
              user: hash_including(
                email: email,
                country: 'United States',
                postal: '11225',
                address1: '25 Elm Drive',
                first_name: 'Bernie',
                last_name: 'Sanders',
                akid: '123.456.789',
                source: 'fb',
                user_en: 1
              ),
              action: {
                source: 'fb',
                fields: hash_including(
                  action_registered_voter: '1',
                  action_mobile: 'tablet',
                  action_mandate_reference: 'OMAR-JMEKNM53MREX3',
                  action_bank_name: 'BARCLAYS BANK PLC',
                  action_account_number_ending: '11'
                )
              },
              referring_akid: nil
            }
          }
        end

        subject do
          VCR.use_cassette('go_cardless successful transaction') do
            get api_go_cardless_transaction_path(page.id), params: params
          end
        end

        shared_examples 'successful transaction' do
          let(:transaction_sdk_params) do
            {
              params: {
                amount: (gbp_amount * 100).to_i,
                currency: 'GBP',
                links: {
                  mandate: mandate_id # a_string_matching(/\AMD[0-9A-Z]+\z/)
                },
                metadata: {
                  customer_id: customer_id # a_string_matching(/\ACU[0-9A-Z]+\z/)
                },
                charge_date: /\d{4}\-\d{2}-\d{2}/
              }
            }
          end

          it 'sets the member status to donor' 


          it 'passes the correct data to the GoCardless Payment SDK' 


          it 'posts donation action to queue with correct data' 


          it 'stores amount, currency, is_subscription, and transaction_id in form_data on the Action' 


          it 'creates a Transaction record with associations and data' 

        end

        describe 'when Member exists' do
          let!(:member) { create :member, email: email }

          include_examples 'successful transaction'
          include_examples 'donation action'

          it "updates the Member's fields with any new data" 


          it 'adds the first Customer to the Member' 


          it 'can add a second Customer to the Member' 


          it 'does not change donor_status to donor if its already recurring_donor' 

        end

        describe 'when Member is new' do
          let(:member) { nil }

          include_examples 'successful transaction'
          include_examples 'donation action'

          it 'populates the Member’s fields with form data' 


          it 'associates the Member with a Customer' 

        end
      end

      describe 'subscription' do
        let(:params) { base_params.merge(recurring: true) }

        let(:donation_push_params) do
          {
            type: 'donation',
            payment_provider: 'go_cardless',
            meta: meta,
            params: {
              donationpage: {
                name: "#{page.slug}-donation",
                payment_account: 'GoCardless GBP'
              },
              order: {
                amount: gbp_amount.to_s,
                currency: 'GBP',
                recurring_id: subscription_id_regexp,
                card_num:       'DDEB',
                card_code:      '007',
                exp_date_month: '01',
                exp_date_year:  '99'
              },
              user: {
                email: email,
                country: 'United States',
                postal: '11225',
                address1: '25 Elm Drive',
                first_name: 'Bernie',
                last_name: 'Sanders',
                name: 'Bernie Sanders',
                akid: '123.456.789',
                source: 'fb',
                user_en: 1
              },
              action: {
                source: 'fb',
                fields: hash_including(
                  action_registered_voter: '1',
                  action_mobile: 'tablet',
                  action_mandate_reference: 'OMAR-JMEKNM53MREX3',
                  action_bank_name: 'BARCLAYS BANK PLC',
                  action_account_number_ending: '11',
                  action_express_donation: 0
                )
              },
              referring_akid: nil
            }
          }
        end

        subject do
          VCR.use_cassette('go_cardless successful subscription') do
            get api_go_cardless_transaction_path(page.id), params: params
          end
        end

        shared_examples 'successful subscription' do
          it 'passes the correct data to the GoCardless Payment SDK' 


          it 'posts donation action to queue with correct data' 


          it 'stores amount, currency, is_subscription, and subscription_id in form_data on the Action' 


          it 'does not yet create a transaction record' 


          it 'creates a Subscription record with associations and data' 


          it 'sets the member status to recurring_donor' 

        end

        describe 'when Member exists' do
          let!(:member) { create :member, email: email }

          include_examples 'successful subscription'
          include_examples 'donation action'

          it "updates the Member's fields with any new data" 


          it 'adds the first customer to the member' 


          it 'can add a second customer to the member' 

        end

        describe 'when Member is new' do
          let(:member) { nil }

          include_examples 'successful subscription'
          include_examples 'donation action'

          it 'populates the Member’s fields with form data' 


          it 'associates the Member with a Customer' 

        end
      end
    end

    context 'unsuccessful' do
      shared_examples 'correctly handles errors' do
        it 'does not create a PaymentMethod' 


        it 'does not create a Transaction' 


        it 'does not create a Subscription' 


        it 'does not create an Action' 


        it 'does not create a Member' 


        it 'does not push to the queue' 


        it 'does not leave a cookie' 


        it 'does not increment redis counters' 


        it 'does not change the action count on Page' 


        it 'assigns page to current page' 


        it 'renders payment/donation_errors' 

      end

      shared_examples 'displays bad request errors' do
        it 'assigns errors to relevant errors' 


        it 'assigns errors to relevant errors in the correct language' 

      end

      shared_examples 'displays bad id errors' do
        it 'assigns errors to relevant errors' 

      end

      describe 'mandate retrieval' do
        before :each do
          # to make the mandate get fail
          allow_any_instance_of(GoCardlessPro::Resources::RedirectFlow).to receive(:links).and_return(
            double(customer: 'CU00000000', mandate: 'MA000000')
          )
        end

        let(:params) { base_params.merge(recurring: false) }

        subject do
          VCR.use_cassette('go_cardless unsuccessful mandate retrieval') do
            get api_go_cardless_transaction_path(page.id), params: params
          end
        end

        include_examples 'correctly handles errors'
        include_examples 'displays bad id errors'
      end

      describe 'redirect flow completion' do
        before :each do
          allow_any_instance_of(GoCardlessPro::Services::RedirectFlowsService).to receive(:complete).and_call_original
        end

        let(:params) { base_params.merge(recurring: false, redirect_flow_id: 'RE000033300000') }

        subject do
          VCR.use_cassette('go_cardless unsuccessful flow completion') do
            get api_go_cardless_transaction_path(page.id), params: params
          end
        end

        include_examples 'correctly handles errors'
        include_examples 'displays bad id errors'
      end

      describe 'transaction' do
        before :each do
          # to make the creation fail
          allow_any_instance_of(GoCardlessPro::Resources::Mandate).to receive(:id).and_return(nil)
        end

        let(:params) { base_params.merge(recurring: false) }

        subject do
          VCR.use_cassette('go_cardless unsuccessful transaction') do
            get api_go_cardless_transaction_path(page.id), params: params
          end
        end

        include_examples 'correctly handles errors'
        include_examples 'displays bad request errors'
      end

      describe 'subscription' do
        before :each do
          # to make the creation fail
          allow_any_instance_of(GoCardlessPro::Resources::Mandate).to receive(:id).and_return(nil)
        end

        let(:params) { base_params.merge(recurring: true) }

        subject do
          VCR.use_cassette('go_cardless unsuccessful subscription') do
            get api_go_cardless_transaction_path(page.id), params: params
          end
        end

        include_examples 'correctly handles errors'
        include_examples 'displays bad request errors'
      end
    end
  end
end

