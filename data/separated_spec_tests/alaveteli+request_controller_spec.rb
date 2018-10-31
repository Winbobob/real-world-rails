# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RequestController, "when listing recent requests" do
  before(:each) do
    load_raw_emails_data
    get_fixtures_xapian_index
  end

  it "should be successful" 


  it "should render with 'list' template" 


  it "should return 404 for pages we don't want to serve up" 


  it "returns 404 for non html requests" 


  it 'should not raise an error for a page param of less than zero, but should treat it as
        a param of 1' do
    expect{ get :list, :view => 'all', :page => "-1" }.not_to raise_error
    expect(assigns[:page]).to eq(1)
  end

end

describe RequestController, "when showing one request" do
  render_views

  before(:each) do
    load_raw_emails_data
  end

  it "should be successful" 


  it "should render with 'show' template" 


  it "should assign the request" 


  it "should redirect from a numeric URL to pretty one" 


  it 'should return a 404 for GET requests to a malformed request URL' 


  describe "redirecting pro users to the pro context" do
    let(:pro_user) { FactoryBot.create(:pro_user) }

    context "when showing pros their own requests" do
      context "when the request is embargoed" do
        let(:info_request) do
          FactoryBot.create(:embargoed_request, user: pro_user)
        end

        it "should always redirect to the pro version of the page" 

      end

      context "when the request is not embargoed" do
        let(:info_request) do
          FactoryBot.create(:info_request, user: pro_user)
        end

        it "should not redirect to the pro version of the page" 

      end
    end

    context 'when a cancelled pro views their embargoed request' do

      before do
        pro_user.remove_role(:pro)
      end

      let(:info_request) do
        FactoryBot.create(:embargoed_request, user: pro_user)
      end

      it 'redirects to the pro version of the page' 


      it 'uses the pro livery' 

    end

    context "when showing pros a someone else's request" do
      it "should not redirect to the pro version of the page" 

    end
  end

  context 'when the request is embargoed' do
    it 'raises ActiveRecord::RecordNotFound' 


    it "doesn't even redirect from a numeric id" 

  end

  describe 'when showing an external request' do
    describe 'when viewing anonymously' do
      it 'should be successful' 

    end

    describe 'when the request is being viewed by an admin' do
      def make_request
        get :show, { :url_title => 'balalas' }, { :user_id => users(:admin_user).id }
      end

      it 'should be successful' 

    end
  end

  describe 'when handling an update_status parameter' do

    describe 'when the request is external' do

      it 'should assign the "update status" flag to the view as falsey if the parameter is present' 


      it 'should assign the "update status" flag to the view as falsey if the parameter is not present' 


    end

    it 'should assign the "update status" flag to the view as truthy if the parameter is present' 


    it 'should assign the "update status" flag to the view as falsey if the parameter is not present' 


    it 'should require login' 


    it 'should work if logged in as the requester' 


    it 'should not work if logged in as not the requester' 


    it 'should work if logged in as an admin user' 

  end

  describe 'when params[:pro] is true and a pro user is logged in' do
    let(:pro_user) { FactoryBot.create(:pro_user) }

    before :each do
      session[:user_id] = pro_user.id
      get :show, :url_title => 'why_do_you_have_such_a_fancy_dog', pro: "1"
    end

    it "should set @in_pro_area to true" 


    it "should set @sidebar_template to the pro sidebar" 

  end

  describe 'when params[:pro] is not set' do
    before :each do
      get :show, :url_title => 'why_do_you_have_such_a_fancy_dog'
    end

    it "should set @in_pro_area to false" 


    it "should set @sidebar_template to the normal sidebar" 

  end

  describe "@show_top_describe_state_form" do
    let(:pro_user) { FactoryBot.create(:pro_user) }
    let(:pro_request) { FactoryBot.create(:embargoed_request, user: pro_user) }

    context "when @in_pro_area is true" do
      it "is false" 

    end

    context "when @in_pro_area is false" do
      context "and @update_status is false" do
        it "is false" 


        context "but the request is awaiting_description" do
          it "is true" 

        end
      end

      context "and @update_status is true" do
        it "is true" 


        context "and the request is awaiting_description" do
          it "is true" 

        end
      end
    end

    context "when there are no valid state transitions" do
      it "is false" 

    end
  end

  describe "@show_bottom_describe_state_form" do
    let(:pro_user) { FactoryBot.create(:pro_user) }
    let(:pro_request) { FactoryBot.create(:embargoed_request, user: pro_user) }

    context "when @in_pro_area is true" do
      it "is false" 

    end

    context "when @in_pro_area is false" do
      context "and the request is awaiting_description" do
        it "is true" 

      end

      context "and the request is not awaiting_description" do
        it "is false" 

      end
    end

    context "when there are no valid state transitions" do
      it "is false" 

    end
  end

  it "should set @state_transitions for the request" 


  describe "showing update status actions" do
    let(:user) { FactoryBot.create(:user) }

    before do
      session[:user_id] = user.id
    end

    context "when the request is old and unclassified" do
      let(:info_request) { FactoryBot.create(:old_unclassified_request) }

      it "@show_owner_update_status_action should be false" 


      it "@show_other_user_update_status_action should be true" 

    end

    context "when the request is not old and unclassified" do
      let(:info_request) { FactoryBot.create(:info_request) }

      it "@show_owner_update_status_action should be true" 


      it "@show_other_user_update_status_action should be false" 

    end

    context "when there are no state_transitions" do
      let(:info_request) { FactoryBot.create(:info_request) }

      before do
        info_request.set_described_state('not_foi')
      end

      it "should hide all status update options" 

    end
  end
