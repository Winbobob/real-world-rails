require "rails_helper"

describe Notifier do
  describe "notifications" do
    let(:notification) { FactoryBot.create(:notification) }
    let(:mail) { Notifier.notify(notification) }

    it 'sets the subject correctly' 


    it 'comes from noreply@growstuff.org' 


    it 'sends the mail to the recipient of the notification' 

  end

  describe "planting reminders" do
    let(:member) { FactoryBot.create(:member) }
    let(:mail) { Notifier.planting_reminder(member) }

    it 'sets the subject correctly' 


    it 'comes from noreply@growstuff.org' 


    it 'sends the mail to the recipient of the notification' 


    it 'includes the new planting URL' 


    it 'includes the new harvest URL' 

  end

  describe "new crop request" do
    let(:member) { FactoryBot.create(:crop_wrangling_member) }
    let(:crop) { FactoryBot.create(:crop_request) }
    let(:mail) { Notifier.new_crop_request(member, crop) }

    it 'sets the subject correctly' 


    it 'comes from noreply@growstuff.org' 


    it 'sends the mail to the recipient of the notification' 


    it 'includes the requested crop URL' 

  end

  describe "crop approved" do
    let(:member) { FactoryBot.create(:member) }
    let(:crop) { FactoryBot.create(:crop) }
    let(:mail) { Notifier.crop_request_approved(member, crop) }

    it 'sets the subject correctly' 


    it 'comes from noreply@growstuff.org' 


    it 'sends the mail to the recipient of the notification' 


    it 'includes the approved crop URL' 


    it 'includes links to plant, harvest and stash seeds for the new crop' 

  end

  describe "crop rejected" do
    let(:member) { FactoryBot.create(:member) }
    let(:crop) { FactoryBot.create(:rejected_crop) }
    let(:mail) { Notifier.crop_request_rejected(member, crop) }

    it 'sets the subject correctly' 


    it 'comes from noreply@growstuff.org' 


    it 'sends the mail to the recipient of the notification' 


    it 'includes the rejected crop URL' 


    it 'includes the reason for rejection' 

  end
end

