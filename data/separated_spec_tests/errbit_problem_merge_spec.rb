describe ProblemMerge do
  let(:problem) { Fabricate(:problem_with_errs) }
  let(:problem_1) { Fabricate(:problem_with_errs) }

  describe "#initialize" do
    it 'failed if less than 2 uniq problem pass in args' 


    it 'extract first problem like merged_problem' 

    it 'extract other problem like child_problems' 

  end

  describe "#merge" do
    let!(:problem_merge) do
      ProblemMerge.new(problem, problem_1)
    end
    let(:first_errs) { problem.errs }
    let(:merged_errs) { problem_1.errs }
    let!(:notice) { Fabricate(:notice, err: first_errs.first) }
    let!(:notice_1) { Fabricate(:notice, err: merged_errs.first) }

    it 'delete one of problem' 


    it 'move all err in one problem' 


    it 'keeps the issue link' 


    it 'update problem cache' 


    context "with problem with comment" do
      let!(:comment) { Fabricate(:comment, err: problem) }
      let!(:comment_2) { Fabricate(:comment, err: problem_1, user: comment.user) }
      it 'merge comment' 

    end
  end
end

