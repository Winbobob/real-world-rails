# frozen_string_literal: true

require 'rails_helper'

describe Api::Web::PushSubscriptionsController do
  render_views

  let(:user) { Fabricate(:user) }

  let(:create_payload) do
    {
      subscription: {
        endpoint: 'https://fcm.googleapis.com/fcm/send/fiuH06a27qE:APA91bHnSiGcLwdaxdyqVXNDR9w1NlztsHb6lyt5WDKOC_Z_Q8BlFxQoR8tWFSXUIDdkyw0EdvxTu63iqamSaqVSevW5LfoFwojws8XYDXv_NRRLH6vo2CdgiN4jgHv5VLt2A8ah6lUX',
        keys: {
          p256dh: 'BEm_a0bdPDhf0SOsrnB2-ategf1hHoCnpXgQsFj5JCkcoMrMt2WHoPfEYOYPzOIs9mZE8ZUaD7VA5vouy0kEkr8=',
          auth: 'eH_C8rq2raXqlcBVDa1gLg==',
        },
      }
    }
  end

  let(:alerts_payload) do
    {
      data: {
        alerts: {
          follow: true,
          favourite: false,
          reblog: true,
          mention: false,
        }
      }
    }
  end

  describe 'POST #create' do
    it 'saves push subscriptions' 


    context 'with initial data' do
      it 'saves alert settings' 

    end
  end

  describe 'PUT #update' do
    it 'changes alert settings' 

  end
end

