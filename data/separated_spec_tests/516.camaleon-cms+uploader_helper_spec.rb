require 'rails_helper'
describe CamaleonCms::UploaderHelper do
  init_site
  before(:each) do
    @path = "#{CAMALEON_CMS_ROOT}/spec/support/fixtures/rails_tmp.png"
    FileUtils.cp("#{CAMALEON_CMS_ROOT}/spec/support/fixtures/rails.png", @path)
  end
  
  it "upload a local file" 

  
  it "upload a local file max size" 


  it "upload a local file custom dimension" 


  it "upload a local file invalid format" 


  it "upload a local file with versions" 

  
  it "add auto orient for cropping images" 

  
  it "add auto orient for resizing" 


  it "upload a external file" 

  
end

