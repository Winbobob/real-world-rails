require "rails_helper"

require "auth/authenticator"
require_dependency "auth/result"

describe "users/omniauth_callbacks/complete.html.erb" do

  let :rendered_data do
    JSON.parse(rendered.match(/data-auth-result="([^"]*)"/)[1].gsub('&quot;', '"'))
  end

  it "renders auth info" 


  it "renders cas data " 


end

