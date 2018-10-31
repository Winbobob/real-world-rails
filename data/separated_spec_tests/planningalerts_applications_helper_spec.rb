require 'spec_helper'

describe ApplicationsHelper do
  before :each do
    authority = mock_model(Authority, full_name: "An authority", short_name: "Blue Mountains")
    @application = mock_model(Application, map_url: "http://a.map.url",
      description: "A planning application", council_reference: "A1", authority: authority, info_url: "http://info.url", comment_url: "http://comment.url",
      on_notice_from: nil, on_notice_to: nil)
  end

  describe "display_description_with_address" do
    before :each do
      allow(@application).to receive(:address).and_return("Foo Road, NSW")
    end

    context "when the application has no description" do
      before :each do
        allow(@application).to receive(:description).and_return(nil)
      end

      it "should add generic ‘application for’ text" 

    end

    context "when the application has a description" do
      before :each do
        allow(@application).to receive(:description).and_return("Build something")
      end

      it {
        expect(helper.display_description_with_address(@application))
          .to eq "“Build something” at Foo Road, NSW"
      }

      it { expect(helper.display_description_with_address(@application)).to_not be html_safe? }
    end

    context "when the application has a description longer than 30 characters" do
      before :each do
        allow(@application).to receive(:description).and_return("Build something really really big")
      end

      it "should trucate the description" 

    end

    context "when the application has a description with special characters" do
      before :each do
        allow(@application).to receive(:description).and_return("Alertations & additions")
      end

      it "should not escape them" 

    end
  end

  describe "scraped_and_received_text" do
    before :each do
      allow(@application).to receive(:address).and_return("foo")
      allow(@application).to receive(:lat).and_return(1.0)
      allow(@application).to receive(:lng).and_return(2.0)
      allow(@application).to receive(:location).and_return(Location.new(1.0, 2.0))
    end

    it "should say when the application was received by the planning authority and when it appeared on PlanningAlerts" 


    it "should say something appropriate when the received date is not known" 

  end

  describe "on_notice_text" do
    before :each do
      allow(@application).to receive(:address).and_return("foo")
      allow(@application).to receive(:lat).and_return(1.0)
      allow(@application).to receive(:lng).and_return(2.0)
      allow(@application).to receive(:location).and_return(Location.new(1.0, 2.0))
      allow(@application).to receive(:date_received).and_return(nil)
      allow(@application).to receive(:date_scraped).and_return(Time.now)
    end

    it "should say when the application is on notice (and hasn't started yet)" 


    describe "period has just started" do
      it "should say when the application is on notice" 


      it "should say when the application is on notice" 

    end

    describe "period is in progress" do
      before :each do
        allow(@application).to receive(:on_notice_from).and_return(Date.today - 2.days)
        allow(@application).to receive(:on_notice_to).and_return(Date.today + 12.days)
      end

      it "should say when the application is on notice" 


      it "should only say when on notice to if there is no on notice from information" 

    end

    describe "period is finishing today" do
      it "should say when the application is on notice" 

    end

    describe "period is finished" do
      before :each do
        allow(@application).to receive(:on_notice_from).and_return(Date.today - 16.days)
        allow(@application).to receive(:on_notice_to).and_return(Date.today - 2.days)
      end

      it "should say when the application is on notice" 


      it "should only say when on notice to if there is no on notice from information" 

    end

    describe "authority_applications_json_url_for_current_user" do
      let(:authority) { create(:authority, short_name: "marrickville", ) }

      subject { helper.authority_applications_json_url_for_current_user(authority) }

      context "when there is a current user" do
        let(:user) { build(:user, api_key: "ABCDE12345" )}
        before { expect(helper).to receive(:current_user).and_return(user) }

        it { is_expected.to eq "http://test.host/authorities/marrickville/applications.js?key=ABCDE12345" }

        context "and we're in production" do
          before { allow(Rails.env).to receive(:production?).and_return true }

          it { is_expected.to eq "http://api.planningalerts.org.au/authorities/marrickville/applications.js?key=ABCDE12345" }
        end
      end

      context "when there is no current user" do
        # Required for call to current_user
        include Devise::Test::ControllerHelpers

        it { expect { subject }.to raise_error "undefined method `api_key' for nil:NilClass" }
      end
    end

    describe "static maps" do
      before :each do
        allow(@application).to receive(:address).and_return("Foo Road, NSW")
      end

      it "should generate a static google map api image" 

    end

    describe "static streetview" do
      before :each do
        allow(@application).to receive(:address).and_return("Foo Road, NSW")
      end

      it "should generate a static google streetview image" 

    end
  end
end

