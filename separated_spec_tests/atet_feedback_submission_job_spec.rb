require 'rails_helper'

RSpec.describe FeedbackSubmissionJob, type: :job do
  describe '#perform' do
    let(:token) { 'rofltoken' }
    let(:url)   { 'https://rofldesk.lol.biz.info/api/v2' }
    let(:user)  { 'lol@example.com' }
    let(:id)    { 'L0L' }
    let(:feedback_submission_job) { FeedbackSubmissionJob.new }

    let(:map) do
      { 'ZENDESK_GROUP_ID' => id, 'ZENDESK_URL' => url, 'ZENDESK_USER' => user, 'ZENDESK_TOKEN' => token }
    end

    let(:body) do
      "{\"ticket\":{\"subject\":\"New ATET User Feedback\",\"comment\":{\"value" \
        "\":\"Comments\\n\\nlél\\n\\nSuggestions\\n\\nlewl\"},\"requester\":{" \
        "\"email\":\"hue@example.com\",\"name\":\"ET User\"},\"group_id\":\"L0L\"}}"
    end

    let(:headers) do
      { 'Accept' => 'application/json',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type' => 'application/json',
        'User-Agent' => 'ZendeskAPI API 1.5.1' }
    end

    let(:the_request) do
      stub_request(:post, "https://lol%40example.com%2Ftoken:rofltoken@rofldesk.lol.biz.info/api/v2/tickets")
    end

    before do
      allow(ENV).to receive(:fetch) { |arg| map[arg] }
      the_request
    end

    it 'creates a Zendesk ticket' 


    context 'without an email address' do
      before { body.gsub! 'hue@example.com', 'anonymous@example.com' }

      it 'uses a placeholder email' 

    end
  end
end

