require "rails_helper"

RSpec.describe NotificationMailer, type: :mailer do
  let(:receiver)       { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:sender)         { Fabricate(:account, username: 'bob') }
  let(:foreign_status) { Fabricate(:status, account: sender, text: 'The body of the foreign status') }
  let(:own_status)     { Fabricate(:status, account: receiver.account, text: 'The body of the own status') }

  shared_examples 'localized subject' do |*args, **kwrest|
    it 'renders subject localized for the locale of the receiver' 


    it 'renders subject localized for the default locale if the locale of the receiver is unavailable' 

  end

  describe "mention" do
    let(:mention) { Mention.create!(account: receiver.account, status: foreign_status) }
    let(:mail) { NotificationMailer.mention(receiver.account, Notification.create!(account: receiver.account, activity: mention)) }

    include_examples 'localized subject', 'notification_mailer.mention.subject', name: 'bob'

    it "renders the headers" 


    it "renders the body" 

  end

  describe "follow" do
    let(:follow) { sender.follow!(receiver.account) }
    let(:mail) { NotificationMailer.follow(receiver.account, Notification.create!(account: receiver.account, activity: follow)) }

    include_examples 'localized subject', 'notification_mailer.follow.subject', name: 'bob'

    it "renders the headers" 


    it "renders the body" 

  end

  describe "favourite" do
    let(:favourite) { Favourite.create!(account: sender, status: own_status) }
    let(:mail) { NotificationMailer.favourite(own_status.account, Notification.create!(account: receiver.account, activity: favourite)) }

    include_examples 'localized subject', 'notification_mailer.favourite.subject', name: 'bob'

    it "renders the headers" 


    it "renders the body" 

  end

  describe "reblog" do
    let(:reblog) { Status.create!(account: sender, reblog: own_status) }
    let(:mail) { NotificationMailer.reblog(own_status.account, Notification.create!(account: receiver.account, activity: reblog)) }

    include_examples 'localized subject', 'notification_mailer.reblog.subject', name: 'bob'

    it "renders the headers" 


    it "renders the body" 

  end

  describe 'follow_request' do
    let(:follow_request) { Fabricate(:follow_request, account: sender, target_account: receiver.account) }
    let(:mail) { NotificationMailer.follow_request(receiver.account, Notification.create!(account: receiver.account, activity: follow_request)) }

    include_examples 'localized subject', 'notification_mailer.follow_request.subject', name: 'bob'

    it 'renders the headers' 


    it 'renders the body' 

  end

  describe 'digest' do
    before do
      mention = Fabricate(:mention, account: receiver.account, status: foreign_status)
      Fabricate(:notification, account: receiver.account, activity: mention)
      sender.follow!(receiver.account)
    end

    context do
      let!(:mail) { NotificationMailer.digest(receiver.account, since: 5.days.ago) }

      include_examples 'localized subject', 'notification_mailer.digest.subject', count: 1, name: 'bob'

      it 'renders the headers' 


      it 'renders the body' 

    end

    it 'includes activities since the date specified by :since option' 


    it 'includes activities since the receiver was last emailed if :since option is unavailable' 


    it 'includes activities since the receiver last signed in if :since option and the last emailed date are unavailable' 

  end
end

