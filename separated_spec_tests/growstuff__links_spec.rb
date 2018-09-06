describe 'devise/shared/_links.haml', type: "view" do
  def devise_mapping(register, recover, confirm, lock, oauth)
    dm = double("mappings")
    dm.stub(registerable?: register)
    dm.stub(recoverable?: recover)
    dm.stub(confirmable?: confirm)
    dm.stub(lockable?: lock)
    dm.stub(omniauthable?: oauth)
    dm
  end

  it 'should have a sign-in link if not in sessions' 


  it "shouldn't have a sign-in link if in sessions" 

end

