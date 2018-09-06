require "rails_helper"

describe GithubPayloadsController do
  context "POST#create" do
    describe "for issue comments" do
      describe "when the comment has 'LGTM'" do
        it "completes the pull request" 

      end

      describe "when the comment does not contain 'LGTM'" do
        it "does not modify the pull request" 

      end
    end

    describe "when the action is 'closed'" do
      it "moves the pull request to 'completed'" 

    end

    describe "when the action is 'opened'" do
      it "creates a new PullRequest" 


      it "does not error if the payload has no body" 


      it "posts to slack" 

    end

    describe "when the action is 'created'" do
      context "when the comment is 'pull_request_review_comment'" do
        it "it updates the PullRequest's status to 'in progress'" 

      end

      context "when the comment is 'issue_comment'" do
        it "it updates the PullRequest's status to 'in progress'" 

      end

      it "does not throw an exception when there is no matching pr" 


      context "when the comment includes 'NRR'" do
        it "updates the PullRequest's status to 'needs review'" 

      end
    end

    describe "when the action is not 'opened'" do
      it "does not create a pull request" 

    end

    describe "signature verification" do
      context 'the GitHub secret matches the project correct' do
        it 'returns a success' 

      end

      context 'the GitHub secret does not match the project' do
        it 'returns a 401' 

      end
    end
  end

  def send_pull_request_payload(**key_word_args)
    send_github_request(pull_request_payload(**key_word_args))
  end

  def send_pull_request_review_payload(github_url:)
    request.headers["X-Github-Event"] = "pull_request_review_comment"
    send_github_request(
      pull_request_review_comment_payload(github_url: github_url)
    )
  end

  def send_issue_comment(body:, github_url:)
    request.headers["X-Github-Event"] = "issue_comment"
    send_github_request(
      issue_comment_payload(body: body, github_url: github_url)
    )
  end

  def last_pull_request
    PullRequest.last
  end

  def send_github_request(body)
    request.env["RAW_POST_DATA"] = body
    request.env["HTTP_X_HUB_SIGNATURE"] = create_signature(
      ENV["GITHUB_SECRET_KEY"],
      body,
    )
    post :create, github_payload: JSON.parse(body)
  end

  def create_signature(secret, body)
    "sha1=" + OpenSSL::HMAC.hexdigest(hmac_digest, secret, body)
  end

  def hmac_digest
    OpenSSL::Digest.new("sha1")
  end
end

