require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  render_views

  let(:alice) { Fabricate(:account, username: 'alice') }
  let(:eve) { Fabricate(:user) }

  describe 'GET #show' do
    let!(:status1) { Status.create!(account: alice, text: 'Hello world') }
    let!(:status2) { Status.create!(account: alice, text: 'Boop', thread: status1) }
    let!(:status3) { Status.create!(account: alice, text: 'Picture!') }
    let!(:status4) { Status.create!(account: alice, text: 'Mentioning @alice') }
    let!(:status5) { Status.create!(account: alice, text: 'Kitsune') }
    let!(:status6) { Status.create!(account: alice, text: 'Neko') }
    let!(:status7) { Status.create!(account: alice, text: 'Tanuki') }

    let!(:status_pin1) { StatusPin.create!(account: alice, status: status5, created_at: 5.days.ago) }
    let!(:status_pin2) { StatusPin.create!(account: alice, status: status6, created_at: 2.years.ago) }
    let!(:status_pin3) { StatusPin.create!(account: alice, status: status7, created_at: 10.minutes.ago) }

    before do
      alice.block!(eve.account)
      status3.media_attachments.create!(account: alice, file: fixture_file_upload('files/attachment.jpg', 'image/jpeg'))
    end

    shared_examples 'responses' do
      before do
        sign_in(current_user) if defined? current_user
        get :show, params: {
          username: alice.username,
          max_id: (max_id if defined? max_id),
          since_id: (since_id if defined? since_id),
          current_user: (current_user if defined? current_user),
        }, format: format
      end

      it 'assigns @account' 


      it 'returns http success' 


      it 'returns correct format' 

    end

    context 'atom' do
      let(:format) { 'atom' }
      let(:content_type) { 'application/atom+xml' }

      shared_examples 'responsed streams' do
        it 'assigns @entries' 

      end

      include_examples 'responses'

      context 'without max_id nor since_id' do
        let(:expected_statuses) { [status7, status6, status5, status4, status3, status2, status1] }

        include_examples 'responsed streams'
      end

      context 'with max_id and since_id' do
        let(:max_id) { status4.stream_entry.id }
        let(:since_id) { status1.stream_entry.id }
        let(:expected_statuses) { [status3, status2] }

        include_examples 'responsed streams'
      end
    end

    context 'activitystreams2' do
      let(:format) { 'json' }
      let(:content_type) { 'application/activity+json' }

      include_examples 'responses'
    end

    context 'html' do
      let(:format) { nil }
      let(:content_type) { 'text/html' }

      shared_examples 'responsed statuses' do
        it 'assigns @pinned_statuses' 


        it 'assigns @statuses' 

      end

      include_examples 'responses'

      context 'with anonymous visitor' do
        context 'without since_id nor max_id' do
          let(:expected_statuses) { [status7, status6, status5, status4, status3, status2, status1] }
          let(:expected_pinned_statuses) { [status7, status5, status6] }

          include_examples 'responsed statuses'
        end

        context 'with since_id nor max_id' do
          let(:max_id) { status4.id }
          let(:since_id) { status1.id }
          let(:expected_statuses) { [status3, status2] }
          let(:expected_pinned_statuses) { [] }

          include_examples 'responsed statuses'
        end
      end

      context 'with blocked visitor' do
        let(:current_user) { eve }

        context 'without since_id nor max_id' do
          let(:expected_statuses) { [] }
          let(:expected_pinned_statuses) { [] }

          include_examples 'responsed statuses'
        end
      end
    end
  end
end

