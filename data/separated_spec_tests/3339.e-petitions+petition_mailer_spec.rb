require "rails_helper"

RSpec.describe PetitionMailer, type: :mailer do
  let :creator do
    FactoryBot.create(:validated_signature, name: "Barry Butler", email: "bazbutler@gmail.com", creator: true)
  end

  let :petition do
    FactoryBot.create(:pending_petition,
      creator: creator,
      action: "Allow organic vegetable vans to use red diesel",
      background: "Add vans to permitted users of red diesel",
      additional_details: "To promote organic vegetables"
    )
  end

  let(:pending_signature) { FactoryBot.create(:pending_signature, petition: petition) }
  let(:validated_signature) { FactoryBot.create(:validated_signature, petition: petition) }
  let(:subject_prefix) { "HM Government & Parliament Petitions" }

  describe "notifying creator that moderation is delayed" do
    let! :petition do
      FactoryBot.create(:sponsored_petition,
        creator: creator,
        action: "Allow organic vegetable vans to use red diesel",
        background: "Add vans to permitted users of red diesel",
        additional_details: "To promote organic vegetables"
      )
    end

    let(:subject) { "Moderation of your petition is delayed" }
    let(:body) { "Sorry, but moderation of your petition is delayed for reasons." }
    let(:mail) { PetitionMailer.notify_creator_that_moderation_is_delayed(creator, subject, body) }

    it "is sent to the right address" 


    it "has an appropriate subject heading" 


    it "is addressed to the creator" 


    it "informs the creator of the change" 

  end

  describe "notifying creator of publication" do
    let(:mail) { PetitionMailer.notify_creator_that_petition_is_published(creator) }

    before do
      petition.publish
    end

    it "is sent to the right address" 


    it "has an appropriate subject heading" 


    it "is addressed to the creator" 


    it "informs the creator of the publication" 

  end

  describe "notifying sponsor of publication" do
    let(:mail) { PetitionMailer.notify_sponsor_that_petition_is_published(sponsor) }
    let(:sponsor) do
      FactoryBot.create(:validated_signature,
        name: "Laura Palmer",
        email: "laura@red-room.example.com",
        petition: petition
      )
    end

    before do
      petition.publish
    end

    it "is sent to the right address" 


    it "has an appropriate subject heading" 


    it "is addressed to the sponsor" 


    it "informs the sponsor of the publication" 

  end

  describe "notifying creator of rejection" do
    let(:mail) { PetitionMailer.notify_creator_that_petition_was_rejected(creator) }

    context "when rejecting for normal reasons" do
      before do
        petition.reject(code: "duplicate")
      end

      it "is sent to the right address" 


      it "has an appropriate subject heading" 


      it "is addressed to the creator" 


      it "informs the creator of the rejection" 

    end

    context "when there are further details" do
      before do
        petition.reject(code: "irrelevant", details: "Please stop trolling us" )
      end

      it "includes those details in the email" 

    end

    context "when rejecting for reason that cause the petition to be hidden" do
      before do
        petition.reject(code: "offensive")
      end

      it "doesn't include a link to the petition" 

    end
  end

  describe "notifying sponsor of rejection" do
    let(:mail) { PetitionMailer.notify_sponsor_that_petition_was_rejected(sponsor) }
    let(:sponsor) do
      FactoryBot.create(:validated_signature,
        name: "Laura Palmer",
        email: "laura@red-room.example.com",
        petition: petition
      )
    end

    context "when rejecting for normal reasons" do
      before do
        petition.reject(code: "duplicate")
      end

      it "is sent to the right address" 


      it "has an appropriate subject heading" 


      it "is addressed to the sponsor" 


      it "informs the sponsor of the publication" 

    end

    context "when there are further details" do
      before do
        petition.reject(code: "irrelevant", details: "Please stop trolling us" )
      end

      it "includes those details in the email" 

    end

    context "when rejecting for reason that cause the petition to be hidden" do
      before do
        petition.reject(code: "offensive")
      end

      it "doesn't include a link to the petition" 

    end
  end

  describe "notifying creator of closing date change" do
    let(:mail) { PetitionMailer.notify_creator_of_closing_date_change(creator) }

    before do
      petition.publish
      allow(Parliament).to receive(:dissolution_at).and_return(2.weeks.from_now)
    end

    it "is sent to the right address" 


    it "has an appropriate subject heading" 


    it "is addressed to the creator" 


    it "informs the creator of the change" 

  end

  describe "notifying creator of their sponsored petition being stopped" do
    let! :petition do
      FactoryBot.create(:sponsored_petition,
        creator: creator,
        action: "Allow organic vegetable vans to use red diesel",
        background: "Add vans to permitted users of red diesel",
        additional_details: "To promote organic vegetables"
      )
    end

    let(:mail) { PetitionMailer.notify_creator_of_sponsored_petition_being_stopped(creator) }

    it "is sent to the right address" 


    it "has an appropriate subject heading" 


    it "is addressed to the creator" 


    it "informs the creator of the change" 

  end

  describe "notifying creator of their validated petition being stopped" do
    let! :petition do
      FactoryBot.create(:validated_petition,
        creator: creator,
        action: "Allow organic vegetable vans to use red diesel",
        background: "Add vans to permitted users of red diesel",
        additional_details: "To promote organic vegetables"
      )
    end

    let(:mail) { PetitionMailer.notify_creator_of_validated_petition_being_stopped(creator) }

    it "is sent to the right address" 


    it "has an appropriate subject heading" 


    it "is addressed to the creator" 


    it "informs the creator of the change" 

  end

  describe "gathering sponsors for petition" do
    subject(:mail) { described_class.gather_sponsors_for_petition(petition) }

    it "has the correct subject" 


    it "has the addresses the creator by name" 


    it "sends it only to the petition creator" 


    it "includes a link to pass on to potential sponsors to have them support the petition" 


    it "includes the petition action" 


    it "includes the petition background" 


    it "includes the petition additional details" 

  end

  describe "notifying signature of debate outcome" do
    context "when the signature is the creator" do
      let(:signature) { petition.creator }
      subject(:mail) { described_class.notify_creator_of_debate_outcome(petition, signature) }

      shared_examples_for "a debate outcome email" do
        it "addresses the signatory by name" 


        it "sends it only to the creator" 


        it "includes a link to the petition page" 


        it "includes the petition action" 


        it "includes an unsubscribe link" 


        it "has a List-Unsubscribe header" 

      end

      shared_examples_for "a positive debate outcome email" do
        it "has the correct subject" 


        it "has the positive message in the body" 

      end

      shared_examples_for "a negative debate outcome email" do
        it "has the correct subject" 


        it "has the negative message in the body" 

      end

      context "when the debate outcome is positive" do
        context "when the debate outcome is not filled out" do
          before do
            FactoryBot.create(:debate_outcome, petition: petition)
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a positive debate outcome email"
        end

        context "when the debate outcome is filled out" do
          before do
            FactoryBot.create(:debate_outcome,
              debated_on: "2015-09-24",
              overview: "Discussion of the 2015 Christmas Adjournment",
              transcript_url: "http://www.publications.parliament.uk/pa/cm201509/cmhansrd/cm20150924/debtext/20150924-0003.htm#2015092449#000001",
              video_url: "http://parliamentlive.tv/event/index/20150924000001",
              debate_pack_url: "http://researchbriefings.parliament.uk/ResearchBriefing/Summary/CDP-2015-0001",
              petition: petition
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a positive debate outcome email"

          it "includes the debate outcome overview" 


          it "includes a link to the transcript of the debate" 


          it "includes a link to the video of the debate" 

        end
      end

      context "when the debate outcome is negative" do
        context "when the debate outcome is not filled out" do
          before do
            FactoryBot.create(:debate_outcome, debated: false, petition: petition)
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a negative debate outcome email"
        end

        context "when the debate outcome is filled out" do
          before do
            FactoryBot.create(:debate_outcome,
              debated: false,
              overview: "Discussion of the 2015 Christmas Adjournment",
              petition: petition
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a negative debate outcome email"

          it "includes the debate outcome overview" 

        end
      end
    end

    context "when the signature is not the creator" do
      let(:signature) { FactoryBot.create(:validated_signature, petition: petition, name: "Laura Palmer", email: "laura@red-room.example.com") }
      subject(:mail) { described_class.notify_signer_of_debate_outcome(petition, signature) }

      shared_examples_for "a debate outcome email" do
        it "addresses the signatory by name" 


        it "sends it only to the signatory" 


        it "includes a link to the petition page" 


        it "includes the petition action" 


        it "includes an unsubscribe link" 


        it "has a List-Unsubscribe header" 

      end

      shared_examples_for "a positive debate outcome email" do
        it "has the correct subject" 


        it "has the positive message in the body" 

      end

      shared_examples_for "a negative debate outcome email" do
        it "has the correct subject" 


        it "has the negative message in the body" 

      end

      context "when the debate outcome is positive" do
        context "when the debate outcome is not filled out" do
          before do
            FactoryBot.create(:debate_outcome, petition: petition)
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a positive debate outcome email"
        end

        context "when the debate outcome is filled out" do
          before do
            FactoryBot.create(:debate_outcome,
              debated_on: "2015-09-24",
              overview: "Discussion of the 2015 Christmas Adjournment",
              transcript_url: "http://www.publications.parliament.uk/pa/cm201509/cmhansrd/cm20150924/debtext/20150924-0003.htm#2015092449#000001",
              video_url: "http://parliamentlive.tv/event/index/20150924000001",
              debate_pack_url: "http://researchbriefings.parliament.uk/ResearchBriefing/Summary/CDP-2015-0001",
              petition: petition
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a positive debate outcome email"

          it "includes the debate outcome overview" 


          it "includes a link to the transcript of the debate" 


          it "includes a link to the video of the debate" 

        end
      end

      context "when the debate outcome is negative" do
        context "when the debate outcome is not filled out" do
          before do
            FactoryBot.create(:debate_outcome, debated: false, petition: petition)
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a negative debate outcome email"
        end

        context "when the debate outcome is filled out" do
          before do
            FactoryBot.create(:debate_outcome,
              debated: false,
              overview: "Discussion of the 2015 Christmas Adjournment",
              petition: petition
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a negative debate outcome email"

          it "includes the debate outcome overview" 

        end
      end
    end
  end

  describe "notifying signature of debate scheduled" do
    let(:petition) { FactoryBot.create(:open_petition, :scheduled_for_debate, creator_attributes: { name: "Bob Jones", email: "bob@jones.com" }, action: "Allow organic vegetable vans to use red diesel") }

    shared_examples_for "a debate scheduled email" do
      it "addresses the signatory by name" 


      it "sends it only to the signatory" 


      it "includes a link to the petition page" 


      it "includes an unsubscribe link" 


      it "has a List-Unsubscribe header" 

    end

    context "when the signature is the creator" do
      let(:signature) { petition.creator }
      subject(:mail) { described_class.notify_creator_of_debate_scheduled(petition, signature) }

      it_behaves_like "a debate scheduled email"

      it "has the correct subject" 


      it "identifies them as the creator" 

    end

    context "when the signature is not the creator" do
      let(:signature) { FactoryBot.create(:validated_signature, petition: petition, name: "Laura Palmer", email: "laura@red-room.example.com") }
      subject(:mail) { described_class.notify_signer_of_debate_scheduled(petition, signature) }

      it_behaves_like "a debate scheduled email"

      it "has the correct subject" 


      it "identifies them as a ordinary signature" 

    end
  end

  describe "emailing a signature" do
    let(:petition) { FactoryBot.create(:open_petition, :scheduled_for_debate, creator_attributes: { name: "Bob Jones", email: "bob@jones.com" }, action: "Allow organic vegetable vans to use red diesel") }
    let(:email) { FactoryBot.create(:petition_email, petition: petition, subject: "This is a message from the committee", body: "Message body from the petition committee") }

    shared_examples_for "a petition email" do
      it "has the correct subject" 


      it "addresses the signatory by name" 


      it "sends it only to the signatory" 


      it "includes a link to the petition page" 


      it "includes an unsubscribe link" 


      it "has a List-Unsubscribe header" 


      it "includes the message body" 

    end

    context "when the signature is the creator" do
      let(:signature) { petition.creator }
      subject(:mail) { described_class.email_creator(petition, signature, email) }

      it_behaves_like "a petition email"

      it "identifies them as the creator" 

    end

    context "when the signature is not the creator" do
      let(:signature) { FactoryBot.create(:validated_signature, petition: petition, name: "Laura Palmer", email: "laura@red-room.example.com") }
      subject(:mail) { described_class.email_signer(petition, signature, email) }

      it_behaves_like "a petition email"

      it "identifies them as a ordinary signature" 

    end
  end
end