end

describe RequestController do
  describe 'GET get_attachment' do

    let(:info_request){ FactoryBot.create(:info_request_with_incoming_attachments) }

    def get_attachment(params = {})
      default_params = { :incoming_message_id =>
                           info_request.incoming_messages.first.id,
                         :id => info_request.id,
                         :part => 2,
                         :file_name => 'interesting.pdf' }
      get :get_attachment, default_params.merge(params)
    end

    it 'should cache an attachment on a request with normal prominence' 


    # This is a regression test for a bug where URLs of this form were causing 500 errors
    # instead of 404s.
    #
    # (Note that in fact only the integer-prefix of the URL part is used, so there are
    # *some* “ugly URLs containing a request id that isn't an integer” that actually return
    # a 200 response. The point is that IDs of this sort were triggering an error in the
    # error-handling path, causing the wrong sort of error response to be returned in the
    # case where the integer prefix referred to the wrong request.)
    #
    # https://github.com/mysociety/alaveteli/issues/351
    it "should return 404 for ugly URLs containing a request id that isn't an integer" 


    it "should return 404 when incoming message and request ids
        don't match" do
      expect { get_attachment(:id => info_request.id + 1) }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    it "should return 404 for ugly URLs contain a request id that isn't an
        integer, even if the integer prefix refers to an actual request" do
      ugly_id = "#{FactoryBot.create(:info_request).id}95"
      expect { get_attachment(:id => ugly_id) }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    it "should redirect to the incoming message if there's a wrong part number
        and an ambiguous filename" do
      incoming_message = info_request.incoming_messages.first
      attachment = IncomingMessage.get_attachment_by_url_part_number_and_filename(
        incoming_message.get_attachments_for_display,
        5,
        'interesting.pdf'
      )
      expect(attachment).to be_nil
      get_attachment(:part => 5)
      expect(response.status).to eq(303)
      new_location = response.header['Location']
      expect(new_location)
        .to match incoming_message_path(incoming_message)
    end

    it "should find a uniquely named filename even if the URL part number was wrong" 


    it "should not download attachments with wrong file name" 


    it "should sanitise HTML attachments" 


    it "censors attachments downloaded directly" 


    it "should censor with rules on the user (rather than the request)" 


    it 'returns an ActiveRecord::RecordNotFound error for an embargoed request' 

  end
end

describe RequestController do
  describe 'GET get_attachment_as_html' do
    let(:info_request){ FactoryBot.create(:info_request_with_incoming_attachments) }

    def get_html_attachment(params = {})
      default_params = { :incoming_message_id =>
                           info_request.incoming_messages.first.id,
                         :id => info_request.id,
                         :part => 2,
                         :file_name => 'interesting.pdf.html' }
      get :get_attachment_as_html, default_params.merge(params)
    end

    it "should return 404 for ugly URLs containing a request id that isn't an integer" 


    it "should return 404 for ugly URLs contain a request id that isn't an
        integer, even if the integer prefix refers to an actual request" do
      ugly_id = "#{FactoryBot.create(:info_request).id}95"
      expect { get_html_attachment(:id => ugly_id) }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns an ActiveRecord::RecordNotFound error for an embargoed request' 


  end
end

