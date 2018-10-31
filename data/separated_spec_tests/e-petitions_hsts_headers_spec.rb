require 'rails_helper'

RSpec.describe 'HSTS headers', type: :request do
  subject { response.header["Strict-Transport-Security"] }

  before do
    get "/"
  end

  it "sets the includeSubDomains option" 


  it "sets the max-ago to 365 days" 

end

