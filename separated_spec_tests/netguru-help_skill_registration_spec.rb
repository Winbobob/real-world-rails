require 'rails_helper'

describe SkillRegistration do

  let(:user){ User.new }
  let(:topic){ Topic.new }

  subject{ described_class.new user, topic }

  describe "#commence!" do

    it "creates skill if user was not helping before" 


    it "destroys skill if user was helping before" 


  end

end

