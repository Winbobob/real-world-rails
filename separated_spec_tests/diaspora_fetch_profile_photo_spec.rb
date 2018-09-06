# frozen_string_literal: true

describe Workers::FetchProfilePhoto do
  before do
   @user = alice
   @service = FactoryGirl.build(:service, :user => alice)

   @url = "https://service.com/user/profile_image"

   allow(@service).to receive(:profile_photo_url).and_return(@url)
   allow(@user).to receive(:update_profile)

   allow(User).to receive(:find).and_return(@user)
   allow(Service).to receive(:find).and_return(@service)

    @photo_double = double
    allow(@photo_double).to receive(:save!).and_return(true)
    allow(@photo_double).to receive(:url).and_return("image.jpg")
  end

  it 'saves the profile image' 


  context "service does not have a profile_photo_url" do
    it "does nothing without fallback" 


    it "fetches fallback if it's provided" 

  end


  it 'updates the profile' 

end

