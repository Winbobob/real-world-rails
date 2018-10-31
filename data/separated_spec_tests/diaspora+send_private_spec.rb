# frozen_string_literal: true

describe Workers::SendPrivate do
  let(:sender_id) { "any_user@example.org" }
  let(:obj_str) { "status_message@guid" }
  let(:targets) {
    {
      "https://example.org/receive/user/guid" => "<xml>post</xml>",
      "https://example.com/receive/user/guid" => "<xml>post2</xml>"
    }
  }
  let(:failing_targets) { {"https://example.org/receive/user/guid" => "<xml>post</xml>"} }

  it "succeeds if all urls were successful" 


  it "retries failing urls" 


  it "does not retry failing urls if max retries is reached" 


  it "retries contact entities 20 times" 

end

