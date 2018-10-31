require 'spec_helper'

describe ButtonHelper do
  describe 'http_clone_button' do
    let(:user) { create(:user) }
    let(:project) { build_stubbed(:project) }
    let(:has_tooltip_class) { 'has-tooltip' }

    def element
      element = helper.http_clone_button(project)

      Nokogiri::HTML::DocumentFragment.parse(element).first_element_child
    end

    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    context 'with internal auth enabled' do
      context 'when user has a password' do
        it 'shows no tooltip' 

      end

      context 'when user has password automatically set' do
        let(:user) { create(:user, password_automatically_set: true) }

        it 'shows the password text on the dropdown' 

      end
    end

    context 'with internal auth disabled' do
      before do
        stub_application_setting(password_authentication_enabled_for_git?: false)
      end

      context 'when user has no personal access tokens' do
        it 'has a personal access token text on the dropdown description ' 

      end
    end

    context 'when user is ldap user' do
      let(:user) { create(:omniauth_user, password_automatically_set: true) }

      it 'shows no tooltip' 

    end
  end

  describe 'ssh_button' do
    let(:user) { create(:user) }
    let(:project) { build_stubbed(:project) }

    def element
      element = helper.ssh_clone_button(project)

      Nokogiri::HTML::DocumentFragment.parse(element).first_element_child
    end

    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    context 'without an ssh key on the user' do
      it 'shows a warning on the dropdown description' 

    end

    context 'with an ssh key on the user' do
      before do
        create(:key, user: user)
      end

      it 'there is no warning on the dropdown description' 

    end
  end

  describe 'ssh and http clone buttons' do
    let(:user) { create(:user) }
    let(:project) { build_stubbed(:project) }

    def http_button_element
      element = helper.http_clone_button(project, append_link: false)

      Nokogiri::HTML::DocumentFragment.parse(element).first_element_child
    end

    def ssh_button_element
      element = helper.ssh_clone_button(project, append_link: false)

      Nokogiri::HTML::DocumentFragment.parse(element).first_element_child
    end

    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    it 'only shows the title of any of the clone buttons when append_link is false' 

  end

  describe 'clipboard_button' do
    let(:user) { create(:user) }
    let(:project) { build_stubbed(:project) }

    def element(data = {})
      element = helper.clipboard_button(data)
      Nokogiri::HTML::DocumentFragment.parse(element).first_element_child
    end

    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    context 'with default options' do
      context 'when no `text` attribute is not provided' do
        it 'shows copy to clipboard button with default configuration and no text set to copy' 

      end

      context 'when `text` attribute is provided' do
        it 'shows copy to clipboard button with provided `text` to copy' 

      end

      context 'when `title` attribute is provided' do
        it 'shows copy to clipboard button with provided `title` as tooltip' 

      end
    end

    context 'with `button_text` attribute provided' do
      it 'shows copy to clipboard button with provided `button_text` as button label' 

    end

    context 'with `hide_tooltip` attribute provided' do
      it 'shows copy to clipboard button without tooltip support' 

    end

    context 'with `hide_button_icon` attribute provided' do
      it 'shows copy to clipboard button without tooltip support' 

    end
  end
end

