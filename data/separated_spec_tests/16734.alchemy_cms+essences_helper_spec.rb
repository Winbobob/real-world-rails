# frozen_string_literal: true

require 'spec_helper'

describe Alchemy::EssencesHelper do
  let(:element) { build_stubbed(:alchemy_element) }
  let(:content) { build_stubbed(:alchemy_content, element: element, ingredient: 'hello!') }
  let(:essence) { mock_model('EssenceText', link: nil, partial_name: 'essence_text', ingredient: 'hello!') }

  before do
    allow_message_expectations_on_nil
    allow(content).to receive(:essence).and_return(essence)
  end

  describe 'render_essence' do
    subject { render_essence(content) }

    it "renders an essence view partial" 


    context 'with editor given as view part' do
      subject { helper.render_essence(content, :editor) }

      before do
        allow(helper).to receive(:content_label)
        allow(content).to receive(:settings).and_return({})
      end

      it "renders an essence editor partial" 

    end

    context 'if content is nil' do
      let(:content) { nil }

      it "returns empty string" 


      context 'editor given as part' do
        subject { helper.render_essence(content, :editor) }

        before { allow(Alchemy).to receive(:t).and_return('') }

        it "displays warning" 

      end
    end

    context 'if essence is nil' do
      let(:essence) { nil }

      it "returns empty string" 


      context 'editor given as part' do
        subject { helper.render_essence(content, :editor) }

        before { allow(Alchemy).to receive(:t).and_return('') }

        it "displays warning" 

      end
    end
  end

  describe 'render_essence_view' do
    it "renders an essence view partial" 

  end

  describe "render_essence_view_by_name" do
    it "renders an essence view partial by content name" 

  end
end

