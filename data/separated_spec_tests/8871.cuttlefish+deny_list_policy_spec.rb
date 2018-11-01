# frozen_string_literal: true

require "spec_helper"

describe DenyListPolicy do
  subject { DenyListPolicy.new(user, deny_list) }

  let(:team_one) { create(:team) }
  let(:team_two) { create(:team) }

  let(:deny_list) { create(:deny_list, team: team_one) }

  context "normal user in team one" do
    let(:user) { create(:admin, team: team_one) }
    it { is_expected.not_to permit(:create) }
    it { is_expected.not_to permit(:new) }
    it { is_expected.not_to permit(:update)  }
    it { is_expected.not_to permit(:edit)    }

    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:destroy) }
    it "should be in scope" 


    context "in read only mode" do
      before :each do
        allow(Rails.configuration).to receive(:cuttlefish_read_only_mode) {
          true
        }
      end
      it { is_expected.not_to permit(:destroy) }
    end
  end

  context "unauthenticated user" do
    let(:user) { nil }
    it { is_expected.not_to permit(:create) }
    it { is_expected.not_to permit(:new) }
    it { is_expected.not_to permit(:update)  }
    it { is_expected.not_to permit(:edit)    }
    it { is_expected.not_to permit(:show) }
    it { is_expected.not_to permit(:destroy) }

    it "should be in scope" 

  end

  context "normal user in team two" do
    let(:user) { create(:admin, team: team_two) }
    it { is_expected.not_to permit(:create) }
    it { is_expected.not_to permit(:new) }
    it { is_expected.not_to permit(:update)  }
    it { is_expected.not_to permit(:edit)    }
    it { is_expected.not_to permit(:show) }
    it { is_expected.not_to permit(:destroy) }
    it "should not be in scope" 

  end
end

