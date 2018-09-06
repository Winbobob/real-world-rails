describe CampusSolutions::LinkController do
  context 'link feed' do
    let(:feed) { :get }

    it_behaves_like 'an unauthenticated user'

    context 'authenticated user' do
      let(:user_id) { '12345' }
      let(:feed_key) { 'link' }
      let(:url_id) { "UC_CX_APPOINTMENT_ADV_SETUP" }

      let(:placeholder_empl_id) { "Some placeholder text" }
      let(:placeholders) { {:EMPLID => placeholder_empl_id, :IGNORED_PLACEHOLDER => "not used"} }

      before { session['user_id'] = user_id }

      it 'returns empty feed when urlId param not specified' 


      it 'returns link feed with matching urlId' 


      it 'returns link feed with matching urlId and replaced "placeholder[name]" values' 


    end
  end
end

