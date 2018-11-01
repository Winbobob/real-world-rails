describe FeedbackController, :email do
  describe '#create' do
    # it 'sends an email when feedback is submitted' do
    #   post :create, {
    #     bug: 'Yes',
    #     context: 'Some context here',
    #     expected: 'it to work',
    #     actually: 'it did not',
    #     comments: 'Comments here',
    #     satisfaction: '4',
    #     email: 'someone@example.com',
    #     referral: '/somewhere/else'
    #   }
    #   expect(deliveries.count).to be(1)
    #   expect(deliveries[0].body.to_s).to eq([
    #     "email: someone@example.com",
    #     "bug: Yes",
    #     "context: Some context here",
    #     "expected: it to work",
    #     "actually: it did not",
    #     "comments: Comments here",
    #     "satisfaction: 4",
    #     "referral: /somewhere/else"].join("\n"))
    #   expect(deliveries[0].from).to eq(['someone@example.com'])
    #   expect(deliveries[0].cc).to eq(['someone@example.com'])
    # end

    it "doesn't include extra fields" 


    it "doesn't include blank fields" 


    it "includes user if signed in" 

  end
end

