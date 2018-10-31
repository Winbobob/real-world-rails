# -*- encoding : utf-8 -*-
require 'spec_helper'

shared_examples_for "creating a search" do
  it "performs a search" 


  it "sets @query" 


  it "sets @result_limit" 


  it "sets @page" 


  it "sets @per_page" 

end

describe AlaveteliPro::BatchRequestAuthoritySearchesController do
  let(:pro_user) do
    user = FactoryBot.create(:pro_user)
    AlaveteliFeatures.backend.enable_actor(:pro_batch_access, user)
    user
  end

  describe "#index" do
    let!(:authority_1) { FactoryBot.create(:public_body) }
    let!(:authority_2) { FactoryBot.create(:public_body) }
    let!(:authority_3) { FactoryBot.create(:public_body) }

    before :all do
      get_fixtures_xapian_index
    end

    before do
      update_xapian_index
      session[:user_id] = pro_user.id
    end

    after do
      authority_1.destroy
      authority_2.destroy
      authority_3.destroy
      update_xapian_index
    end

    context 'without a draft_id param' do
      it 'initializes a draft if a draft_id was not provided' 

    end

    context 'with a draft_id param' do
      it 'finds a draft by draft_id' 


      it 'initializes a draft if one cannot be found with the given draft_id' 

    end

    context "when responding to a normal request" do
      before do
        with_feature_enabled(:alaveteli_pro) do
          get :index, authority_query: 'Example'
        end
      end

      it_behaves_like "creating a search"

      it "handles an empty query string" 


      it "renders index.html.erb" 


      it "raises WillPaginate::InvalidPage error for pages beyond the limit" 

    end

    context "when responding to an ajax request" do
      before do
        with_feature_enabled :alaveteli_pro do
          xhr :get, :index, authority_query: 'Example'
        end
      end

      it_behaves_like "creating a search"

      it "handles an empty query string" 


      it "only renders _search_results.html.erb" 


      it "raises WillPaginate::InvalidPage error for pages beyond the limit" 

    end

    context "the user does not have pro batch access" do

      let(:pro_user) { FactoryBot.create(:pro_user) }

      it 'redirects them to the standard request form' 


    end

  end

  describe '#new' do

    before do
      session[:user_id] = pro_user.id
    end

    it 'redirects to index action' 


    context "the user does not have pro batch access" do

      let(:pro_user) { FactoryBot.create(:pro_user) }

      it 'redirects them to the standard request form' 


    end

  end

end

