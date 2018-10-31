require 'rails_helper'
require 'metrics_logger'

RSpec.describe MetricsLogger do
  before :each do
    Timecop.freeze(@time = Time.utc(2013, 12, 12, 0, 0, 0))
  end

  after :each do
    Timecop.return
  end

  it "logs a visit request" 


  it "logs when the prison staff clicks on the link, but only the first instance" 


  it "logs when the visit is confirmed" 


  it "logs when the visit is rejected" 


  it "responds with a visit request status as cancelled" 


  it "responds with a visit status as confirmed" 


  ['visit_cancelled', 'request_cancelled'].each do |reason|
    it "responds with a visit status as cancelled when reason is #{reason}" 

  end

  it "blows up when trying to cancel with an unknown reason" 


  it "responds with a visit status as rejected" 


  it "responds with a visit status as not processed" 


  context "the backing store is down" do
    it "silently discards a visit request" 


    context "looking for an entry" do
      before :each do
        expect(VisitMetricsEntry).to receive(:where).and_raise(e = PG::ConnectionBad.new)
        expect(Raven).to receive(:capture_exception).with(e)
      end

      it "silently discards a link click" 


      it "silently discards a booking confirmation" 


      it "silently discards a booking rejection" 


      it "returns unknown as status" 

    end
  end

  context "data is inconsistent following an outage in the backing store" do
    it "silently discards a link click" 


    it "silently discards a booking confirmation" 


    it "silently discards a booking rejection" 


    it "returns status as unknown" 

  end
end