describe RequestController, "when handling prominence" do

  def expect_hidden(hidden_template)
    expect(response.content_type).to eq("text/html")
    expect(response).to render_template(hidden_template)
    expect(response.code).to eq('403')
  end

  context 'when the request is hidden' do

    before(:each) do
      @info_request = FactoryBot.create(:info_request_with_incoming_attachments,
                                        :prominence => 'hidden')
    end

    it "should not show request if you're not logged in" 


    it "should not show request even if logged in as their owner" 


    it 'should not show request if requested using json' 


    it "should show request if logged in as super user" 


    it "should not download attachments" 


    it 'should not generate an HTML version of an attachment for a request whose prominence
            is hidden even for an admin but should return a 404' do
      session[:user_id] = FactoryBot.create(:admin_user).id
      incoming_message = @info_request.incoming_messages.first
      expect do
        get :get_attachment_as_html, :incoming_message_id => incoming_message.id,
          :id => @info_request.id,
          :part => 2,
          :file_name => 'interesting.pdf'
      end.to raise_error(ActiveRecord::RecordNotFound)
    end

  end

  context 'when the request is requester_only' do

    before(:each) do
      @info_request = FactoryBot.create(:info_request_with_incoming_attachments,
                                        :prominence => 'requester_only')
    end

    it "should not show request if you're not logged in" 


    it "should not show request if logged in but not the requester" 


    it "should show request to requester" 


    it "shouild show request to admin" 


    it 'should not cache an attachment when showing an attachment to the requester' 


    it 'should not cache an attachment when showing an attachment to the admin' 

  end

  context 'when the incoming message has prominence hidden' do

    before(:each) do
      @incoming_message = FactoryBot.create(:incoming_message_with_attachments,
                                            :prominence => 'hidden')
      @info_request = @incoming_message.info_request
    end

    it "should not download attachments for a non-logged in user" 


    it 'should not download attachments for the request owner' 


    it 'should download attachments for an admin user' 


    it 'should not generate an HTML version of an attachment for a request whose prominence
            is hidden even for an admin but should return a 404' do
      session[:user_id] = FactoryBot.create(:admin_user).id
      expect do
        get :get_attachment_as_html, :incoming_message_id => @incoming_message.id,
          :id => @info_request.id,
          :part => 2,
          :file_name => 'interesting.pdf',
          :skip_cache => 1
      end.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'should not cache an attachment when showing an attachment to the requester or admin' 


  end

  context 'when the incoming message has prominence requester_only' do

    before(:each) do
      @incoming_message = FactoryBot.create(:incoming_message_with_attachments,
                                            :prominence => 'requester_only')
      @info_request = @incoming_message.info_request
    end

    it "should not download attachments for a non-logged in user" 


    it 'should download attachments for the request owner' 


    it 'should download attachments for an admin user' 


    it 'should not generate an HTML version of an attachment for a request whose prominence
            is hidden even for an admin but should return a 404' do
      session[:user_id] = FactoryBot.create(:admin_user).id
      expect do
        get :get_attachment_as_html, :incoming_message_id => @incoming_message.id,
          :id => @info_request.id,
          :part => 2,
          :file_name => 'interesting.pdf',
          :skip_cache => 1
      end.to raise_error(ActiveRecord::RecordNotFound)
    end

  end

end

# TODO: do this for invalid ids
#  it "should render 404 file" do
#    response.should render_template("#{Rails.root}/public/404.html")
#    response.headers["Status"].should == "404 Not Found"
#  end

describe RequestController, "when searching for an authority" do
  # Whether or not sign-in is required for this step is configurable,
  # so we make sure we're logged in, just in case
  before do
    @user = users(:bob_smith_user)
    get_fixtures_xapian_index
  end

  it "should return matching bodies" 


  it "remembers the search params" 


  describe 'when params[:pro] is true' do
    context "and a pro user is logged in " do
      let(:pro_user) { FactoryBot.create(:pro_user) }

      before do
        session[:user_id] = pro_user.id
      end

      it "should set @in_pro_area to true" 


      it "should not redirect pros to the info request form for pros" 

    end

    context "and a pro user is not logged in" do
      before do
        session[:user_id] = nil
      end

      it "should set @in_pro_area to false" 


      it "should not redirect users to the info request form for pros" 

    end
  end

  describe 'when params[:pro] is not set' do
    it "should set @in_pro_area to false" 


    it "should redirect pros to the info request form for pros" 

  end
end

