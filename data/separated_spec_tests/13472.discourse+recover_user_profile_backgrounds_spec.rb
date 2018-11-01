require 'rails_helper'

require_dependency 'jobs/onceoff/recover_user_profile_backgrounds'

RSpec.describe Jobs::RecoverUserProfileBackgrounds do
  let(:user_profile) { Fabricate(:user).user_profile }

  before do
    SiteSetting.s3_upload_bucket = "s3-upload-bucket"
    SiteSetting.s3_access_key_id = "s3-access-key-id"
    SiteSetting.s3_secret_access_key = "s3-secret-access-key"
    SiteSetting.enable_s3_uploads = true
  end

  it "corrects the URL and recovers the uploads" 

end

