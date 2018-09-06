require "#{Rails.root}/db/chores/expired_record_cleaner"

describe ExpiredRecordCleaner do
  describe "fiscal year" do
    it "parses fiscal start date" 

  end

  describe ".vaccum_old_proposals" do
    # TODO: Fix this brittle test
    #
    # it "locates old pending proposals but does not act on them" do
    #   proposal = create(:proposal)
    #   Timecop.travel(Time.zone.now + 1.year) do
    #     cleaner = ExpiredRecordCleaner.new(Time.zone.now)
    #     expect(cleaner.vacuum_old_proposals).to eq([proposal.id])
    #     expect(deliveries.length).to eq(0)
    #     proposal.reload
    #     expect(proposal.status).to eq("pending")
    #   end
    # end

    # TODO: Fix this brittle test
    #
    # it "cancels old pending proposals" do
    #   proposal = create(:proposal)
    #   Timecop.travel(Time.zone.now + 1.year) do
    #     cleaner = ExpiredRecordCleaner.new(Time.zone.now, ok_to_act: true)
    #     expect(cleaner.vacuum_old_proposals).to eq([proposal.id])
    #     expect(deliveries.length).to eq(1)
    #     proposal.reload
    #     expect(proposal.status).to eq("canceled")
    #   end
    # end
  end

  describe ".vacuum_proposal", :email do
    it "cleans up specific proposal" 

  end
end

