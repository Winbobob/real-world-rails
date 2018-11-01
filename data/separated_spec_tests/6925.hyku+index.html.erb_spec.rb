RSpec.describe 'admin/groups/index', type: :view do
  context 'groups index page' do
    let(:group_1) { FactoryBot.create(:group) }
    let(:group_2) { FactoryBot.create(:group) }
    let(:groups) { double('groups') }

    before do
      allow(groups).to receive(:each).and_yield(group_1).and_yield(group_2)
      allow(groups).to receive(:total_pages).and_return(1)
      allow(groups).to receive(:current_page).and_return(1)
      allow(groups).to receive(:limit_value).and_return(10)
      assign(:groups, groups)
      render
    end

    it 'reports the total number of groups' 


    it 'renders a list of accounts' 


    it 'has a button to create a new group' 


    it 'has a group search control' 


    it 'has a pagination select control' 

  end
end

