# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApplicationFormattersHelper do
  describe 'text helpers' do
    before do
      subject.include(ERB::Util)
    end

    describe '#format_block_text' do
      it 'processes newlines' 

    end

    describe '#format_inline_text' do
      it 'does not add a block element' 

    end

    describe '#format_html' do
      it 'removes script tags' 


      it 'does not remove span tags' 


      it 'does not remove font tags' 


      it 'does not remove table styling' 


      it 'does not remove whitelisted css properties' 


      it 'removes forbidden css properties' 


      it 'formats code' 


      it 'produces html_safe output' 


      context 'when img tags are present' do
        it 'does not remove image src' 


        it 'does not remove image height and width' 


        it 'removes all other css properties on images' 


        it 'does not filter out base64 images' 

      end

      context 'when iframe tags are present' do
        it 'does not remove embedded content from allowed sources' 


        it 'removes forbidden embedded content' 


        it 'removes iframe tags without src attribute' 

      end
    end

    describe '#format_code_block' do
      let(:language) { Coursemology::Polyglot::Language::Python::Python2Point7 }
      let(:snippet) do
        <<-PYTHON
          # '1' < "2" is True
          def hello:
            pass
        PYTHON
      end
      let(:formatted_block) { helper.format_code_block(snippet, language) }

      it 'produces a pre element with the codehilite class' 


      it 'enumerates every line' 


      it 'highlights the keywords' 


      context 'when start line number is specified' do
        let(:line_start) { 5 }
        let(:formatted_block) { helper.format_code_block(snippet, language, line_start) }

        it 'highlights the code with the given start line number' 

      end

      it 'does not escape code' 


      context 'when the code snippet exceeds the size or lines limit' do
        let(:snippet) do
          too_many_lines = "new line\n" * 1500
          size_too_big = 'Im 10bytes' * 6 * 1024 # 60KB

          [too_many_lines, size_too_big].sample
        end

        it 'renders an alert' 

      end
    end

    describe '#sanitize' do
      it 'removes script tags' 

    end

    describe '#format_block_text' do
      it 'escapes HTML' 

    end
  end

  describe 'user display helper' do
    describe '#display_user' do
      let(:user) { build(:user) }
      subject { helper.display_user(user) }

      it 'displays the user\'s name' 

    end

    describe '#display_user_image' do
      let(:user) { build_stubbed(:user) }
      subject { helper.display_user_image(user) }

      context "when the user doesn't have a profile photo" do
        it 'displays the default image' 

      end

      context 'when the user has a profile photo' do
        let(:image) { File.join(Rails.root, '/spec/fixtures/files/picture.jpg') }
        before do
          file = File.open(image, 'rb')
          user.profile_photo = file
          file.close
        end

        it { is_expected.to include(user.profile_photo.medium.url) }
      end

      context 'when the user is nil' do
        let(:image) { File.join(Rails.root, '/spec/fixtures/files/picture.jpg') }
        subject { helper.display_user_image(nil) }

        it 'displays the default image' 

      end
    end

    describe '#link_to_user' do
      let(:user) { build_stubbed(:user) }
      subject { helper.link_to_user(user) }

      it { is_expected.to have_tag('a') }

      context 'when no block is given' do
        it { is_expected.to include(helper.display_user(user)) }
      end

      context 'when a block is given' do
        subject do
          helper.link_to_user(user) do
            'Test'
          end
        end

        it { is_expected.to include('Test') }
      end
    end
  end

  describe 'time-bounded helper' do
    let(:stub) do
      Object.new.tap do |result|
        start_at = self.start_at
        end_at = self.end_at
        result.define_singleton_method(:started?) { Time.zone.now >= start_at }
        result.define_singleton_method(:currently_active?) do
          Time.zone.now >= start_at && Time.zone.now <= end_at
        end
        result.define_singleton_method(:ended?) { Time.zone.now > end_at }
      end
    end

    describe '#time_period_class' do
      subject { helper.time_period_class(stub) }

      context 'when the object is not started' do
        let(:start_at) { Time.zone.now + 1.day }
        let(:end_at) { Time.zone.now + 2.days }
        it { is_expected.to eq(['not-started']) }
      end

      context 'when the object is currently active' do
        let(:start_at) { Time.zone.now - 1.day }
        let(:end_at) { Time.zone.now + 1.day }
        it { is_expected.to eq(['currently-active']) }
      end

      context 'when the object is ended' do
        let(:start_at) { Time.zone.now - 1.week }
        let(:end_at) { Time.zone.now - 1.day }
        it { is_expected.to eq(['ended']) }
      end
    end

    describe '#time_period_message' do
      subject { helper.time_period_message(stub) }

      context 'when the object is not started' do
        let(:start_at) { Time.zone.now + 1.day }
        let(:end_at) { Time.zone.now + 2.days }
        it { is_expected.to eq(I18n.t('common.not_started')) }
      end

      context 'when the object is currently active' do
        let(:start_at) { Time.zone.now - 1.day }
        let(:end_at) { Time.zone.now + 1.day }
        it { is_expected.to be_nil }
      end

      context 'when the object is ended' do
        let(:start_at) { Time.zone.now - 1.week }
        let(:end_at) { Time.zone.now - 1.day }
        it { is_expected.to eq(I18n.t('common.ended')) }
      end
    end
  end

  describe 'draft helper' do
    let(:stub) do
      Object.new.tap do |result|
        published = self.published
        result.define_singleton_method(:published?) { published }
      end
    end

    describe '#draft_class' do
      subject { helper.draft_class(stub) }
      context 'when the object is not published' do
        let(:published) { false }
        it { is_expected.to eq(['draft']) }
      end

      context 'when the object is published' do
        let(:published) { true }
        it { is_expected.to eq([]) }
      end
    end

    describe '#draft_message' do
      subject { helper.draft_message(stub) }
      context 'when the object is not published' do
        let(:published) { false }
        it { is_expected.to eq(I18n.t('common.draft')) }
      end

      context 'when the object is published' do
        let(:published) { true }
        it { is_expected.to be_nil }
      end
    end
  end

  describe 'unread helper' do
    let(:stub) do
      double.tap do |result|
        me = self
        result.define_singleton_method(:unread?) { |_| !me.read_status }
      end
    end

    describe '#unread_class' do
      subject { helper.unread_class(stub) }
      before { controller.define_singleton_method(:current_user) { nil } }

      context 'when the user has not read the item' do
        let(:read_status) { false }
        it 'returns ["unread"]' 

      end

      context 'when the user has read the item' do
        let(:read_status) { true }
        it 'returns an empty array' 

      end
    end
  end

  describe 'format_boolean' do
    context 'when boolean is truthy' do
      it 'returns the truthy value' 

    end

    context 'when boolean is falsey' do
      it 'returns the falsey value' 

    end
  end
end