describe RequestController, "when creating a new request" do
  render_views

  before do
    @user = users(:bob_smith_user)
    @body = public_bodies(:geraldine_public_body)
  end

  it "should redirect to front page if no public body specified" 


  it "should redirect to front page if no public body specified, when logged in" 


  it "should redirect 'bad request' page when a body has no email address" 


  context "the outgoing message includes an email address" do

    context "there is no logged in user" do

      it "displays a flash error message without escaping the HTML" 


    end

    context "the user is logged in" do

      it "displays a flash error message without escaping the HTML" 


    end

  end

  context "the outgoing message includes a postcode" do

    it 'displays an error message warning about the postcode' 


  end

  it "should redirect pros to the pro version" 


  it "should accept a public body parameter" 


  it 'assigns a default text for the request' 


  it 'allows the default text to be set via the default_letter param' 


  it 'should display one meaningful error message when no message body is added' 


  it "should give an error and render 'new' template when a summary isn't given" 


  it "should redirect to sign in page when input is good and nobody is logged in" 


  it 'redirects to the frontpage if the action is sent the invalid
        public_body param' do
    post :new, :info_request => { :public_body => @body.id,
                                  :title => 'Why Geraldine?',
    :tag_string => '' },
      :outgoing_message => { :body => 'This is a silly letter.' },
      :submitted_new_request => 1,
      :preview => 1
    expect(response).to redirect_to frontpage_url
  end

  it "should show preview when input is good" 


  it "should allow re-editing of a request" 


  it "re-editing preserves the message body" 


  it "should create the request and outgoing message, and send the outgoing message by email, and redirect to request page when input is good and somebody is logged in" 


  it "sets the request_sent flash to true if successful" 


  it "should give an error if the same request is submitted twice" 


  it "should let you submit another request with the same title" 


  it 'should respect the rate limit' 


  it 'should ignore the rate limit for specified users' 


  describe 'when rendering a reCAPTCHA' do

    context 'when new_request_recaptcha disabled' do

      before do
        allow(AlaveteliConfiguration).to receive(:new_request_recaptcha)
          .and_return(false)
      end

      it 'sets render_recaptcha to false' 

    end

    context 'when new_request_recaptcha is enabled' do

      before do
        allow(AlaveteliConfiguration).to receive(:new_request_recaptcha)
          .and_return(true)
      end

      it 'sets render_recaptcha to true if there is no logged in user' 


      it 'sets render_recaptcha to true if there is a logged in user who is not
            confirmed as not spam' do
        session[:user_id] =
          FactoryBot.create(:user, :confirmed_not_spam => false).id
        post :new, :info_request => { :public_body_id => @body.id,
          :title => "What's black and white and red all over?", :tag_string => "" },
          :outgoing_message => { :body => "Please send info" },
          :submitted_new_request => 1, :preview => 0
        expect(assigns[:render_recaptcha]).to eq(true)
      end

      it 'sets render_recaptcha to false if there is a logged in user who is
            confirmed as not spam' do
        session[:user_id] = FactoryBot.create(:user,
                                              :confirmed_not_spam => true).id
        post :new, :info_request => { :public_body_id => @body.id,
          :title => "What's black and white and red all over?", :tag_string => "" },
          :outgoing_message => { :body => "Please send info" },
          :submitted_new_request => 1, :preview => 0
        expect(assigns[:render_recaptcha]).to eq(false)
      end

      context 'when the reCAPTCHA information is not correct' do

        before do
          allow(controller).to receive(:verify_recaptcha).and_return(false)
        end

        let(:user) { FactoryBot.create(:user,
                                      :confirmed_not_spam => false) }
        let(:body) { FactoryBot.create(:public_body) }

        it 'shows an error message' 


        it 'renders the compose interface' 


        it 'allows the request if the user is confirmed not spam' 


      end

    end

  end

  context 'when the request subject line looks like spam' do

    let(:user) { FactoryBot.create(:user,
                                   :confirmed_not_spam => false) }
    let(:body) { FactoryBot.create(:public_body) }


    context 'when given a string containing unicode characters' do

      it 'converts the string to ASCII' 


    end

    context 'when enable_anti_spam is false and block_spam_requests is true' do
      # double check that block_spam_subject? is behaving as expected
      before do
        allow(AlaveteliConfiguration).to receive(:enable_anti_spam).
          and_return(false)
        allow(AlaveteliConfiguration).to receive(:block_spam_requests).
          and_return(true)
      end

      it 'sends an exception notification' 


    end

    context 'when block_spam_subject? is true' do

      before do
        allow(@controller).to receive(:block_spam_subject?).and_return(true)
      end

      it 'sends an exception notification' 


      it 'shows an error message' 


      it 'renders the compose interface' 


      it 'allows the request if the user is confirmed not spam' 


    end

    context 'when block_spam_subject? is false' do

      before do
        allow(@controller).to receive(:block_spam_subject?).and_return(false)
      end

      it 'sends an exception notification' 


      it 'allows the request' 


    end

  end

  describe 'when the request is from an IP address in a blocked country' do

    let(:user) { FactoryBot.create(:user,
                                   :confirmed_not_spam => false) }
    let(:body) { FactoryBot.create(:public_body) }

    before do
      allow(AlaveteliConfiguration).to receive(:restricted_countries).and_return('PH')
      allow(controller).to receive(:country_from_ip).and_return('PH')
    end

    context 'when block_restricted_country_ips? is true' do

      before do
        allow(@controller).
          to receive(:block_restricted_country_ips?).and_return(true)
      end

      it 'sends an exception notification' 


      it 'shows an error message' 


      it 'renders the compose interface' 


      it 'allows the request if the user is confirmed not spam' 


    end

    context 'when block_restricted_country_ips? is false' do

      before do
        allow(@controller).
          to receive(:block_restricted_country_ips?).and_return(false)
      end

      it 'sends an exception notification' 


      it 'allows the request' 


    end

  end

