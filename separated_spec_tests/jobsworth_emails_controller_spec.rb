require 'spec_helper'

describe EmailsController do

  describe 'create' do
    before :each do
      sign_in_normal_user
      Setting.domain = 'example.com' # use the same domain in squish_mail.msg
    end

    it 'should attach a new task to a default projet' 

  end
end

