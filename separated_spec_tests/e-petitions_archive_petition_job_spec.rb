require 'rails_helper'
require 'digest/sha2'

RSpec.describe ArchivePetitionJob, type: :job do
  let(:petition) { FactoryBot.create(:closed_petition) }
  let(:archived_petition) { Archived::Petition.first }
  let(:email_request) { petition.email_requested_receipt }

  let(:archive_signatures_job) do
    {
      job: ArchiveSignaturesJob,
      args: [
        { "_aj_globalid" => "gid://epets/Petition/#{petition.id}" },
        { "_aj_globalid" => "gid://epets/Archived::Petition/#{petition.id}" }
      ],
      queue: "low_priority"
    }
  end

  before do
    FactoryBot.create(:constituency, :coventry_north_east)
    FactoryBot.create(:constituency, :bethnal_green_and_bow)
    FactoryBot.create(:constituency_petition_journal, constituency_id: "3427", signature_count: 123, petition: petition)
    FactoryBot.create(:constituency_petition_journal, constituency_id: "3320", signature_count: 456, petition: petition)

    gb = FactoryBot.create(:location, code: "GB", name: "United Kingdom")
    us = FactoryBot.create(:location, code: "US", name: "United States")
    FactoryBot.create(:country_petition_journal, location: gb, signature_count: 1234, petition: petition)
    FactoryBot.create(:country_petition_journal, location: us, signature_count: 56, petition: petition)

    described_class.perform_now(petition)
  end

  it "enqueues an ArchiveSignaturesJob" 


  context "with a closed petition" do
    let(:petition) do
      FactoryBot.create(
        :closed_petition,
        action: "Make Wombles Great Again",
        background: "The 70s was a great time for kids TV",
        additional_details: "Also the Clangers too",
        opened_at: 6.months.ago,
        closed_at: 2.months.ago,
        signature_count: 1234,
        moderation_threshold_reached_at: 7.months.ago,
        moderation_lag: 30,
        last_signed_at: 3.months.ago,
        created_at: 8.months.ago,
        updated_at: 1.month.ago
      )
    end

    let(:signatures_by_constituency) do
      archived_petition.read_attribute(:signatures_by_constituency)
    end

    let(:signatures_by_country) do
      archived_petition.read_attribute(:signatures_by_country)
    end

    it "copies the attributes" 


    it "copies the constituency_petition_journal data" 


    it "copies the country_petition_journal data" 

  end

  context "with a stopped petition" do
    let(:petition) do
      FactoryBot.create(:stopped_petition, stopped_at: 2.months.ago)
    end

    it "copies the attributes" 

  end

  context "with a petition marked for special consideration" do
    let(:petition) do
      FactoryBot.create(:stopped_petition, special_consideration: true)
    end

    it "copies the attributes" 

  end

  context "with a petition that reached the response threshold" do
    let(:petition) do
      FactoryBot.create(:closed_petition, response_threshold_reached_at: 2.months.ago)
    end

    it "copies the attributes" 

  end

  context "with a petition that reached the debate threshold" do
    let(:petition) do
      FactoryBot.create(:closed_petition,
        debate_threshold_reached_at: 2.months.ago,
        debate_state: "awaiting"
      )
    end

    it "copies the attributes" 

  end

  context "with a petition that has a debate scheduled" do
    let(:petition) do
      FactoryBot.create(:closed_petition, scheduled_debate_date: 2.weeks.from_now)
    end

    it "copies the attributes" 

  end

  context "with a rejected petition" do
    let(:petition) do
      FactoryBot.create(:rejected_petition,
        rejected_at: 6.months.ago,
        rejection_code: "irrelevant",
        rejection_details: "The government doesn't control kids TV"
      )
    end

    let(:rejection) { petition.rejection }
    let(:archived_rejection) { archived_petition.rejection }

    it "copies the attributes" 


    it "copies the rejection object" 

  end

  context "with a responded petition" do
    let(:petition) do
      FactoryBot.create(:responded_petition,
        state: "closed",
        closed_at: 2.months.ago,
        government_response_at: 2.months.ago,
        response_summary: "Hell, yeah!",
        response_details: "We were kids too."
      )
    end

    let(:government_response) { petition.government_response }
    let(:archived_government_response) { archived_petition.government_response }

    it "copies the attributes" 


    it "copies the government_response object" 

  end

  context "with a petition that has a debate outcome" do
    let(:debate_outcome) { petition.debate_outcome }
    let(:archived_debate_outcome) { archived_petition.debate_outcome }
    let(:commons_image_file_digest) { Digest::SHA256.file(commons_image_file) }

    context "when the debate outcome doesn't have a commons image" do
      let(:petition) do
        FactoryBot.create(:debated_petition,
          state: "closed",
          closed_at: 2.months.ago,
          debate_outcome_at: 2.months.ago,
          debated_on: 2.months.ago,
          overview: "Debate on kids TV",
          transcript_url: "https://hansard.parliament.uk/commons/2017-04-24/debates/123456/KidsTV",
          video_url: "http://www.parliamentlive.tv/Event/Index/123456",
          debate_pack_url: "http://researchbriefings.parliament.uk/ResearchBriefing/Summary/CDP-2015-0001"
        )
      end

      it "copies the attributes" 


      it "copies the debate_outcome object" 

    end

    context "when the debate outcome has a commons image" do
      let(:petition) do
        FactoryBot.create(:debated_petition,
          state: "closed",
          closed_at: 2.months.ago,
          debate_outcome_at: 2.months.ago,
          debated_on: 2.months.ago,
          overview: "Debate on kids TV",
          transcript_url: "https://hansard.parliament.uk/commons/2017-04-24/debates/123456/KidsTV",
          video_url: "http://www.parliamentlive.tv/Event/Index/123456",
          debate_pack_url: "http://researchbriefings.parliament.uk/ResearchBriefing/Summary/CDP-2015-0001",
          commons_image: File.new(commons_image_file)
        )
      end

      it "copies the attributes" 


      it "copies the debate_outcome object" 


      it "copies the commons_image object" 

    end
  end

  context "with a petition that has an government_response email scheduled" do
    let(:petition) do
      FactoryBot.create(:closed_petition, :email_requested, email_requested_for_government_response_at: Time.current)
    end

    it "copies the receipt timestamp to the archived petition" 

  end

  context "with a petition that has an debate_scheduled email scheduled" do
    let(:petition) do
      FactoryBot.create(:closed_petition, :email_requested, email_requested_for_debate_scheduled_at: Time.current)
    end

    it "copies the receipt timestamp to the archived petition" 

  end

  context "with a petition that has an debate_outcome email scheduled" do
    let(:petition) do
      FactoryBot.create(:closed_petition, :email_requested, email_requested_for_debate_outcome_at: Time.current)
    end

    it "copies the receipt timestamp to the archived petition" 

  end

  context "with a petition that has an petition_email email scheduled" do
    let(:petition) do
      FactoryBot.create(:closed_petition, :email_requested, email_requested_for_petition_email_at: Time.current)
    end

    it "copies the receipt timestamp to the archived petition" 

  end
end

