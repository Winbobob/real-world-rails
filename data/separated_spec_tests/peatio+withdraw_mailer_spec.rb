require "spec_helper"

describe WithdrawMailer do
  describe "withdraw_state" do
    let(:withdraw) { create :satoshi_withdraw }
    let(:mail) do
      withdraw.cancel!
      WithdrawMailer.withdraw_state(withdraw.id)
    end

    it "renders the headers" 


    it "renders the body" 

  end

  describe "submitted" do
    let(:withdraw) { create :satoshi_withdraw }
    let(:mail) do
      withdraw.submit!
      WithdrawMailer.submitted(withdraw.id)
    end

    it "renders the headers" 


    it "renders the body" 

  end

  describe "done" do
    let(:withdraw) { create :satoshi_withdraw }
    let(:mail) do
      withdraw.submit!
      withdraw.accept!
      withdraw.process!
      withdraw.succeed!
      WithdrawMailer.done(withdraw.id)
    end

    it "renders the headers" 


    it "renders the body" 

  end
end

