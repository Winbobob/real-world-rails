require 'rails_helper'

describe UsersHelper do
  include TermsHelper

  let(:user) { create(:user) }

  describe '#user_link' do
    subject { helper.user_link(user) }

    it "links to the user's profile" 


    it "has the user's email as title" 

  end

  describe '#profile_tabs' do
    subject(:tabs) { helper.profile_tabs }

    before do
      allow(helper).to receive(:current_user).and_return(user)
      allow(helper).to receive(:can?).and_return(true)
    end

    context 'with public profile' do
      it 'includes all the expected tabs' 

    end

    context 'with private profile' do
      before do
        allow(helper).to receive(:can?).with(user, :read_user_profile, nil).and_return(false)
      end

      it 'is empty' 

    end
  end

  describe '#user_internal_regex_data' do
    using RSpec::Parameterized::TableSyntax

    where(:user_default_external, :user_default_internal_regex, :result) do
      false | nil                | { user_internal_regex_pattern: nil, user_internal_regex_options: nil }
      false | ''                 | { user_internal_regex_pattern: nil, user_internal_regex_options: nil }
      false | 'mockRegexPattern' | { user_internal_regex_pattern: nil, user_internal_regex_options: nil }
      true  | nil                | { user_internal_regex_pattern: nil, user_internal_regex_options: nil }
      true  | ''                 | { user_internal_regex_pattern: nil, user_internal_regex_options: nil }
      true  | 'mockRegexPattern' | { user_internal_regex_pattern: 'mockRegexPattern', user_internal_regex_options: 'gi' }
    end

    with_them do
      before do
        stub_application_setting(user_default_external: user_default_external)
        stub_application_setting(user_default_internal_regex: user_default_internal_regex)
      end

      subject { helper.user_internal_regex_data }

      it { is_expected.to eq(result) }
    end
  end

  describe '#current_user_menu_items' do
    subject(:items) { helper.current_user_menu_items }

    before do
      allow(helper).to receive(:current_user).and_return(user)
      allow(helper).to receive(:can?).and_return(false)
    end

    it 'includes all default items' 


    it 'includes the profile tab if the user can read themself' 


    it 'includes the settings tab if the user can update themself' 


    context 'when terms are enforced' do
      before do
        enforce_terms
      end

      it 'hides the profile and the settings tab' 

    end
  end
end

