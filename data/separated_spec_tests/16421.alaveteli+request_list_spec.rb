# -*- encoding : utf-8 -*-
require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../alaveteli_dsl')

describe "pro request list" do
  let(:pro_user) { FactoryBot.create(:pro_user) }
  let(:public_body){ FactoryBot.create(:public_body) }
  let!(:pro_user_session) { login(pro_user) }
  let!(:info_requests) do
    requests = []
    TestAfterCommit.with_commits(true) do
      requests = FactoryBot.create_list(:info_request, 3, user: pro_user,
                                        :public_body => public_body)
    end
    requests
  end

  let(:public_bodies) do
    FactoryBot.create_list(:public_body, 2)
  end

  let!(:batch_requests) do
    requests = []
    TestAfterCommit.with_commits(true) do
      requests = FactoryBot.create_list(
        :info_request_batch,
        5,
        user: pro_user,
        public_bodies: public_bodies)
    end
  end

  before do
    # Send 4 out of 5 of the batch requests
    TestAfterCommit.with_commits(true) do
      batch_requests[0..3].each do |batch|
        batch.create_batch!
        batch.update(sent_at: Time.zone.now)
        batch.reload
      end
    end
  end

  it "shows requests that have been made" 


  it "shows batch requests alongside other requests" 


  it "shows batch requests that haven't been sent yet" 


  describe "showing draft requests" do
    let!(:draft_request) do
      draft = nil
      TestAfterCommit.with_commits(true) do
        draft = FactoryBot.create(:draft_info_request, user: pro_user)
      end
      draft
    end
    let!(:draft_batch_request) do
      draft = nil
      TestAfterCommit.with_commits(true) do
        draft = FactoryBot.create(
          :draft_info_request_batch,
          user: pro_user,
          public_bodies: public_bodies
        )
      end
      draft
    end

    it "shows draft requests" 


    it "shows draft batch requests" 

  end
end

