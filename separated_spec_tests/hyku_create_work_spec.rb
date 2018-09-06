RSpec.describe 'Creating a new Work', :clean do
  let(:user) { create(:user) }

  before do
    AdminSet.find_or_create_default_admin_set_id
    login_as user, scope: :user
  end

  it 'creates the work' 

end

