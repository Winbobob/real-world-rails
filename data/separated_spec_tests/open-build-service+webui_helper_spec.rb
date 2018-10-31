require 'rails_helper'

RSpec.describe Webui::WebuiHelper do
  let(:input) { 'Rocking the Open Build Service' }

  describe '#elide' do
    it 'does not elide' 


    it 'does elide 20 character by default in the middle' 


    it 'does elide from the left' 


    it 'does elide from the right' 


    it 'returns three dots for eliding two characters' 


    it 'returns three dots for eliding three characters' 


    it 'reduces a string to 10 characters and elides in the middle by default' 

  end

  describe '#elide_two' do
    it 'elides two strings with the proper overall length' 

  end

  describe '#word_break' do
    it 'continuously adds tag after N characters' 


    it 'adds no tag if string is shorter than N characters' 


    it 'adds one tag if string is longer than N characters' 


    it 'does not evaluate HTML tags' 


    it 'returns blank if no string given' 

  end

  describe '#repo_status_icon' do
    it 'renders icon' 


    it 'renders outdated icon' 


    it 'renders unknown icon' 

  end

  describe '#get_frontend_url_for' do
    it 'generates a url' 

  end

  describe '#bugzilla_url' do
    before do
      @configuration = { 'bugzilla_url' => 'https://bugzilla.example.org' }
      @expected_attributes = {
        classification: 7340,
        product:        'openSUSE.org',
        component:      '3rd%20party%20software',
        assigned_to:    '',
        short_desc:     ''
      }
    end

    it 'returns link to a prefilled bugzilla enter bug form' 


    it 'adds an assignee and description if parameters where given' 

  end

  describe '#format_projectname' do
    it "shortens project pathes by replacing home projects with '~'" 


    it 'leaves projects that are no home projects untouched' 

  end

  describe '#escape_nested_list' do
    it 'html escapes a string' 

  end

  describe '#sprited_text' do
    it 'returns a img element with a matching icon class and title attribute and text' 

  end

  describe '#remove_dialog_tag' do
    it "generates a link element and uses it's parameter as text field" 

  end

  describe '#remove_dialog_tag' do
    it "generates a 'pre' element and uses it's parameter as text field" 

  end

  describe '#possibly_empty_ul' do
    context 'if the block is not blank' do
      before do
        @cont = proc { 'some content' }
      end

      it "embeds content returned by a block in an 'ul' element" 


      it "applies parameters as attributes to an 'ul' element" 


      it 'ignores a possible fallback parameter' 

    end

    context 'if the block is blank' do
      before do
        @cont = proc { '' }
      end

      context 'and a fallback option is given' do
        before do
          @html_options = { class: 'list', fallback: '<p><i>fallback</i></p>' }
        end

        it { expect(possibly_empty_ul(@html_options, &@cont)).to eq('<p><i>fallback</i></p>') }
      end

      context 'and no fallback option is given' do
        it { expect(possibly_empty_ul({}, &@cont)).to be(nil) }
      end
    end
  end

  describe '#is_advanced_tab?' do
    advanced_tabs = ['prjconf', 'index', 'meta', 'status']
    advanced_tabs.each do |action|
      context "current action is '#{action}'" do
        before do
          allow(controller).to receive(:action_name).and_return(action)
        end

        it { expect(is_advanced_tab?).to be(true) }
      end
    end

    context "current action is not within #{advanced_tabs}" do
      before do
        allow(controller).to receive(:action_name).and_return('some_action')
      end

      it { expect(is_advanced_tab?).to be(false) }
    end
  end

  describe '#next_codemirror_uid' do
    before do
      @codemirror_editor_setup = 0
    end

    after do
      @codemirror_editor_setup = 0
    end

    it { expect(next_codemirror_uid).to be_instance_of(Integer) }

    context "if next_codemirror_uid get's called the first time" do
      it { expect(next_codemirror_uid).to eq(1) }
    end

    context 'if next_codemirror_uid has been called before' do
      before do
        next_codemirror_uid
      end

      it 'increases @codemirror_editor_setup by 1' 

    end
  end

  describe '#can_register' do
    context 'current user is admin' do
      before do
        User.current = create(:admin_user)
      end

      it { expect(can_register).to be(true) }
    end

    context 'user is not registered' do
      before do
        User.current = create(:user)
        allow(UnregisteredUser).to receive(:can_register?).and_raise(APIError)
      end

      it { expect(can_register).to be(false) }
    end

    context 'user is registered' do
      it { expect(can_register).to be(true) }
    end
  end

  describe '#repo_status_icon' do
    skip('Please add some tests')
  end

  describe '#tab' do
    skip('Please add some tests')
  end

  describe '#render_dialog' do
    skip('Please add some tests')
  end

  describe '#project_or_package_link' do
    skip('Please add some tests')
  end

  describe '#creator_intentions' do
    it 'do not show the requester if he is the same as the creator' 


    it 'show the requester if he is different as the creator' 

  end

  describe '#codemirror_style' do
    context 'option height' do
      it 'uses auto as default value' 


      it 'get set properly' 

    end

    context 'option width' do
      it 'uses auto as default value' 


      it 'get set properly' 

    end

    context 'option border' do
      it 'does not remove border' 


      it 'removes the border if in read-only mode' 


      it 'removes the border if no_border is set' 

    end
  end

  describe '#package_link' do
    skip('Please add some tests')
  end

  describe '#replace_jquery_meta_characters' do
    context 'with meta character in string' do
      it { expect(replace_jquery_meta_characters('openSUSE_Leap_42.2')).to eq('openSUSE_Leap_42_2') }
      it { expect(replace_jquery_meta_characters('openSUSE.Leap.42.2')).to eq('openSUSE_Leap_42_2') }
      it { expect(replace_jquery_meta_characters('openSUSE_Leap_42\2')).to eq('openSUSE_Leap_42_2') }
      it { expect(replace_jquery_meta_characters('openSUSE_Leap_42/2')).to eq('openSUSE_Leap_42_2') }
    end

    context 'without meta character in string' do
      it { expect(replace_jquery_meta_characters('openSUSE_Tumbleweed')).to eq('openSUSE_Tumbleweed') }
    end
  end

  describe '#toggle_sliced_text' do
    let(:short_text) { 'short_text' }
    let(:big_text) { 'big_text_' * 100 }
    let(:sliced_text) { big_text.slice(0, 50) }

    context 'with nil as text' do
      it { expect(toggle_sliced_text(nil)).to be_nil }
    end

    context 'with a short text' do
      it { expect(toggle_sliced_text(short_text)).to eq(short_text) }
    end

    context 'with a big text' do
      it { expect(toggle_sliced_text(big_text)).to match(/(.+)#{sliced_text}(.+)\[\+\](.+)#{big_text}(.+)\[\-\](.+)/) }
    end
  end
end

