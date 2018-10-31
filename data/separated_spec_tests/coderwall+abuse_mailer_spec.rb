RSpec.describe AbuseMailer, type: :mailer do
  describe 'report_inappropriate' do

    let(:mail) { AbuseMailer.report_inappropriate(protip.to_param) }

    let!(:current_user) { Fabricate(:admin) }

    let(:protip) do
      Protip.create!(
        title: 'hello world',
        body: "somethings that's meaningful and nice",
        topic_list: %w(java javascript),
        user_id: current_user.id
      )
    end

    it 'renders the headers' 


    #Use capybara
    it 'renders the body', skip: 'FIX ME' 

  end
end

