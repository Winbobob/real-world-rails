describe 'SummaryHelper', type: :helper  do

  before :each do
    helper.extend Haml
    helper.extend Haml::Helpers
    helper.send :init_haml_helpers
  end

  describe 'localization_key' do
    it 'creates key for locale file lookup' 

  end

  describe 'summary_id' do
    it 'creates attribute id' 


    context 'for date_served(3i)' do
      it 'creates attribute id without (3i)' 

    end
  end

  describe 'summary_label' do
    context 'for value in locale file' do
      it 'returns localized value' 

    end

    context 'for value not in locale file' do
      it 'returns humanized value' 

    end

    context 'for "deposit" "as_money"' do
      it 'returns localized value' 

    end

    context 'for date_served(3i)' do
      it 'returns localized value' 

    end
  end

  describe 'summary_value' do
    context 'for value in locale file' do
      it 'returns localized value' 

    end

    context 'for value not in locale file' do
      it 'returns value unaltered' 

    end
  end

  describe 'link_to_edit_section' do
    it 'returns link to section' 

  end

end

