require 'rails_helper'

require_dependency 'jobs/scheduled/clean_up_uploads'

describe Jobs::CleanUpUploads do

  def fabricate_upload
    Fabricate(:upload, created_at: 2.hours.ago)
  end

  before do
    Upload.destroy_all
    SiteSetting.clean_up_uploads = true
    SiteSetting.clean_orphan_uploads_grace_period_hours = 1
    @upload = fabricate_upload
  end

  it "deletes orphan uploads" 


  it "does not clean up uploads in site settings" 


  it "does not clean up uploads in site settings when they use the CDN" 


  it "does not delete profile background uploads" 


  it "does not delete card background uploads" 


  it "does not delete category logo uploads" 


  it "does not delete category background url uploads" 


  it "does not delete post uploads" 


  it "does not delete user uploaded avatar" 


  it "does not delete user gravatar" 


  it "does not delete user custom upload" 


  it "does not delete uploads in a queued post" 


  it "does not delete uploads in a draft" 


  it "does not delete custom emojis" 


  it "does not delete user exported csv uploads" 

end
