require 'spec_helper'

RSpec.describe "have_http_status" do
  def create_response(opts = {})
    ActionDispatch::TestResponse.new(opts.fetch(:status)).tap {|x|
      x.request = ActionDispatch::Request.new({})
    }
  end

  shared_examples_for "supports different response instances" do
    context "given an ActionDispatch::Response" do
      it "returns true for a response with the same code" 

    end

    context "given an ActionDispatch::TestResponse" do
      it "returns true for a response with the same code" 

    end

    context "given something that acts as a Capybara::Session" do
      it "returns true for a response with the same code" 

    end

    it "returns false given another type" 


    it "has a failure message reporting it was given another type" 


    it "has a negated failure message reporting it was given another type" 

  end

  context "with a numeric status code" do
    it_behaves_like "supports different response instances" do
      subject(:matcher) { have_http_status(code) }

      let(:code) { 209 }
    end

    describe "matching a response" do
      it "returns true for a response with the same code" 


      it "returns false for a response with a different code" 

    end

    it "describes responding with the numeric status code" 


    it "has a failure message reporting the expected and actual status codes" 


    it "has a negated failure message reporting the expected status code" 

  end

  context "with a symbolic status" do
    # :created => 201 status code
    # see http://guides.rubyonrails.org/layouts_and_rendering.html#the-status-option
    let(:created_code) { 201 }
    let(:created_symbolic_status) { :created }

    it_behaves_like "supports different response instances" do
      subject(:matcher) { have_http_status(created_symbolic_status) }

      let(:code) { created_code }
    end

    describe "matching a response" do
      it "returns true for a response with the equivalent code" 


      it "returns false for a response with a different code" 

    end

    it "describes responding by the symbolic and associated numeric status code" 


    it "has a failure message reporting the expected and actual statuses" 


    it "has a negated failure message reporting the expected status code" 


    it "raises an ArgumentError" 

  end

  shared_examples_for 'status code matcher' do
    # within the calling block, define:
    # let(:expected_code) { <value> } # such as 555, 444, 333, 222
    # let(:other_code) { <value> } # such as 555, 444, 333, 222
    # let(:failure_message) {
    #   /an error status code \(5xx\) but it was 400/
    # } # for example
    # let(:negated_message) {
    #   /not to have an error status code \(5xx\) but it was 555/
    # } # for example
    # let(:description) {
    #   'respond with an error status code (5xx)'
    # } # for example
    # subject(:matcher) { <matcher> } # e.g. { have_http_status(:error) }
    describe "matching a response" do
      it "returns true for a response with code" 


      it "returns false for a response with a different code" 

    end

    it "describes #{description}" 


    it "has a failure message reporting the expected and actual status codes" 


    it "has a negated failure message reporting the expected and actual status codes" 

  end

  context "with general status code group", ":error" do
    # The error query is an alias for `server_error?`:
    #
    # - https://github.com/rails/rails/blob/ca200378/actionpack/lib/action_dispatch/testing/test_response.rb#L27
    # - https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/testing/test_response.rb
    #
    # `server_error?` is part of the Rack Helpers and is defined as:
    #
    #     status >= 500 && status < 600
    #
    # See:
    #
    # - https://github.com/rack/rack/blob/ce4a3959/lib/rack/response.rb#L122
    # - https://github.com/rack/rack/blob/master/lib/rack/response.rb

    subject(:matcher) { have_http_status(:error) }

    it_behaves_like 'status code matcher' do
      let(:expected_code) { 555 }
      let(:other_code) { 400 }
      let(:failure_message) { /an error status code \(5xx\) but it was 400/ }
      let(:negated_message) {
        /not to have an error status code \(5xx\) but it was 555/
      }
      let(:description) {
        'respond with an error status code (5xx)'
      }
    end

    it_behaves_like "supports different response instances" do
      let(:code) { 555 }
    end
  end

  context "with general status code group", ":server_error" do
    subject(:matcher) { have_http_status(:server_error) }

    it_behaves_like 'status code matcher' do
      let(:expected_code) { 555 }
      let(:other_code) { 400 }
      let(:failure_message) { /a server_error status code \(5xx\) but it was 400/ }
      let(:negated_message) {
        /not to have a server_error status code \(5xx\) but it was 555/
      }
      let(:description) {
        'respond with a server_error status code (5xx)'
      }
    end

    it_behaves_like "supports different response instances" do
      let(:code) { 555 }
    end
  end

  context "with general status code group", ":success" do
    # The success query is an alias for `successful?`:
    #
    # - https://github.com/rails/rails/blob/ca200378/actionpack/lib/action_dispatch/testing/test_response.rb#L18
    # - https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/testing/test_response.rb
    #
    # `successful?` is part of the Rack Helpers and is defined as:
    #
    #     status >= 200 && status < 300
    #
    # See:
    #
    # - https://github.com/rack/rack/blob/ce4a3959/lib/rack/response.rb#L119
    # - https://github.com/rack/rack/blob/master/lib/rack/response.rb

    subject(:matcher) { have_http_status(:success) }

    it_behaves_like 'status code matcher' do
      let(:expected_code) { 222 }
      let(:other_code) { 400 }
      let(:failure_message) {
        /a success status code \(2xx\) but it was 400/
      }
      let(:negated_message) {
        /not to have a success status code \(2xx\) but it was 222/
      }
      let(:description) {
        'respond with a success status code (2xx)'
      }
    end

    it_behaves_like "supports different response instances" do
      let(:code) { 222 }
    end
  end

  context "with general status code group", ":successful" do
    subject(:matcher) { have_http_status(:successful) }

    it_behaves_like 'status code matcher' do
      let(:expected_code) { 222 }
      let(:other_code) { 400 }
      let(:failure_message) {
        /a successful status code \(2xx\) but it was 400/
      }
      let(:negated_message) {
        /not to have a successful status code \(2xx\) but it was 222/
      }
      let(:description) {
        'respond with a successful status code (2xx)'
      }
    end

    it_behaves_like "supports different response instances" do
      let(:code) { 222 }
    end
  end

  context "with general status code group", ":missing" do
    # The missing query is an alias for `not_found?`:
    #
    # - https://github.com/rails/rails/blob/ca200378/actionpack/lib/action_dispatch/testing/test_response.rb#L21
    # - https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/testing/test_response.rb
    #
    # `not_found?` is part of the Rack Helpers and is defined as:
    #
    #     status == 404
    #
    # See:
    #
    # - https://github.com/rack/rack/blob/ce4a3959/lib/rack/response.rb#L130
    # - https://github.com/rack/rack/blob/master/lib/rack/response.rb

    subject(:matcher) { have_http_status(:missing) }

    it_behaves_like 'status code matcher' do
      let(:expected_code) { 404 }
      let(:other_code) { 400 }
      let(:failure_message) {
        /a missing status code \(404\) but it was 400/
      }
      let(:negated_message) {
        /not to have a missing status code \(404\) but it was 404/
      }
      let(:description) {
        'respond with a missing status code (404)'
      }
    end

    it_behaves_like "supports different response instances" do
      let(:code) { 404 }
    end
  end

  context "with general status code group", ":not_found" do
    subject(:matcher) { have_http_status(:not_found) }

    it_behaves_like 'status code matcher' do
      let(:expected_code) { 404 }
      let(:other_code) { 400 }
      let(:failure_message) {
        /a not_found status code \(404\) but it was 400/
      }
      let(:negated_message) {
        /not to have a not_found status code \(404\) but it was 404/
      }
      let(:description) {
        'respond with a not_found status code (404)'
      }
    end

    it_behaves_like "supports different response instances" do
      subject(:matcher) { have_http_status(:not_found) }
      let(:code) { 404 }
    end
  end

  context "with general status code group", ":redirect" do
    # The redirect query is an alias for `redirection?`:
    #
    # - https://github.com/rails/rails/blob/ca200378/actionpack/lib/action_dispatch/testing/test_response.rb#L24
    # - https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/testing/test_response.rb
    #
    # `redirection?` is part of the Rack Helpers and is defined as:
    #
    #     status >= 300 && status < 400
    #
    # See:
    #
    # - https://github.com/rack/rack/blob/ce4a3959/lib/rack/response.rb#L120
    # - https://github.com/rack/rack/blob/master/lib/rack/response.rb

    subject(:matcher) { have_http_status(:redirect) }

    it_behaves_like 'status code matcher' do
      let(:expected_code) { 308 }
      let(:other_code) { 400 }
      let(:failure_message) {
        /a redirect status code \(3xx\) but it was 400/
      }
      let(:negated_message) {
        /not to have a redirect status code \(3xx\) but it was 308/
      }
      let(:description) {
        'respond with a redirect status code (3xx)'
      }
    end

    it_behaves_like "supports different response instances" do
      let(:code) { 308 }
    end
  end

  context "with a nil status" do
    it "raises an ArgumentError" 

  end

  if 5 < Rails::VERSION::MAJOR ||
     (Rails::VERSION::MAJOR == 5 && 2 <= Rails::VERSION::MINOR)
    shared_examples_for "does not use deprecated methods for Rails 5.2+" do
      it "does not use deprecated method for Rails >= 5.2" 

    end

    context 'http status :missing' do
      it_behaves_like "does not use deprecated methods for Rails 5.2+" do
        subject(:matcher) { have_http_status(:missing) }
        let(:code) { 404 }
      end
    end

    context 'http status :success' do
      it_behaves_like "does not use deprecated methods for Rails 5.2+" do
        subject(:matcher) { have_http_status(:success) }
        let(:code) { 222 }
      end
    end

    context 'http status :error' do
      it_behaves_like "does not use deprecated methods for Rails 5.2+" do
        subject(:matcher) { have_http_status(:error) }
        let(:code) { 555 }
      end
    end

    context 'http status :not_found' do
      it_behaves_like "supports different response instances" do
        subject(:matcher) { have_http_status(:not_found) }
        let(:code) { 404 }
      end
    end

    context 'http status :successful' do
      it_behaves_like "supports different response instances" do
        subject(:matcher) { have_http_status(:successful) }
        let(:code) { 222 }
      end
    end

    context 'http status :server_error' do
      it_behaves_like "supports different response instances" do
        subject(:matcher) { have_http_status(:server_error) }
        let(:code) { 555 }
      end
    end
  end
end

