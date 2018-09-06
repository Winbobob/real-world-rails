describe 'ApplicationHelper', type: :helper  do

  before :each do
    helper.extend Haml
    helper.extend Haml::Helpers
    helper.send :init_haml_helpers
  end

  describe 'section_header' do
    it 'creates h2 header with id and localized text' 

  end
  describe 'external_link' do
    it 'should have set alt text' 

  end
end

