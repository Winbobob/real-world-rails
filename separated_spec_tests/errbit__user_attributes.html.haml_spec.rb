describe "notices/_user_attributes.html.haml", type: 'view' do
  describe 'autolink' do
    let(:notice) do
      user_attributes = { 'foo' => { 'bar' => 'http://example.com' } }
      Fabricate(:notice, user_attributes: user_attributes)
    end

    it "renders table with user attributes" 

  end
end

