describe "problems/index.html.haml", type: 'view' do
  let(:problem_1) { Fabricate(:problem) }
  let(:problem_2) { Fabricate(:problem, app: problem_1.app) }

  before do
    allow(view).to receive(:selected_problems).and_return([])
    allow(view).to receive(:all_errs).and_return(false)
    allow(view).to receive(:problems).and_return(
      Kaminari.paginate_array([problem_1, problem_2]).page(1).per(10)
    )
    allow(view).to receive(:params_sort).and_return('last_notice_at')
    allow(view).to receive(:params_order).and_return('asc')
    allow(controller).to receive(:current_user).and_return(Fabricate(:user))
  end

  describe "with problem" do
    before { problem_1 && problem_2 }

    it 'should works' 

  end

  describe "show/hide resolved button behavior" do
    it "displays unresolved errors title and button" 


    it "displays all errors title and button" 

  end
end

