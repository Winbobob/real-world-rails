require 'rails_helper'

describe LogUserIn do
  let(:session){ Hash.new }
  let(:user_hash){ Hash.new }

  subject{ described_class.new(session, user_hash) }

  describe "commence!" do

    let(:new_user){ User.new }
    let(:registration){ double(commence!: true, user: new_user)}

    before{ allow(subject).to receive(:registration).and_return(registration) }

    it "creates user if it was not created before" 


    it "sets user_id in session" 

  end
end

