describe ProblemDestroy do
  let(:problem_destroy) do
    ProblemDestroy.new(problem)
  end

  context "in unit way" do
    let(:problem) do
      problem = Problem.new
      allow(problem).to receive(:errs).and_return(double(:criteria, only: [err_1, err_2]))
      allow(problem).to receive(:comments).and_return(double(:criteria, only: [comment_1, comment_2]))
      allow(problem).to receive(:delete)
      problem
    end
    let(:err_1) { Err.new }
    let(:err_2) { Err.new }

    let(:comment_1) { Comment.new }
    let(:comment_2) { Comment.new }

    describe "#initialize" do
      it 'take a problem like args' 

    end

    describe "#execute" do
      it 'destroy the problem himself' 


      it 'delete all errs associate' 


      it 'delete all comments associate' 


      it 'delete all notice of associate to this errs' 

    end
  end

  context "in integration way" do
    let!(:problem) { Fabricate(:problem) }
    let!(:comment_1) { Fabricate(:comment, err: problem) }
    let!(:comment_2) { Fabricate(:comment, err: problem) }
    let!(:err_1) { Fabricate(:err, problem: problem) }
    let!(:err_2) { Fabricate(:err, problem: problem) }
    let!(:notice_1_1) { Fabricate(:notice, err: err_1) }
    let!(:notice_1_2) { Fabricate(:notice, err: err_1) }
    let!(:notice_2_1) { Fabricate(:notice, err: err_2) }
    let!(:notice_2_2) { Fabricate(:notice, err: err_2) }

    it 'should all destroy' 

  end
end

