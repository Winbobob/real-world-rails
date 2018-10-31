require 'rails_helper'

describe AttachmentsController, type: :controller do
  before do
    @person, @other_person = FactoryGirl.create_list(:person, 2)
    @group = Group.create! name: 'Some Group', category: 'test', private: true
    @group.memberships.create! person: @person
    @message = Message.create_with_attachments(
      { group: @group, person: @person, subject: 'subject', body: 'body' },
      [Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/attachment.pdf'), 'application/pdf', true)]
    )
    @attachment = @message.attachments.first
  end

  it 'should show an attachment' 


  it 'should not show an attachment unless the person can see what it is attached to' 

end

