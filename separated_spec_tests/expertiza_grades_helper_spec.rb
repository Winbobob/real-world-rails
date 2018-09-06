describe GradesHelper, type: :helper do
  describe 'get_accordion_title' do
    it 'should render is_first:true if last_topic is nil' 

    it 'should render is_first:false if last_topic is not equal to next_topic' 

    it 'should render nothing if last_topic is equal to next_topic' 

  end

  describe 'get_css_style_for_X_reputation' do
    hamer_input = [-0.1, 0, 0.5, 1, 1.5, 2, 2.1]
    lauw_input = [-0.1, 0, 0.2, 0.4, 0.6, 0.8, 0.9]
    output = %w[c1 c1 c2 c2 c3 c4 c5]
    it 'should return correct css for hamer reputations' 

    it 'should return correct css for luaw reputations' 

  end
end

