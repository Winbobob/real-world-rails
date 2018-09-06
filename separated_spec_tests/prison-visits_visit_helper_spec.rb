require 'rails_helper'

RSpec.describe VisitHelper, type: :helper do
  module ControllerContext
    def visit
    end
  end

  context "for the current prison" do
    let :rochester do
      Prison.find 'Rochester'
    end

    let :slot do
      Slot.new(date: (Date.parse("2014-05-12")).to_s, times: "1045-1345", index: 1)
    end

    let :visit do
      Visit.new(prisoner: Prisoner.new(prison_name: "Rochester"), visitors: [Visitor.new], slots: [slot], visit_id: SecureRandom.hex)
    end

    before :each do
      helper.extend ControllerContext
      allow(helper).to receive(:visit).and_return(visit)
    end

    context 'slots' do
      it "provides a hash of slots by day" 

    end

    it "provides current slots" 


    it 'provides the prisons name' 


    it "provides the phone number" 


    it "provides the email address" 


    it "provides the email address" 


    it "provides the postcode" 


    it "provides the address" 


    it "escapes html in the address" 


    it "joins address lines with br" 


    it "provides the URL" 


    it "provides the link" 


    it "provides all the slots for a particular day" 


    context 'anomalies' do
      before do
        allow_any_instance_of(Prison).to receive(:slot_anomalies).
          and_return({ Date.parse('2014-08-14') => ['0700-0900'] })
      end

      it "informs when slot anomalies exist" 


      it "provides the slot anomalies" 


      it "informs when slot anomalies exist for a particular day" 

    end

    it "provides a formatted date for when a response may be sent out" 

  end

  it "should provide the prison name" 


  describe 'prison_specific_id_requirements' do
    let(:wymott) { Prison.find('Wymott') }
    let(:rochester) { Prison.find('Rochester') }

    it 'should render custom id content for prisons that have it' 


    it 'should render standard id content for prisons that do not have custom content' 

  end

  it "provides the date of Monday in the current week" 


  it "provides the date the Sunday at the end of the bookable range" 


  it "provides the booking range grouped by the Monday of each week" 


  it "confirms when a date is today" 


  it "confirms when a date is the first day of a month" 


  it "provides a capitalised initial of the second part of a string divided by the default token" 


  it "provides a capitalised initial of the second part of a string divided by a specified token" 


  it "provides the first part of a string divided by the default token" 


  it "provides the first part of a string divided by a specified token" 


  it "provides the second part of a string divided by the default token" 


  it "provides the second part of a string divided by a specified token" 


  it "provides a list of first & last names divided by a token from visitor objects" 

end

