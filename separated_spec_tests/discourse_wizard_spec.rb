require 'rails_helper'
require 'wizard'

describe Wizard do
  before do
    SiteSetting.wizard_enabled = true
  end

  context "defaults" do
    it "has default values" 

  end

  describe "append_step" do
    let(:user) { Fabricate.build(:moderator) }
    let(:wizard) { Wizard.new(user) }
    let(:step1) { wizard.create_step('first-step') }
    let(:step2) { wizard.create_step('second-step') }

    it "works with a block format" 


    it "adds the step correctly" 


    it "sequences multiple steps" 

  end

  describe "completed?" do
    let(:user) { Fabricate.build(:moderator) }
    let(:wizard) { Wizard.new(user) }

    it "is complete when all steps with fields have logs" 

  end

  describe "#requires_completion?" do

    def build_simple(user)
      wizard = Wizard.new(user)
      wizard.append_step('simple') do |step|
        step.add_field(id: 'name', type: 'text')
      end
      wizard
    end

    it "is false for anonymous" 


    it "is false for regular users" 


    it "it's false when the wizard is disabled" 


    it "its false when the wizard is bypassed" 


    it "its automatically bypasses after you reach topic limit" 


    it "it's true for the first admin who logs in" 


    it "is false for staff when complete" 


  end

end

