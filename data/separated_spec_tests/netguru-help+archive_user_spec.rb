require 'rails_helper'

describe ArchiveUser do

  describe '#commence!' do
    let(:user) { User.create }
    let(:skill) { Skill.create(user_id: user.id) }
    before { ArchiveUser.new(user).commence! }

    it 'sets archived_at field to time now' 


    it 'deletes user skills' 

  end
end

