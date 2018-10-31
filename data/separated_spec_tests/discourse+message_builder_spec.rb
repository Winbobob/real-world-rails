require 'rails_helper'
require 'email/message_builder'

describe Email::MessageBuilder do

  let(:to_address) { "jake@adventuretime.ooo" }
  let(:subject) { "Tree Trunks has made some apple pie!" }
  let(:body) { "oh my glob Jake, Tree Trunks just made the tastiest apple pie ever!" }
  let(:builder) { Email::MessageBuilder.new(to_address, subject: subject, body: body) }
  let(:build_args) { builder.build_args }
  let(:header_args) { builder.header_args }
  let(:allow_reply_header) { described_class::ALLOW_REPLY_BY_EMAIL_HEADER }

  it "has the correct to address" 


  it "has the subject" 


  it "has the body" 


  it "has a utf-8 charset" 


  it "ask politely not to receive automated responses" 


  context "reply by email" do

    context "without allow_reply_by_email" do
      it "does not have a X-Discourse-Reply-Key" 


      it "returns a Reply-To header that's the same as From" 

    end

    context "with allow_reply_by_email" do
      let(:reply_by_email_builder) { Email::MessageBuilder.new(to_address, allow_reply_by_email: true) }

      context "With the SiteSetting enabled" do
        before do
          SiteSetting.stubs(:reply_by_email_enabled?).returns(true)
          SiteSetting.stubs(:reply_by_email_address).returns("r+%{reply_key}@reply.myforum.com")
        end

        it "returns a Reply-To header with the reply key" 


        it "cleans up the site title" 

      end

      context "With the SiteSetting disabled" do
        before do
          SiteSetting.stubs(:reply_by_email_enabled?).returns(false)
        end

        it "returns a Reply-To header that's the same as From" 

      end
    end

    context "with allow_reply_by_email" do
      let(:reply_by_email_builder) do
        Email::MessageBuilder.new(to_address,
          allow_reply_by_email: true,
          private_reply: true,
          from_alias: "Username"
        )
      end

      context "With the SiteSetting enabled" do
        before do
          SiteSetting.stubs(:reply_by_email_enabled?).returns(true)

          SiteSetting.stubs(:reply_by_email_address)
            .returns("r+%{reply_key}@reply.myforum.com")
        end

        it "returns a Reply-To header with the reply key" 

      end

      context "With the SiteSetting disabled" do
        before do
          SiteSetting.stubs(:reply_by_email_enabled?).returns(false)
        end

        it "returns a Reply-To header that's the same as From" 

      end
    end

  end

  context "custom headers" do

    let(:custom_headers_string) { " Precedence : bulk | :: | No-colon | No-Value: | Multi-colon : : value : : | Auto-Submitted : auto-generated " }
    let(:custom_headers_result) { { "Precedence" => "bulk", "Multi-colon" => ": value : :", "Auto-Submitted" => "auto-generated" } }

    it "custom headers builder" 


    it "empty headers builder" 


    it "null headers builder" 


  end

  context "header args" do

    let(:message_with_header_args) do
      Email::MessageBuilder.new(
        to_address,
        body: 'hello world',
        topic_id: 1234,
        post_id: 4567,
      )
    end

    it "passes through a post_id" 


    it "passes through a topic_id" 


  end

  context "unsubscribe link" do

    context "with add_unsubscribe_link false" do
      it "has no unsubscribe header by default" 


      it "doesn't have the user preferences url in the body" 


    end

    context "with add_unsubscribe_link true" do

      let(:message_with_unsubscribe) { Email::MessageBuilder.new(to_address,
                                                                body: 'hello world',
                                                                add_unsubscribe_link: true,
                                                                url: "/t/1234",
                                                                unsubscribe_url: "/t/1234/unsubscribe") }

      it "has an List-Unsubscribe header" 


      it "has the unsubscribe url in the body" 


      it "does not add unsubscribe via email link without site setting set" 


    end

  end

  context "template_args" do
    let(:template_args) { builder.template_args }

    it "has site title as email_prefix when `SiteSetting.email_prefix` is not present" 


    it "has email prefix as email_prefix when `SiteSetting.email_prefix` is present" 


    it "has the base url" 


    it "has the user_preferences_url" 

  end

  context "email prefix in subject" do
    context "when use_site_subject is true" do
      let(:message_with_email_prefix) { Email::MessageBuilder.new(to_address,
                                                                  body: 'hello world',
                                                                  use_site_subject: true) }

      it "when email_prefix is set it should be present in subject" 

    end
  end

  context "subject_template" do

    let(:templated_builder) { Email::MessageBuilder.new(to_address, template: 'mystery') }
    let(:rendered_template) { "rendered template" }

    it "has the body rendered from a template" 


    it "has the subject rendered from a template" 


  end

  context "from field" do

    it "has the default from" 


    it "title setting will be added if present" 


    let(:finn_email) { 'finn@adventuretime.ooo' }
    let(:custom_from) { Email::MessageBuilder.new(to_address, from: finn_email).build_args }

    it "allows us to override from" 


    let(:aliased_from) { Email::MessageBuilder.new(to_address, from_alias: "Finn the Dog") }

    it "allows us to alias the from address" 


    let(:custom_aliased_from) { Email::MessageBuilder.new(to_address,
                                                          from_alias: "Finn the Dog",
                                                          from: finn_email) }

    it "allows us to alias a custom from address" 


    it "email_site_title will be added if it's set" 


    it "email_site_title overrides title" 


    it "cleans up aliases in the from_alias arg" 


    it "cleans up the email_site_title" 


  end

end

