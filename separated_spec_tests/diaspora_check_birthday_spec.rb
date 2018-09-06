# frozen_string_literal: true

describe Workers::CheckBirthday do
  let(:birthday_profile) { bob.profile }
  let(:contact1) { alice.contact_for(bob.person) }
  let(:contact2) { eve.contact_for(bob.person) }

  before do
    Timecop.freeze(Time.zone.local(1999, 9, 9))
    birthday_profile.update_attributes(birthday: "1990-09-09")
    allow(Notifications::ContactsBirthday).to receive(:notify)
  end

  after do
    Timecop.return
  end

  it "calls notify method for the birthday person's contacts" 


  it "does nothing if the birthday does not exist" 


  it "does nothing if the person's birthday is not today" 


  it "does not call notify method if a person is not a contact of the birthday person" 


  it "does not call notify method if a contact user is not :receiving from the birthday person" 


  it "does not call notify method if a birthday person is not :sharing with the contact user" 

end
