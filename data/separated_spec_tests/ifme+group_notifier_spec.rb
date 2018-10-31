# frozen_string_literal: true

describe GroupNotifier do
  let(:current_user) { build(:user) }
  let(:group) { build(:group) }
  let(:type) { 'notifier' }
  let(:recipient) { build(:user) }
  let(:recipients) { [recipient] }
  let(:new_notifications) { [build(:notification)] }
  let(:client) { double('client') }
  let(:mailer) { double('mailer') }
  let(:data) do
    {
      user: current_user.name,
      group_id: group.id,
      group: group.name,
      type: type,
      uniqueid: "notifier_#{current_user.id}"
    }.to_json
  end
  subject { GroupNotifier.new(group, type, current_user) }

  after do
    subject.send_notifications_to(recipients)
  end

  it 'creates push notifications' 


  it 'sends email notifications' 


  it 'creates notifications' 

end

