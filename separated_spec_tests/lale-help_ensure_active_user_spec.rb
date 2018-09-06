require 'rails_helper'

describe "EnsureActiveUser filter" do
  
  let(:current_circle) { double('Circle') }
  let(:current_user) { double('User', role_for_circle: double('Circle::Role')) }
  let(:controller) { double('Controller', current_user: current_user, current_circle: current_circle) }

  context "when no current_user is available" do
    let(:current_user) { nil }

    it "doesn't redirect" 

  end

  context "when no current_circle is available" do
    let(:current_circle) { nil }

    it "doesn't redirect" 

  end

  context "when current_user is available" do
    
    context "when user is in one circle" do

      context "when user is active" do
        before { allow(current_circle).to receive(:has_active_user?) { true } }

        it "doesn't redirect" 

      end

      context "when user is not active" do

        before { allow(current_circle).to receive(:has_active_user?) { false } }
        # stub the method; not relevant for test setup
        before { allow(controller).to receive(:inactive_circle_membership_path) }

        context "when user isn't on an info page" do
          it "redirects" 

        end

        context "when user is on an info page" do
          it "doesn't redirect" 

        end
      end

    end

  end
end

