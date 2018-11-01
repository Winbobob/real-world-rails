# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Admin::BaseHelper do
    describe '#toolbar_button' do
      context "with permission" do
        before { allow(helper).to receive(:can?).and_return(true) }

        it "renders a toolbar button" 

      end

      context "without permission" do
        before { allow(helper).to receive(:can?).and_return(false) }

        it "returns empty string" 

      end

      context "with disabled permission check" do
        before { allow(helper).to receive(:can?).and_return(false) }

        it "returns the button" 

      end

      context "with empty permission option" do
        before { allow(helper).to receive(:can?).and_return(true) }

        it "returns reads the permission from url" 

      end

      context "with overlay option set to false" do
        before do
          allow(helper).to receive(:can?).and_return(true)
          expect(helper).to receive(:permission_array_from_url)
        end

        it "renders a normal link" 

      end
    end

    describe "#translations_for_select" do
      it "should return an Array of Arrays with available locales" 

    end

    describe '#clipboard_select_tag_options' do
      let(:page) { build_stubbed(:alchemy_page) }

      before { helper.instance_variable_set('@page', page) }

      context 'with element items' do
        let(:element) { build_stubbed(:alchemy_element) }
        let(:clipboard_items) { [element] }

        it "should include select options with the display name and preview text" 


        context "when @page can have cells" do
          before { allow(page).to receive(:can_have_cells?).and_return(true) }

          it "should group the elements in the clipboard by cell" 

        end
      end

      context 'with page items' do
        let(:page_in_clipboard) { build_stubbed(:alchemy_page, name: 'Page name') }
        let(:clipboard_items) { [page_in_clipboard] }

        it "should include select options with page names" 

      end
    end

    describe '#button_with_confirm' do
      subject { button_with_confirm }

      it "renders a button tag with a data attribute for confirm dialog" 

    end

    describe '#delete_button' do
      subject { delete_button('/admin/pages') }

      it "renders a button tag" 


      it "returns a form tag with method=delete" 

    end

    describe '#alchemy_datepicker' do
      subject { alchemy_datepicker(essence, :date, {value: value, type: type}) }

      let(:essence) { EssenceDate.new }
      let(:value) { nil }
      let(:type) { nil }

      it "renders a text field with data attribute for 'date'" 


      context "when datetime given as type" do
        let(:type) { :datetime }

        it "renders a text field with data attribute for 'datetime'" 

      end

      context "when time given as type" do
        let(:type) { :time }

        it "renders a text field with data attribute for 'time'" 

      end

      context "with date given as value" do
        let(:value) { Time.now }

        it "sets given date as value" 

      end

      context 'with date stored on object' do
        let(:date)    { Time.parse('1976-10-07 00:00 Z') }
        let(:essence) { EssenceDate.new(date: date) }

        it "sets this date as value" 

      end
    end

    describe '#current_alchemy_user_name' do
      subject { helper.current_alchemy_user_name }

      before { expect(helper).to receive(:current_alchemy_user).and_return(user) }

      context 'with a user having a `alchemy_display_name` method' do
        let(:user) { double('User', alchemy_display_name: 'Peter Schroeder') }

        it "Returns a span showing the name of the currently logged in user." 

      end

      context 'with a user not having a `alchemy_display_name` method' do
        let(:user) { double('User', name: 'Peter Schroeder') }

        it { is_expected.to be_nil }
      end
    end

    describe '#link_url_regexp' do
      subject { helper.link_url_regexp }

      it "returns the regular expression for external link urls" 


      context 'if the expression from config is nil' do
        before do
          stub_alchemy_config(:format_matchers, {link_url: nil})
        end

        it "returns the default expression" 

      end
    end

    describe '#hint_with_tooltip' do
      subject { helper.hint_with_tooltip('My hint') }

      it 'renders a warning icon with hint text wrapped in tooltip', :aggregate_failures do
        is_expected.to have_css 'span.hint-with-icon i.fa-exclamation-triangle'
        is_expected.to have_css 'span.hint-with-icon span.hint-bubble'
        is_expected.to have_content 'My hint'
      end

      context 'with icon set to info' do
        subject { helper.hint_with_tooltip('My hint', icon: 'info') }

        it 'renders an info icon instead' 

      end
    end
  end
end

