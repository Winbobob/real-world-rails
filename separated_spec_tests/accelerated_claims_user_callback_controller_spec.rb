describe UserCallbackController, :type => :controller do

  describe "#new" do
    it "should render the new feedback form" 

  end

  describe '#create' do
    let(:form_params) do
      { name: 'Mike Smith', phone: '02011112222', description: 'Please call me!' }
    end

    it 'sends feedback to zendesk' 


    let(:model) { :user_callback }

    include_examples 'redirect after form submission'
  end
end

