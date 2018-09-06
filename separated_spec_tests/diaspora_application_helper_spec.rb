# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe ApplicationHelper, :type => :helper do
  before do
    @user = alice
    @person = FactoryGirl.create(:person)
  end

  describe "#all_services_connected?" do
    before do
      AppConfig.configured_services = [1, 2, 3]

      def current_user
        @current_user
      end
      @current_user = alice
    end

    after do
      AppConfig.configured_services = nil
    end

    it 'returns true if all networks are connected' 


    it 'returns false if not all networks are connected' 

  end

  describe "#service_unconnected?" do
    attr_reader :current_user

    before do
      @current_user = alice
    end

    it "returns true if the service is unconnected" 


    it "returns false if the service is already connected" 


    it "returns false if the the service shouldn't be shown" 

  end

  describe "#jquery_include_tag" do
    describe "with jquery cdn" do
      before do
        AppConfig.privacy.jquery_cdn = true
      end

      it 'inclues jquery.js from jquery cdn' 


      it 'falls back to asset pipeline on cdn failure' 

    end

    describe "without jquery cdn" do
      before do
        AppConfig.privacy.jquery_cdn = false
      end

      it 'includes jquery.js from asset pipeline' 

    end

    it 'inclues jquery_ujs.js' 


    it "disables ajax caching" 

  end

  describe "#donations_enabled?" do
    it "returns false when nothing is set" 


    it "returns true when the paypal donations is enabled" 


    it "returns true when the liberapay username is set" 


    it "returns true when the bitcoin_address is set" 


    it "returns true when all the donations are enabled" 

  end

  describe "#changelog_url" do
    let(:changelog_url_setting) {
      double.tap {|double| allow(AppConfig).to receive(:settings).and_return(double(changelog_url: double)) }
    }

    it "defaults to master branch changleog" 


    it "displays the changelog for the current git revision if set" 


    it "displays the configured changelog url if set" 

  end

  describe '#pod_name' do
    it 'defaults to Diaspora*' 


    it 'displays the supplied pod_name if it is set' 

  end

  describe '#pod_version' do
    it 'displays the supplied pod_version if it is set' 

  end
end

