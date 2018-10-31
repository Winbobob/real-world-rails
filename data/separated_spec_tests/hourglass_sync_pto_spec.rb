describe SyncPTO do
  let!(:user_1) { create(:user, zenefits_name: "John Doe") }
  let!(:user_2) { create(:user, zenefits_name: "Jane Doe") }
  let(:holiday) { Date.new(2015, 5, 25) } # Company holiday
  let(:vacation) { Date.new(2015, 5, 26) } # Personal vacation

  before do
    Timecop.travel(Date.new(2015, 5, 1))

    stub_request(:get, ENV["ZENEFITS_PTO_CALENDAR_URL"]).
      to_return(Rails.root.join("spec/fixtures/pto.ics").read)
  end

  it "creates PTO days for holidays and personal days" 


  it "marks existing days as PTO for holidays for all users" 


  it "ignores events earlier than one month ago" 

end

