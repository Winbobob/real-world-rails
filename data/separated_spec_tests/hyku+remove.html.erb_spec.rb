RSpec.describe 'admin/groups/remove', type: :view do
  context 'groups index page' do
    let(:group) { FactoryBot.create(:group) }

    before do
      allow(controller).to receive(:params).and_return(
        controller: 'admin/groups',
        action: 'remove',
        id: group.id
      )
      assign(:group, group)
      render
    end

    it 'has the "Remove" tab in an active state' 


    it 'has tabs for other actions on the group' 


    it 'has a delete button' 

  end
end

