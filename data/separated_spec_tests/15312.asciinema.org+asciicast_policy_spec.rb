require 'rails_helper'

describe AsciicastPolicy do

  describe AsciicastPolicy::Scope do
    let(:policy_scope) { AsciicastPolicy::Scope.new(user, Asciicast.all) }

    subject { policy_scope.resolve }

    let!(:asciicast_1) { create(:asciicast, private: false) }
    let!(:asciicast_2) { create(:asciicast, private: true) }

    context "when user is not admin" do
      let(:user) { double(:user, is_admin?: false) }

      it { should eq([asciicast_1]) }
    end

    context "when user is admin" do
      let(:user) { double(:user, is_admin?: true) }

      it { should eq([asciicast_1, asciicast_2]) }
    end
  end

  subject { described_class }

  describe '#permitted_attributes' do
    subject { Pundit.policy(user, asciicast).permitted_attributes }

    let(:asciicast) { Asciicast.new }

    context "when user is admin" do
      let(:user) { stub_model(User, is_admin?: true) }

      it "includes form fields + featured" 

    end

    context "when user isn't admin" do
      let(:user) { stub_model(User, is_admin?: false) }

      it "is empty" 


      context "and is creator of the asciicast" do
        let(:asciicast) { Asciicast.new(user: user) }

        it "doesn't include featured but includes private" 

      end
    end
  end

  permissions :update? do
    it "denies access if user is nil" 


    it "grants access if user is admin" 


    it "grants access if user is creator of the asciicast" 


    it "denies access if user isn't the creator of the asciicast" 

  end

  permissions :destroy? do
    it "denies access if user is nil" 


    it "grants access if user is admin" 


    it "grants access if user is creator of the asciicast" 


    it "denies access if user isn't the creator of the asciicast" 

  end

  permissions :change_featured? do
    it "denies access if user is nil" 


    it "grants access if user is admin" 


    it "denies access if user isn't admin" 

  end

  permissions :change_visibility? do
    it "denies access if user is nil" 


    it "grants access if user is admin" 


    it "grants access if user is creator of the asciicast" 


    it "denies access if user isn't the creator of the asciicast" 

  end

end

