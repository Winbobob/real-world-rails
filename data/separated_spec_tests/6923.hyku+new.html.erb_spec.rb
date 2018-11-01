RSpec.describe 'admin/groups/new', type: :view do
  context 'groups index page' do
    let(:group) { FactoryBot.build(:group) }

    before do
      assign(:group, group)
      render
    end

    it 'has the "description" tab in an active state' 


    it 'has disable tabs for actions that require a group to have been created' 


    it 'has an input for name' 


    it 'has a text area for description' 


    it 'has a save button' 


    it 'has a cancel button' 

  end
end