end

# These go with the previous set, but use mocks instead of fixtures.
# TODO harmonise these
describe RequestController, "when making a new request" do

  before do
    @user = mock_model(User, :id => 3481, :name => 'Testy')
    allow(@user).to receive(:get_undescribed_requests).and_return([])
    allow(@user).to receive(:can_file_requests?).and_return(true)
    allow(@user).to receive(:locale).and_return("en")
    allow(User).to receive(:find).and_return(@user)
    @body = FactoryBot.create(:public_body, :name => 'Test Quango')
  end

  it "should allow you to have one undescribed request" 


  it "should fail if more than one request undescribed" 


  it "should fail if user is banned" 


end

describe RequestController do
  describe "POST describe_state" do
    describe 'if the request is external' do

      let(:external_request){ FactoryBot.create(:external_request) }

      it 'should redirect to the request page' 


    end

    describe 'when the request is internal' do

      let(:info_request){ FactoryBot.create(:info_request) }

      def post_status(status, info_request)
        patch :describe_state, :incoming_message => { :described_state => status },
          :id => info_request.id,
          :last_info_request_event_id => info_request.last_event_id_needing_description
      end

      context 'when the request is embargoed' do

        let(:info_request){ FactoryBot.create(:embargoed_request) }

        it 'should raise ActiveRecord::NotFound' 

      end

      it "should require login" 


      it "should not classify the request if logged in as the wrong user" 


      describe 'when the request is old and unclassified' do

        let(:info_request){ FactoryBot.create(:old_unclassified_request)}

        describe 'when the user is not logged in' do

          it 'should require login' 


        end

        describe 'when the user is logged in as a different user' do

          let(:other_user){ FactoryBot.create(:user) }

          before do
            session[:user_id] = other_user.id
          end

          it 'should classify the request' 


          it 'should log a status update event' 


          it 'should send an email to the requester letting them know someone
              has updated the status of their request' do
            post_status('rejected', info_request)
            deliveries = ActionMailer::Base.deliveries
            expect(deliveries.size).to eq(1)
            expect(deliveries.first.subject)
              .to match("Someone has updated the status of your request")
          end

          it 'should redirect to the request page' 


          it 'should show a message thanking the user for a good deed' 


          context "playing the classification game" do
            before :each do
              session[:request_game] = true
            end

            it "should continue the game after classifying a request" 


            it 'shows a message thanking the user for a good deed' 

          end

          context 'when the new status is "requires_admin"' do
            it "should send a mail to admins saying that the response requires admin
               and one to the requester noting the status change" do
              patch :describe_state, :incoming_message =>
                                      { :described_state => "requires_admin",
                                        :message => "a message" },
                                    :id => info_request.id,
                                    :incoming_message_id =>
                                      info_request.incoming_messages.last,
                                    :last_info_request_event_id =>
                                      info_request.last_event_id_needing_description

              deliveries = ActionMailer::Base.deliveries
              expect(deliveries.size).to eq(2)
              requires_admin_mail = deliveries.first
              status_update_mail = deliveries.second
              expect(requires_admin_mail.subject)
                .to match(/FOI response requires admin/)
              expect(requires_admin_mail.to)
                .to match([AlaveteliConfiguration::contact_email])
              expect(status_update_mail.subject)
                .to match('Someone has updated the status of your request')
              expect(status_update_mail.to)
                .to match([info_request.user.email])
            end

            context "if the params don't include a message" do

              it 'redirects to the message url' 


            end
          end
        end
      end

      describe 'when logged in as an admin user who is not the actual requester' do

        let(:admin_user){ FactoryBot.create(:admin_user) }
        let(:info_request){ FactoryBot.create(:info_request) }

        before do
          session[:user_id] = admin_user.id
        end

        it 'should update the status of the request' 


        it 'should log a status update event' 


        it 'should record a classification' 


        it 'should send an email to the requester letting them know someone has
            updated the status of their request' do
          mail_mock = double("mail")
          allow(mail_mock).to receive :deliver_now
          expect(RequestMailer).to receive(:old_unclassified_updated).and_return(mail_mock)
          post_status('rejected', info_request)
        end

        it 'should redirect to the request page' 


        it 'should show a message thanking the user for a good deed' 

      end

      describe 'when logged in as an admin user who is also the actual requester' do

        let(:admin_user){ FactoryBot.create(:admin_user) }
        let(:info_request){ FactoryBot.create(:info_request, :user => admin_user) }

        before do
          session[:user_id] = admin_user.id
        end

        it 'should update the status of the request' 


        it 'should log a status update event' 


        it 'should not send an email to the requester letting them know someone
            has updated the status of their request' do
          expect(RequestMailer).not_to receive(:old_unclassified_updated)
          post_status('rejected', info_request)
        end

        it 'should show advice for the new state' 


        it 'should redirect to the unhappy page' 


      end

      describe 'when logged in as the requestor' do

        let(:info_request) do
          FactoryBot.create(:info_request, :awaiting_description => true)
        end

        before do
          session[:user_id] = info_request.user_id
        end

        it "should let you know when you forget to select a status" 


        it "should not change the status if the request has changed while viewing it" 


        it "should successfully classify response" 


        it 'should log a status update event' 


        it 'should not send an email to the requester letting them know someone
            has updated the status of their request' do
          expect(RequestMailer).not_to receive(:old_unclassified_updated)
          post_status('rejected', info_request)
        end

        it "should go to the page asking for more information when classified
            as requires_admin" do
          patch :describe_state,
            :incoming_message => { :described_state => "requires_admin" },
            :id => info_request.id,
            :incoming_message_id => info_request.incoming_messages.last,
            :last_info_request_event_id => info_request.last_event_id_needing_description
          expect(response)
            .to redirect_to describe_state_message_url(:url_title => info_request.url_title,
                                                       :described_state => "requires_admin")

          info_request.reload
          expect(info_request.described_state).not_to eq('requires_admin')
          expect(ActionMailer::Base.deliveries).to be_empty
        end

        context "message is included when classifying as requires_admin" do
          it "should send an email including the message" 

        end

        it 'should show advice for the new state' 


        it 'should redirect to the unhappy page' 


        it "knows about extended states" 

      end

      describe 'after a successful status update by the request owner' do

        render_views

        let(:info_request){ FactoryBot.create(:info_request) }

        before do
          session[:user_id] = info_request.user_id
        end

        def expect_redirect(status, redirect_path)
          post_status(status, info_request)
          expect(response).
            to redirect_to("http://" + "test.host/#{redirect_path}".squeeze("/"))
        end

        context 'when status is updated to "waiting_response"' do

          it 'should redirect to the "request url" with a message in the right tense when
              the response is not overdue' do
            expect_redirect("waiting_response",
                            show_request_path(info_request.url_title))
            expect(flash[:notice][:partial]).
                to eq('request/describe_notices/waiting_response')
          end

          it 'should redirect to the "request url" with a message in the right tense when
              the response is overdue' do
            # Create the request with today's date
            info_request
            time_travel_to(info_request.date_response_required_by + 2.days) do
              expect_redirect('waiting_response',
                              show_request_path(info_request.url_title))
              expect(flash[:notice][:partial]).
                to eq('request/describe_notices/waiting_response_overdue')
            end
          end

          it 'should redirect to the "request url" with a message in the right tense when
              response is very overdue' do
            # Create the request with today's date
            info_request
            time_travel_to(info_request.date_very_overdue_after + 2.days) do
              expect_redirect('waiting_response',
                              help_unhappy_path(info_request.url_title))
              expect(flash[:notice][:partial]).
                to eq('request/describe_notices/waiting_response_very_overdue')
            end
          end
        end

        context 'when status is updated to "not held"' do

          it 'should redirect to the "request url"' 


        end

        context 'when status is updated to "successful"' do

          it 'should redirect to the "request url"' 


          it 'should show a message' 


        end

        context 'when status is updated to "waiting clarification"' do

          context 'when there is a last response' do

            let(:info_request){ FactoryBot.create(:info_request_with_incoming) }

            it 'should redirect to the "response url"' 


          end

          context 'when there are no events needing description' do
            it 'should redirect to the "followup no incoming url"' 

          end

        end

        context 'when status is updated to "rejected"' do

          it 'should redirect to the "unhappy url"' 


        end

        context 'when status is updated to "partially successful"' do

          it 'should redirect to the "unhappy url"' 


        end

        context 'when status is updated to "gone postal"' do

          let(:info_request){ FactoryBot.create(:info_request_with_incoming) }

          it 'should redirect to the "respond to last" url' 


        end

        context 'when status updated to "internal review"' do

          it 'should redirect to the "request url"' 


        end

        context 'when status is updated to "requires admin"' do

          it 'should redirect to the "request url"' 


        end

        context 'when status is updated to "error message"' do

          it 'should redirect to the "request url"' 


          context "if the params don't include a message" do

            it 'redirects to the message url' 


          end

        end

        context 'when status is updated to "user_withdrawn"' do

          let(:info_request){ FactoryBot.create(:info_request_with_incoming) }

          it 'should redirect to the "respond to last" url' 


        end

      end
    end
  end
