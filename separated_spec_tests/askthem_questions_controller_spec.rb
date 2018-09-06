require "spec_helper"

describe QuestionsController do
  describe "#new" do
    before do
      @person = FactoryGirl.create(:federal_legislator_bernard_sanders)
      @person.write_attribute(:active, true)
      @person.save
    end

    context "when question_skeleton is passed in via session" do
      it "populate question title and body from question_skeleton" 

    end
  end

  describe "#create", vcr: true do
    before do
      @person = FactoryGirl.create(:federal_legislator_bernard_sanders)
      @person.write_attribute(:active, true)
      @person.save
    end

    context "when referring_partner_info is passed" do
      let(:question_attributes) { { title: "XXX",
          body: "Y",
          person_id: @person.id,
          user: { email: "bernice@example.com" } } }

      let(:referring_partner) { { name: "Someone Special",
          url: "http://example.com",
          submitted_address: '05602' } }

      context "via session" do
        it "populate question.user with referring_partner_info" 


        it "populate question.user with attributes based on partner" 

      end

      context "via partner in params" do
        it "populate question.user with referring_partner_info" 


        it "populate question.user with attributes based on partner" 


        context "and the format is json" do
          let(:request_headers) { {
              "Accept" => "application/json",
              "Content-Type" => "application/json"
            }
          }

          let(:json_params) { {
              jurisdiction: @person.state,
              question: question_attributes,
              partner: referring_partner,
              format: :json
            }
          }

          it "if valid, it populates question, user, and person correctly" 


          it "if invalid, it returns errors in json" 


          it "if user exists w/ email, question is marked unconfirmed" 

        end
      end
    end
  end

  context "when requesting to destroy a question" do
    before do
      @person = FactoryGirl.create(:federal_legislator_bernard_sanders)
      @question = FactoryGirl.create(:question,
                                     person: @person,
                                     state: @person.state)
    end

    context "and logged out" do
      it "should refuse access" 

    end

    context "and not logged in as staff member" do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it "should refuse access" 


      after do
        sign_out :user
      end
    end

    context "and logged in as staff member" do
      before do
        @staff_member = FactoryGirl.create(:user)
        @staff_member.add_role :staff_member
        sign_in @staff_member
      end

      it "destroys question" 


      after do
        sign_out :staff_member
      end
    end
  end
end

