describe FeedbackController, :type => :controller do

  describe "#new" do
    it "should render the new feedback form" 

  end

  describe '#create' do
    before do
      allow(ZendeskHelper).to receive(:send_feedback).once
    end

    let(:text) { 'feedback' }
    let(:model) { :feedback }

    let(:form_params) do
      { email: 'test@lol.biz.info',
          difficulty_feedback: text,
          improvement_feedback: 'y',
          satisfaction_feedback: 'z',
          help_feedback: 'a' }
    end

    def do_post
      post :create, feedback: form_params
    end

    include_examples 'redirect after form submission'

    it 'sends feedback to zendesk' 


    context 'with test text' do
      let(:text) { Feedback::TEST_TEXT }
      it 'does not send feedback' 

    end

    it 'should set the flash message' 

  end

end