end

describe RequestController, "when viewing comments" do
  render_views
  before(:each) do
    load_raw_emails_data
  end

  it "should link to the user who submitted it" 


  it "should link to the user who submitted to it, even if it is you" 


end


describe RequestController, "authority uploads a response from the web interface" do

  before(:each) do
    # domain after the @ is used for authentication of FOI officers, so to test it
    # we need a user which isn't at localhost.
    @normal_user = User.new(:name => "Mr. Normal", :email => "normal-user@flourish.org",
                            :password => PostRedirect.generate_random_token)
    @normal_user.save!

    @foi_officer_user = User.new(:name => "The Geraldine Quango", :email => "geraldine-requests@localhost",
                                 :password => PostRedirect.generate_random_token)
    @foi_officer_user.save!
  end

  context 'when the request is embargoed' do
    let(:embargoed_request){ FactoryBot.create(:embargoed_request)}

    it 'raises an ActiveRecord::RecordNotFound error' 


  end

  it "should require login to view the form to upload" 


  it "should let you view upload form if you are an FOI officer" 


  it "should prevent uploads if you are not a requester" 


  it "should prevent entirely blank uploads" 


  it 'should 404 for non existent requests' 


  # How do I test a file upload in rails?
  # http://stackoverflow.com/questions/1178587/how-do-i-test-a-file-upload-in-rails
  it "should let the authority upload a file" 

