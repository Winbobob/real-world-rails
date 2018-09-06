shared_examples "a notification email" do
  it "should have X-Mailer header" 


  it "should have X-Errbit-Host header" 


  it "should have Precedence header" 


  it "should have Auto-Submitted header" 


  it "should have X-Auto-Response-Suppress header" 


  it "should send the email" 

end

describe Mailer do
  context "Err Notification" do
    include EmailSpec::Helpers
    include EmailSpec::Matchers

    let(:notice) do
      n = Fabricate(:notice, message: "class < ActionController::Base")
      n.backtrace.lines.last[:file] = '[PROJECT_ROOT]/path/to/file.js'
      # notice.backtrace.update_attributes(lines: lines)
      n
    end

    let(:app) do
      a = notice.app
      a.update_attributes(
        asset_host:       "http://example.com",
        notify_all_users: true
      )
      a
    end
    let(:problem) do
      p = notice.problem
      p.notices_count = 3
      p
    end
    let!(:user) { Fabricate(:admin) }
    let(:error_report) do
      instance_double(
        'ErrorReport',
        notice:  notice,
        app:     app,
        problem: problem
      )
    end
    let(:email) do
      Mailer.err_notification(error_report).deliver_now
    end

    before { email }

    it_should_behave_like "a notification email"

    it "should html-escape the notice's message for the html part" 


    it "should have inline css" 


    it "should have links to source files" 


    it "should have the error count in the subject" 


    context 'with a very long message' do
      let(:notice)  { Fabricate(:notice, message: 6.times.collect { |_a| "0123456789" }.join('')) }
      it "should truncate the long message" 

    end
  end

  context "Comment Notification" do
    include EmailSpec::Helpers
    include EmailSpec::Matchers

    let!(:notice) { Fabricate(:notice) }
    let!(:comment) { Fabricate(:comment, err: notice.problem) }
    let!(:watcher) { Fabricate(:watcher, app: comment.app) }
    let(:recipients) { ['recipient@example.com', 'another@example.com'] }

    before do
      expect(comment).to receive(:notification_recipients).and_return(recipients)
      Fabricate(:notice, err: notice.err)
      @email = Mailer.comment_notification(comment).deliver_now
    end

    it "should be sent to comment notification recipients" 


    it "should have the notices count in the body" 


    it "should have the comment body" 

  end
end

