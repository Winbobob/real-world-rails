RSpec.describe "Editing a file:", type: :feature do
  let(:user) { create(:user) }
  let(:file_title) { 'Some kind of title' }
  let(:work) { build(:work, user: user) }
  let(:file_set) { create(:file_set, user: user, title: [file_title]) }
  let(:file) { File.open(fixture_path + '/images/world.png') }

  before do
    login_as(user, scope: :user)
    Hydra::Works::AddFileToFileSet.call(file_set, file, :original_file)
    work.ordered_members << file_set
    work.save!
  end

  context 'when the user tries to update file content, but forgets to select a file:' do
    it 'shows the edit page again' 

  end
end

