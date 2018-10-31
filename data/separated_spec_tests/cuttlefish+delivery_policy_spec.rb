# frozen_string_literal: true

require "spec_helper"

describe DeliveryPolicy do
  subject { DeliveryPolicy.new(user, delivery) }

  let(:team_one) { create(:team) }
  let(:team_two) { create(:team) }

  let(:app) { create(:app, team: team_one) }
  let(:email) { create(:email, app: app) }
  let(:delivery) { create(:delivery, email: email) }

  context "normal user in team one" do
    let(:user) { create(:admin, team: team_one) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:new) }
    it { is_expected.not_to permit(:update)  }
    it { is_expected.not_to permit(:edit)    }
    it { is_expected.not_to permit(:destroy) }
    it "is included in the scope" 

  end

  context "unauthenticated user" do
    let(:user) { nil }

    it { is_expected.not_to permit(:show) }
    it { is_expected.not_to permit(:create) }
    it { is_expected.not_to permit(:new) }
    it { is_expected.not_to permit(:update)  }
    it { is_expected.not_to permit(:edit)    }
    it { is_expected.not_to permit(:destroy) }
    it "is included in the scope" 

  end

  context "normal user in team two" do
    let(:user) { create(:admin, team: team_two) }
    it { is_expected.not_to permit(:show) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:new) }
    it { is_expected.not_to permit(:update)  }
    it { is_expected.not_to permit(:edit)    }
    it { is_expected.not_to permit(:destroy) }
    it "is not included in the scope" 

  end

  context "super admin in team two" do
    let(:user) { create(:admin, team: team_two, site_admin: true) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:new) }
    it { is_expected.not_to permit(:update)  }
    it { is_expected.not_to permit(:edit)    }
    it { is_expected.not_to permit(:destroy) }
    it "is included in the scope" 

  end
end

