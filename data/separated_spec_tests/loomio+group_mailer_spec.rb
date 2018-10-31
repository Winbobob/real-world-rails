require "rails_helper"

describe GroupMailer do
  describe '#membership_requested' do
    before do
      @group = create(:formal_group)
      @admin = @group.admins.first
      @membership_request = create(:membership_request, group: @group, name: 'bob jones', email: "bobby@jones.org")
      @event = Event.create(kind: 'membership_requested', eventable: @membership_request)
      @mail = GroupMailer.membership_requested(@admin, @event)
    end

    it 'renders the subject' 


    it "sends email to group admins" 


    context "requestor is an existing loomio user" do
      it 'renders the sender email' 


      it 'assigns correct reply_to' 


      it 'assigns confirmation_url for email body' 

    end

    context "requestor is not a loomio user"
  end
end

