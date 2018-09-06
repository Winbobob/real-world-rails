describe OutdatedProblemClearer do
  before do
    allow(Errbit::Config).to receive(:notice_deprecation_days).and_return(7)
  end

  let(:outdated_problem_clearer) do
    OutdatedProblemClearer.new
  end
  describe "#execute" do
    let!(:problems) do
      [
        Fabricate(:problem),
        Fabricate(:problem),
        Fabricate(:problem)
      ]
    end
    context 'without old problems' do
      it 'do nothing' 

      it 'not repair database' 

    end

    context "with old problems" do
      before do
        allow(Mongoid.default_client).to receive(:command).and_call_original
        allow(Mongoid.default_client).to receive(:command).with(repairDatabase: 1)
        problems.first.update(last_notice_at: Time.zone.at(946_684_800.0))
        problems.second.update(last_notice_at: Time.zone.at(946_684_800.0))
      end

      it 'deletes old problems' 


      it 'repair database' 

    end
  end
end

