require 'spec_helper'

Synchronize = EmailService::SES::Synchronize

describe EmailService::SES::Synchronize do

  before(:each) {
    @id = 1
  }

  def next_id
    @id += 1
  end

  def get_type(type)
    {
      old_pending: -> () { [:requested, (25 + rand(24)).hours.ago]},
      new_pending: -> () { [:requested, rand(24).hours.ago]},
      verified: -> () { [:verified, nil]},
      none: -> () { [:none, nil]}
    }[type]
  end

  def gen_str(len)
    len.times.map { ('a'..'z').to_a[rand(26)] }.join("")
  end

  def gen_email
    "#{gen_str(20)}@#{gen_str(10)}.#{gen_str(3)}}"
  end

  def gen_address(type)
    status, verification_requested_at = get_type(type).call()

    { id: next_id(),
      community_id: 1,
      name: gen_str(25),
      email: gen_email(),
      verification_status: status,
      verification_requested_at: verification_requested_at }
  end

  def ids(addresses)
    addresses.map { |a| a[:id] }
  end

  def emails(addresses)
    addresses.map { |a| a[:email] }
  end

  def store_addresses(addresses)
    addresses.map { |addr|
      m = MarketplaceSenderEmail.new(addr)
      m.id = addr[:id]
      m.save!
      m.reload
    }
  end

  describe "#build_sync_updates" do
    it "marks verified requested as verified" 


    it "marks old pending requested as expired" 


    it "marks non-verified verified as none" 

  end

  describe "#run_batch_synchronization" do
    it "syncs db contents with SES data" 

  end

  describe "#run_single_synchronization!" do
    it "syncs single address with SES data" 

  end

end

