require 'rails_helper'

describe HomePagePresenter do

  let(:presenter) { described_class.new }

  describe '#asciicast' do
    subject { presenter.asciicast }

    before do
      allow(CFG).to receive(:home_asciicast) { home_asciicast }
    end

    context "when home_asciicast is present" do
      let(:home_asciicast) { double('home_asciicast',
                                    decorate: decorated_asciicast) }
      let(:decorated_asciicast) { double('decorated_asciicast') }

      it "returns decorated asciicast" 

    end

    context "when home_asciicast isn't present" do
      let(:home_asciicast) { nil }

      it { should be(nil) }
    end
  end

  describe '#playback_options' do
    subject { presenter.playback_options }

    it "has speed set to 2.0" 

  end

  describe '#latest_asciicasts' do
    subject { presenter.latest_asciicasts }

    let(:latest) { double('latest', decorate: decorated_latest) }
    let(:decorated_latest) { double('decorated_latest') }

    before do
      allow(Asciicast).to receive(:homepage_latest) { latest }
    end

    it "returns decorated latest asciicasts" 

  end

  describe '#featured_asciicasts' do
    subject { presenter.featured_asciicasts }

    let(:featured) { double('featured', decorate: decorated_featured) }
    let(:decorated_featured) { double('decorated_featured') }

    before do
      allow(Asciicast).to receive(:homepage_featured) { featured }
    end

    it "returns decorated featured asciicasts" 

  end

end

