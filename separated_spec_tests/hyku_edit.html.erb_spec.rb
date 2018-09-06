RSpec.describe 'admin/groups/edit', type: :view do
  context 'groups index page' do
    let(:group) { FactoryGirl.create(:group) }

    before do
      allow(controller).to receive(:params).and_return(
        controller: 'admin/groups',
        action: 'edit',
        id: group.id
      )
      assign(:group, group)
      render
    end

    it 'has the "description" tab in an active state' 


    it 'has tabs for other actions on the group' 


    it 'has an input for name' 


    it 'has a text area for description' 


    it 'has a save button' 


    it 'has a cancel button' 

  end
end

