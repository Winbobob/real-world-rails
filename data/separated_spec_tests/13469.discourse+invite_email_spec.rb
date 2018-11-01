require 'rails_helper'
require_dependency 'jobs/base'

describe Jobs::InviteEmail do

  context '.execute' do

    it 'raises an error when the invite_id is missing' 


    context 'with an invite id' do

      let (:mailer) { Mail::Message.new(to: 'eviltrout@test.domain') }
      let (:invite) { Fabricate(:invite) }

      it 'delegates to the test mailer' 


      it "aborts without error when the invite doesn't exist anymore" 

    end

  end

end

