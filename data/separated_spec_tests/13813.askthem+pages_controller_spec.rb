require "spec_helper"

describe PagesController do
  describe "#locator" do
    context "when passed partner info parameters" do
      before do
        @person = FactoryGirl.create(:federal_legislator_bernard_sanders)
        @person.write_attribute(:active, true)
        @person.save
      end

      it "stores info in user session", vcr: true do
        referring_partner = { name: "Someone Special",
                              url: "http://example.com",
                              return_url: nil,
                              submitted_address: "05602" }
        post :locator, { q: "05602",
                         "partner[name]" => referring_partner[:name],
                         "partner[url]" => referring_partner[:url] }
        expect(session[:referring_partner_info]).to eq referring_partner
      end
    end

    context "when passed question parameters" do
      it "stores info in user session", vcr: true do
        question = { title: "Blah, blah",
                     body: "yada, yada, yada" }
        post :locator, { q: "05602",
                         "question[title]" => question[:title],
                         "question[body]" => question[:body] }
        expect(session[:question_skeleton]).to eq question
      end
    end
  end

  context "when requesting csv" do
    context "and logged out" do
      it "should refuse access" 

    end

    context "and not logged in as staff member" do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it "should refuse access" 

    end

    context "and logged in as staff member" do
      before do
        @person = FactoryGirl.create(:state_legislator_ny_sheldon_silver)
        @person.write_attribute(:active, true)
        @person.save

        @staff_member = FactoryGirl.create(:user)
        @staff_member.add_role :staff_member
        sign_in @staff_member
      end

      it "returns csv rows" 

    end

    after do
      sign_out :user
    end
  end

  context "when requesting json"do
    describe "#locator" do
      it "takes a geographic address and returns matching people", :vcr do
        get :locator, format: :json, q: "148 Lafayette, NY, NY"
        expect(JSON.parse(response.body).size).to eq 7
      end
    end

    describe "#identifier" do
      it "takes an email address and returns matching person" 


      it "takes jurisdiction and a name_fragment and returns matching people" 


      it "takes a person_id and returns matching person" 


      context "when submittting a twitter_id" do
        context "and there is a person in the db with that twitter_id" do
          it "returns matching person from db" 

        end

        context "and there isn't a person in the db with the twitter_id" do
          it "is empty array if no matching person on twitter", vcr: true do
            get :identifier, format: :json, twitter_id: "mockument_to_humanity"
            expect(JSON.parse(response.body)).to eq []
          end

          it "returns matching person from twitter if there is one", vcr: true do
            get :identifier, format: :json, twitter_id: "SenSanders"
            expect(JSON.parse(response.body).first["full_name"])
              .to eq "Bernie Sanders"
          end
        end
      end
    end

    def expected_from_json
      [identity_json_for(@person)]
    end

    def identity_json_for(person)
      person.as_json({ only: [:full_name,
                              :photo_url,
                              :party],
                       methods: [:id,
                                 :state,
                                 :political_position_title,
                                 :most_recent_district] })
    end
  end
end

