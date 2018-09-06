# frozen_string_literal: true

describe Notifier, type: :mailer do
  let(:person) { FactoryGirl.create(:person) }
  let(:pod_name) { AppConfig.settings.pod_name }


  before do
    Notifier.deliveries = []
  end

  describe ".administrative" do
    it "mails a user" 


    context "mails a bunch of users" do
      before do
        @users = []
        5.times do
          @users << FactoryGirl.create(:user)
        end
      end
      it "has a body" 


      it "has attachments" 

    end
  end

  describe ".single_admin" do
    it "mails a user" 


    it "has the layout" 


    it "has an optional attachment" 

  end

  describe ".started_sharing" do
    let!(:request_mail) { Notifier.send_notification("started_sharing", bob.id, person.id) }

    it "goes to the right person" 


    it "has the name of person sending the request" 

  end

  describe ".contacts_birthday" do
    let(:contact) { alice.contact_for(bob.person) }
    let(:mail) { Notifier.send_notification("contacts_birthday", alice.id, nil, bob.person.id) }

    it "TO: goes to the right person" 


    it "SUBJECT: has the name of birthday person in the subject" 


    it "has a link to the birthday profile in the body" 

  end

  describe ".mentioned" do
    before do
      @user = alice
      @post = FactoryGirl.create(:status_message, public: true)
      @mention = Mention.create(person: @user.person, mentions_container: @post)

      @mail = Notifier.send_notification("mentioned", @user.id, @post.author.id, @mention.id)
    end

    it "TO: goes to the right person" 


    it "SUBJECT: has the name of person mentioning in the subject" 


    it "IN-REPLY-TO and REFERENCES: references the mentioning post" 


    it "has the post text in the body" 


    it "should not include translation fallback" 

  end

  describe ".mentioned_in_comment" do
    let(:user) { alice }
    let(:comment) { FactoryGirl.create(:comment) }
    let(:mention) { Mention.create(person: user.person, mentions_container: comment) }
    let(:mail) { Notifier.send_notification("mentioned_in_comment", user.id, comment.author.id, mention.id) }

    it "TO: goes to the right person" 


    it "SUBJECT: has the name of person mentioning in the subject" 


    it "IN-REPLY-TO and REFERENCES: references the commented post" 


    it "has the comment link in the body" 


    it "renders proper wording when limited" 


    it "renders comment text when public" 

  end

  describe ".mentioned limited" do
    before do
      @user = alice
      @post = FactoryGirl.create(:status_message, public: false)
      @mention = Mention.create(person: @user.person, mentions_container: @post)

      @mail = Notifier.send_notification("mentioned", @user.id, @post.author.id, @mention.id)
    end

    it "TO: goes to the right person" 


    it "SUBJECT: has the name of person mentioning in the subject" 


    it "has the post text not in the body" 


    it "should not include translation fallback" 

  end

  describe ".liked" do
    before do
      @post = FactoryGirl.create(:status_message, author: alice.person, public: true)
      @like = @post.likes.create!(author: bob.person)
      @mail = Notifier.send_notification("liked", alice.id, @like.author.id, @like.id)
    end

    it "TO: goes to the right person" 


    it "BODY: contains the original post" 


    it "BODY: contains the name of person liking" 


    it "should not include translation fallback" 


    it "can handle a reshare" 

  end

  describe ".reshared" do
    before do
      @post = FactoryGirl.create(:status_message, author: alice.person, public: true)
      @reshare = FactoryGirl.create(:reshare, root: @post, author: bob.person)
      @mail = Notifier.send_notification("reshared", alice.id, @reshare.author.id, @reshare.id)
    end

    it "TO: goes to the right person" 


    it "IN-REPLY-TO and REFERENCES: references the reshared post" 


    it "BODY: contains the truncated original post" 


    it "BODY: contains the name of person liking" 


    it "should not include translation fallback" 

  end

  describe ".private_message" do
    before do
      @user2 = bob
      @participant_ids = @user2.contacts.map {|c| c.person.id } + [@user2.person.id]

      @create_hash = {
        author:              @user2.person,
        participant_ids:     @participant_ids,
        subject:             "cool stuff",
        messages_attributes: [{author: @user2.person, text: "hey"}]
      }

      @cnv = Conversation.create(@create_hash)

      @mail = Notifier.send_notification("private_message", bob.id, @cnv.author.id, @cnv.messages.first.id)
    end

    it "TO: goes to the right person" 


    it "FROM: contains the sender's name" 


    it "should use a generic subject" 


    it "SUBJECT: should not has a snippet of the private message contents" 


    it "IN-REPLY-TO and REFERENCES: references the containing conversation" 


    it "BODY: does not contain the message text" 


    it "should not include translation fallback" 

  end

  context "comments" do
    let(:commented_post) {
      bob.post(:status_message,
               text:   "### Headline \r\n It's **really** sunny outside today, and this is a super long status message!  #notreally",
               to:     :all,
               public: true)
    }
    let(:comment) { eve.comment!(commented_post, "Totally is") }

    describe ".comment_on_post" do
      let(:comment_mail) {
        Notifier.send_notification("comment_on_post", bob.id, eve.person.id, comment.id).deliver_now
      }

      it "TO: goes to the right person" 


      it "FROM: contains the sender's name" 


      it "SUBJECT: has a snippet of the post contents, without markdown and without newlines" 


      context "BODY" do
        it "contains the comment" 


        it "contains the original post's link with comment anchor" 


        it "should not include translation fallback" 

      end

      [:reshare].each do |post_type|
        context post_type.to_s do
          let(:commented_post) { FactoryGirl.create(post_type, author: bob.person) }
          it "succeeds" 

        end
      end
    end

    describe ".also_commented" do
      let(:comment_mail) { Notifier.send_notification("also_commented", bob.id, eve.person.id, comment.id) }

      it "TO: goes to the right person" 


      it "FROM: has the name of person commenting as the sender" 


      it "SUBJECT: has a snippet of the post contents, without markdown and without newlines" 


      it "IN-REPLY-TO and REFERENCES: references the commented post" 


      context "BODY" do
        it "contains the comment" 


        it "contains the original post's link with comment anchor" 


        it "should not include translation fallback" 

      end
      [:reshare].each do |post_type|
        context post_type.to_s do
          let(:commented_post) { FactoryGirl.create(post_type, author: bob.person) }
          it "succeeds" 

        end
      end
    end
  end

  context "limited post" do
    let(:limited_post) {
      alice.post(:status_message, to: :all, public: false,
        text: "### Limited headline \r\n It's **really** sunny outside today")
    }

    context "comments" do
      let(:comment) { bob.comment!(limited_post, "Totally is") }

      describe ".also_commented" do
        let(:mail) { Notifier.send_notification("also_commented", alice.id, bob.person.id, comment.id) }

        it "TO: goes to the right person" 


        it "FROM: contains the sender's name" 


        it "SUBJECT: does not show the limited post" 


        it "BODY: does not show limited message" 


        it "BODY: does not show the comment" 

      end

      describe ".comment_on_post" do
        let(:comment) { bob.comment!(limited_post, "Totally is") }
        let(:mail) { Notifier.send_notification("comment_on_post", alice.id, bob.person.id, comment.id) }

        it "TO: goes to the right person" 


        it "FROM: contains the sender's name" 


        it "SUBJECT: does not show the limited post" 


        it "IN-REPLY-TO and REFERENCES: references the commented post" 


        it "BODY: does not show the limited post" 


        it "BODY: does not show the comment" 

      end
    end

    describe ".liked" do
      let(:like) { bob.like!(limited_post) }
      let(:mail) { Notifier.send_notification("liked", alice.id, bob.person.id, like.id) }

      it "TO: goes to the right person" 


      it "FROM: contains the sender's name" 


      it "SUBJECT: does not show the limited post" 


      it "IN-REPLY-TO and REFERENCES: references the liked post" 


      it "BODY: does not show the limited post" 


      it "BODY: contains the name of person liking" 


      it "should not include translation fallback" 

    end
  end

  describe ".confirm_email" do
    before do
      bob.update_attribute(:unconfirmed_email, "my@newemail.com")
      @confirm_email = Notifier.send_notification("confirm_email", bob.id)
    end

    it "goes to the right person" 


    it "FROM: header should be the pod name with default sender address" 


    it "has the unconfirmed email in the subject" 


    it "has the unconfirmed emil in the body" 


    it "has the receivers name in the body" 


    it "has the activation link in the body" 

  end

  describe ".invite" do
    let(:email) { Notifier.invite(alice.email, bob, "1234", "en") }

    it "goes to the right person" 


    it "FROM: header should be the pod name + default sender address" 


    it "has the correct subject" 


    it "has the inviter name in the body" 


    it "has the inviter id if the name is nil" 


    it "has the invitation code in the body" 

  end

  describe ".csrf_token_fail" do
    let(:email) { Notifier.send_notification("csrf_token_fail", alice.id) }

    it "goes to the right person" 


    it "FROM: header should be the pod name + default sender address" 


    it "has the correct subject" 


    it "has the receivers name in the body" 


    it "has some informative text in the body" 

  end

  describe "hashtags" do
    it "escapes hashtags" 

  end

  describe "base" do
    it "handles idn addresses" 


    it "FROM: header should be 'pod_name (username)' when there is no first and last name" 

  end
end