end

describe RequestController, "when showing JSON version for API" do
  before(:each) do
    load_raw_emails_data
  end

  it "should return data in JSON form" 


end

describe RequestController, "when doing type ahead searches" do

  before :each do
    get_fixtures_xapian_index
  end

  it 'can filter search results by public body' 


  it 'defaults to 25 results per page' 


  it 'can limit the number of searches returned' 


end

describe RequestController, "when showing similar requests" do

  before do
    get_fixtures_xapian_index
    load_raw_emails_data
  end

  let(:badger_request){ info_requests(:badger_request) }

  it "renders the 'similar' template" 


  it 'assigns the request' 


  it "assigns a xapian object with similar requests" 


  it "raises ActiveRecord::RecordNotFound for non-existent paths" 


  it "raises ActiveRecord::RecordNotFound for pages beyond the last
      page we want to show" do
    expect {
      get :similar, :url_title => badger_request.url_title, :page => 100
    }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'raises ActiveRecord::RecordNotFound if the request is embargoed' 


end

describe RequestController, "when caching fragments" do
  it "should not fail with long filenames" 


end

describe RequestController, "#new_batch" do

  context "when batch requests is enabled" do

    before do
      allow(AlaveteliConfiguration).to receive(:allow_batch_requests).and_return(true)
    end

    context "when the current user can make batch requests" do

      before do
        @user = FactoryBot.create(:user, :can_make_batch_requests => true)
        @public_body = FactoryBot.create(:public_body)
        @other_public_body = FactoryBot.create(:public_body)
        @public_body_ids = [@public_body.id, @other_public_body.id]
        @default_post_params = { :info_request => { :title => "What does it all mean?",
                                                    :tag_string => "" },
                                 :public_body_ids => @public_body_ids,
                                 :outgoing_message => { :body => "This is a silly letter." },
                                 :submitted_new_request => 1,
                                 :preview => 1 }
      end

      it 'should be successful' 


      it 'should render the "new" template' 


      it 'should redirect to "select_authorities" if no public_body_ids param is passed' 


      it "should render 'preview' when given a good title and body" 


      it "should give an error and render 'new' template when a summary isn't given" 


      it "should allow re-editing of a request" 


      it "re-editing preserves the message body" 


      context "on success" do

        def make_request
          @params = @default_post_params.merge(:preview => 0)
          post :new_batch, @params, { :user_id => @user.id }
        end

        it 'should create an info request batch and redirect to the new batch on success' 


        it 'should prevent double submission of a batch request' 


        it 'sets the batch_sent flash to true' 


      end

      context "when the user is banned" do

        before do
          @user.ban_text = "bad behaviour"
          @user.save!
        end

        it 'should show the "banned" template' 


      end

    end

    context "when the current user can't make batch requests" do

      render_views

      before do
        @user = FactoryBot.create(:user)
      end

      it 'should return a 403 with an appropriate message' 


    end

    context 'when there is no logged-in user' do

      it 'should return a redirect to the login page' 

    end


  end

  context "when batch requests is not enabled" do

    it 'should return a 404' 


  end

end

