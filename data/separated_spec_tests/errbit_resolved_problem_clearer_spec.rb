describe ResolvedProblemClearer do
  let(:resolved_problem_clearer) do
    ResolvedProblemClearer.new
  end
  describe "#execute" do
    let!(:problems) do
      [
        Fabricate(:problem),
        Fabricate(:problem),
        Fabricate(:problem)
      ]
    end
    context 'without problem resolved' do
      it 'do nothing' 

      it 'not repair database' 

    end

    context "with problem resolve" do
      before do
        allow(Mongoid.default_client).to receive(:command).and_call_original
        allow(Mongoid.default_client).to receive(:command).with(repairDatabase: 1)
        problems.first.resolve!
        problems.second.resolve!
      end

      it 'delete problem resolve' 


      it 'repair database' 

    end
  end
end

