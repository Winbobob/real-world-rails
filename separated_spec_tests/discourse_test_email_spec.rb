require 'rails_helper'
require_dependency 'jobs/base'

describe Jobs::TestEmail do

  context '.execute' do
    it 'raises an error when the address is missing' 


    context 'with an address' do

      let (:mailer) { Mail::Message.new(to: 'eviltrout@test.domain') }

      it 'delegates to the test mailer' 


    end

  end

end

