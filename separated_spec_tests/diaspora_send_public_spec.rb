# frozen_string_literal: true

describe Workers::SendPublic do
  let(:sender_id) { "any_user@example.org" }
  let(:obj_str) { "status_message@guid" }
  let(:urls) { ["https://example.org/receive/public", "https://example.com/receive/public"] }
  let(:xml) { "<xml>post</xml>" }

  it "succeeds if all urls were successful" 


  it "retries failing urls" 


  it "does not retry failing urls if max retries is reached" 

end

