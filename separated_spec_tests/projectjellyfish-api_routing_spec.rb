describe 'routing' do
  it 'routes to glob urls' 


  describe 'checks if page exists' do
    before :each do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production'))
    end

    it 'should not give a 404' 

  end
end

