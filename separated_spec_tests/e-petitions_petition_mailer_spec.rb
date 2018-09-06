require "rails_helper"

RSpec.describe Archived::PetitionMailer, type: :mailer do
  let :creator do
    FactoryBot.create(:archived_signature,
      name: "Barry Butler",
      email: "bazbutler@gmail.com",
      creator: true
    )
  end

  let(:signer) do
    FactoryBot.create(:archived_signature,
      name: "Laura Palmer",
      email: "laurapalmer@hotmail.com",
      petition: petition
    )
  end

  describe "notifying signature of a government response" do
    let :petition do
      FactoryBot.create(:archived_petition, :response,
        action: "Allow organic vegetable vans to use red diesel",
        background: "Add vans to permitted users of red diesel",
        additional_details: "To promote organic vegetables",
        response_summary: "Sounds like a good idea",
        response_details: "We’ll get right on that",
        signature_count: signature_count
      )
    end

    let(:signature_count) { 15000 }

    shared_examples_for "a government response email" do
      it "includes a link to the petition page" 


      it "includes the petition action" 


      it "includes an unsubscribe link" 


      it "has a List-Unsubscribe header" 


      it "has the correct subject" 


      it "has response summary in the body" 


      it "has response details in the body" 


      it "includes a link to read the response online" 


      context "when the signature count is less than the debate threshold" do
        let(:signature_count) { 12345 }

        it "includes a message about the committee's response" 

      end

      context "when the signature count is more than the debate threshold" do
        let(:signature_count) { 123456 }

        it "includes a message about the committee's response" 

      end
    end

    context "when the signature is the creator" do
      let(:signature) { creator }
      subject(:mail) { described_class.notify_creator_of_threshold_response(petition, signature) }

      it_behaves_like "a government response email"

      it "sends it only to the creator" 


      it "addresses the signatory by name" 


      it "has the message in the body" 

    end

    context "when the signature is not the creator" do
      let(:signature) { signer }
      subject(:mail) { described_class.notify_signer_of_threshold_response(petition, signature) }

      it_behaves_like "a government response email"

      it "sends it only to the signer" 


      it "addresses the signatory by name" 


      it "has the message in the body" 

    end
  end

  describe "notifying signature of a debate being scheduled" do
    let :petition do
      FactoryBot.create(:archived_petition, :scheduled_for_debate,
        action: "Allow organic vegetable vans to use red diesel",
        background: "Add vans to permitted users of red diesel",
        additional_details: "To promote organic vegetables",
        scheduled_debate_date: "2017-09-12"
      )
    end

    shared_examples_for "a debate scheduled email" do
      it "includes a link to the petition page" 


      it "includes the petition action" 


      it "includes an unsubscribe link" 


      it "has a List-Unsubscribe header" 


      it "has the correct subject" 


      it "has the scheduled debate date in the body" 

    end

    context "when the signature is the creator" do
      let(:signature) { creator }
      subject(:mail) { described_class.notify_creator_of_debate_scheduled(petition, signature) }

      it_behaves_like "a debate scheduled email"

      it "sends it only to the creator" 


      it "addresses the signatory by name" 


      it "has the message in the body" 

    end

    context "when the signature is not the creator" do
      let(:signature) { signer }
      subject(:mail) { described_class.notify_signer_of_debate_scheduled(petition, signature) }

      it_behaves_like "a debate scheduled email"

      it "sends it only to the signer" 


      it "addresses the signatory by name" 


      it "has the message in the body" 

    end
  end

  describe "notifying signature of debate outcome" do
    context "when the signature is the creator" do
      let(:signature) { creator }
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
          let :petition do
            FactoryBot.create(:archived_petition, :debated,
              action: "Allow organic vegetable vans to use red diesel",
              background: "Add vans to permitted users of red diesel",
              additional_details: "To promote organic vegetables"
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a positive debate outcome email"
        end

        context "when the debate outcome is filled out" do
          let :petition do
            FactoryBot.create(:archived_petition, :debated,
              action: "Allow organic vegetable vans to use red diesel",
              background: "Add vans to permitted users of red diesel",
              additional_details: "To promote organic vegetables",
              debated_on: "2015-09-24",
              overview: "Discussion of the 2015 Christmas Adjournment",
              transcript_url: "http://www.publications.parliament.uk/pa/cm201509/cmhansrd/cm20150924/debtext/20150924-0003.htm#2015092449#000001",
              video_url: "http://parliamentlive.tv/event/index/20150924000001",
              debate_pack_url: "http://researchbriefings.parliament.uk/ResearchBriefing/Summary/CDP-2015-0001"
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
          let :petition do
            FactoryBot.create(:archived_petition, :not_debated,
              action: "Allow organic vegetable vans to use red diesel",
              background: "Add vans to permitted users of red diesel",
              additional_details: "To promote organic vegetables"
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a negative debate outcome email"
        end

        context "when the debate outcome is filled out" do
          let :petition do
            FactoryBot.create(:archived_petition, :not_debated,
              action: "Allow organic vegetable vans to use red diesel",
              background: "Add vans to permitted users of red diesel",
              additional_details: "To promote organic vegetables",
              overview: "Discussion of the 2015 Christmas Adjournment"
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a negative debate outcome email"

          it "includes the debate outcome overview" 

        end
      end
    end

    context "when the signature is not the creator" do
      let(:signature) { signer }
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
          let :petition do
            FactoryBot.create(:archived_petition, :debated,
              action: "Allow organic vegetable vans to use red diesel",
              background: "Add vans to permitted users of red diesel",
              additional_details: "To promote organic vegetables"
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a positive debate outcome email"
        end

        context "when the debate outcome is filled out" do
          let :petition do
            FactoryBot.create(:archived_petition, :debated,
              action: "Allow organic vegetable vans to use red diesel",
              background: "Add vans to permitted users of red diesel",
              additional_details: "To promote organic vegetables",
              debated_on: "2015-09-24",
              overview: "Discussion of the 2015 Christmas Adjournment",
              transcript_url: "http://www.publications.parliament.uk/pa/cm201509/cmhansrd/cm20150924/debtext/20150924-0003.htm#2015092449#000001",
              video_url: "http://parliamentlive.tv/event/index/20150924000001",
              debate_pack_url: "http://researchbriefings.parliament.uk/ResearchBriefing/Summary/CDP-2015-0001"
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
          let :petition do
            FactoryBot.create(:archived_petition, :not_debated,
              action: "Allow organic vegetable vans to use red diesel",
              background: "Add vans to permitted users of red diesel",
              additional_details: "To promote organic vegetables"
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a negative debate outcome email"
        end

        context "when the debate outcome is filled out" do
          let :petition do
            FactoryBot.create(:archived_petition, :not_debated,
              action: "Allow organic vegetable vans to use red diesel",
              background: "Add vans to permitted users of red diesel",
              additional_details: "To promote organic vegetables",
              overview: "Discussion of the 2015 Christmas Adjournment"
            )
          end

          it_behaves_like "a debate outcome email"
          it_behaves_like "a negative debate outcome email"

          it "includes the debate outcome overview" 

        end
      end
    end
  end

  describe "emailing a signature" do
    let :petition do
      FactoryBot.create(:archived_petition,
        action: "Allow organic vegetable vans to use red diesel",
        background: "Add vans to permitted users of red diesel",
        additional_details: "To promote organic vegetables"
      )
    end

    let(:email) do
      FactoryBot.create(:archived_petition_email,
        subject: "This is a message from the committee",
        body: "Message body from the petition committee",
        petition: petition
      )
    end

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
      let(:signature) { creator }
      subject(:mail) { described_class.email_creator(petition, signature, email) }

      it_behaves_like "a petition email"

      it "identifies them as the creator" 

    end

    context "when the signature is not the creator" do
      let(:signature) { signer }
      subject(:mail) { described_class.email_signer(petition, signature, email) }

      it_behaves_like "a petition email"

      it "identifies them as a ordinary signature" 

    end
  end
end

