RSpec.describe ProtipsHelper, type: :helper do
  describe '.protip_search_results_to_render' do
    it 'has no protips to render' 

  end

  describe '#users_background_image' do
    context 'user is logged in' do
      it 'returns #location_image_url_for @user' 

    end

    context 'user is not logged in' do
      it 'returns nil' 

    end

    context 'protip is set' do
      it 'returns #location_image_url_for @protip.user if @protip is not new_record' 


      it 'returns nil if @protip is new_record' 

    end

    context 'protip is not set' do
      it 'returns nil' 

    end
  end

end