describe RequestController, "#select_authorities" do

  context "when batch requests is enabled" do

    before do
      get_fixtures_xapian_index
      load_raw_emails_data
      allow(AlaveteliConfiguration).to receive(:allow_batch_requests).and_return(true)
    end

    context "when the current user can make batch requests" do

      before do
        @user = FactoryBot.create(:user, :can_make_batch_requests => true)
      end

      context 'when asked for HTML' do

        it 'should be successful' 


        it 'recognizes a GET request' 


        it 'recognizes a POST request' 


        it 'should render the "select_authorities" template' 


        it 'should assign a list of search results to the view if passed a query' 


        it 'should assign a list of public bodies to the view if passed a list of ids' 


        it 'should subtract a list of public bodies to remove from the list of bodies assigned to
                    the view' do
          get :select_authorities, {:public_body_ids => [public_bodies(:humpadink_public_body).id,
                                                         public_bodies(:geraldine_public_body).id],
          :remove_public_body_ids => [public_bodies(:geraldine_public_body).id]},
            {:user_id => @user.id}
          expect(assigns[:public_bodies].size).to eq(1)
          expect(assigns[:public_bodies][0].name).to eq(public_bodies(:humpadink_public_body).name)
        end

      end

      context 'when asked for JSON' do

        it 'should be successful' 


        it 'should return a list of public body names and ids' 


        it 'should return an empty list if no search is passed' 


        it 'should return an empty list if there are no bodies' 


      end

    end

    context "when the current user can't make batch requests" do

      render_views

      before do
        @user = FactoryBot.create(:user)
      end

      it 'should return a 403 with an appropriate message' 


    end

    context 'when there is no logged-in user' do

      it 'should return a redirect to the login page' 

    end


  end

  context "when batch requests is not enabled" do

    it 'should return a 404' 


  end

end

describe RequestController, "when the site is in read_only mode" do
  before do
    allow(AlaveteliConfiguration).to receive(:read_only).and_return("Down for maintenance")
  end

  it "redirects to the frontpage_url" 


  it "shows a flash message to alert the user" 


  context "when annotations are disabled" do
    before do
      allow(controller).to receive(:feature_enabled?).with(:annotations).and_return(false)
    end

    it "doesn't mention annotations in the flash message" 

  end
end

describe RequestController do

  describe 'GET #details' do

    let(:info_request){ FactoryBot.create(:info_request)}

    it 'renders the details template' 


    it 'assigns the info_request' 


    it 'assigns columns' 


    context 'when the request is hidden' do

      before do
        info_request.prominence = 'hidden'
        info_request.save!
      end

      it 'returns a 403' 


      it 'shows the hidden request template' 


    end

    context 'when the request is embargoed' do

      before do
        info_request.create_embargo(:publish_at => Time.zone.now + 3.days)
      end

      it 'raises an ActiveRecord::RecordNotFound error' 

    end


  end

end

describe RequestController do
  describe 'GET #describe_state_message' do
    let(:info_request){ FactoryBot.create(:info_request_with_incoming) }

    it 'assigns the info_request to the view' 


    it 'assigns the described state to the view' 


    it 'assigns the last info request event id to the view' 


    it 'assigns the title to the view' 


    context 'when the request is embargoed' do
      let(:info_request){ FactoryBot.create(:embargoed_request) }

      it 'raises ActiveRecord::RecordNotFound' 


    end
  end
end

describe RequestController do

  describe 'GET #download_entire_request' do
    context 'when the request is embargoed' do
      let(:user) { FactoryBot.create(:user) }
      let(:pro_user) { FactoryBot.create(:pro_user) }
      let(:info_request) do
        FactoryBot.create(:embargoed_request, user: pro_user)
      end

      context 'and the user is not logged in' do
        it 'raises ActiveRecord::RecordNotFound' 

      end

      context 'and the user is logged in but not the owner' do
        before do
          session[:user_id] = user.id
        end

        it 'raises ActiveRecord::RecordNotFound' 

      end

      context 'and the user is the owner' do
        before do
          session[:user_id] = pro_user.id
        end

        it 'allows the download' 

      end
    end

    context 'when the request is unclassified' do

      it 'does not render the describe state form' 


    end

  end
end

describe RequestController do

  describe 'GET #show_request_event' do

    context 'when the event is an incoming message' do
      let(:event){ FactoryBot.create(:response_event) }

      it 'returns a 301 status' 


      it 'redirects to the incoming message path' 


      it 'raises ActiveRecord::RecordNotFound when the request is embargoed' 

    end

    context 'when the event is an outgoing message' do
      let(:event){ FactoryBot.create(:sent_event) }

      it 'returns a 301 status' 


      it 'redirects to the outgoing message path' 


      it 'raises ActiveRecord::RecordNotFound when the request is embargoed' 

    end

    context 'for any other kind of event' do
      let(:event){ FactoryBot.create(:info_request_event) }

      it 'returns a 301 status' 


      it 'redirects to the request path' 


      it 'raises ActiveRecord::RecordNotFound when the request is embargoed' 

    end
  end

  describe 'GET #search_typeahead' do

    it "does not raise an error if there are no params" 


  end

end

