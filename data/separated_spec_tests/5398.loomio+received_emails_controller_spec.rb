require 'rails_helper'

describe ReceivedEmailsController do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:discussion) { create(:discussion) }
  let(:comment) { create(:comment, discussion: discussion) }
  let(:griddler_params) {{
    mailinMsg: {
      html: "<html><body>Hi!</body></html>",
      text: "Hi!",
      subject: "Greetings!",
      from: [{ name: user.name, address: user.email }],
      to: [], # we're stubbing out to with the value below
      cc: [],
      headers: {}
    }
  }}
  let(:comment_email_params) { EmailParams.new(
    OpenStruct.new(
      to: [{
        host: "loomiohost.org",
        token: "reply&c=#{comment.id}&d=#{discussion.id}&u=#{user.id}&k=#{user.email_api_key}"
      }],
      body: "This is a reply!"),
    reply_host: "loomiohost.org")
  }
  let(:discussion_email_params) { EmailParams.new(
    OpenStruct.new(
      to: [{
        host: "loomiohost.org",
        token: "reply&d=#{discussion.id}&u=#{user.id}&k=#{user.email_api_key}"
      }],
      body: "This is a comment!"),
    reply_host: "loomiohost.org")
  }

  before do
    discussion.group.add_member! user
    discussion.group.add_member! another_user
  end

  it "creates a comment via email" 


  it "creates a comment via email without a parent" 


  it "does not create a comment when the user is not authorized" 

end

