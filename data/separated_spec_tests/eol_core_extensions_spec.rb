require "spec_helper"

# TODO - UHHH... a LOT.  I just added this because I thought it was trivially easy to check the change I was
# making... and was kinda shocked that we didn't have a spec for extensions already. So... really... we should.  :|
describe "Core Extensions" do

  describe "#capitalize_all_words_if_language_safe" do

    before(:all) do
      @locale = I18n.locale
      @lower = "this is some string"
      @upper = "This Is Some String"
    end

    after(:each) do
      I18n.locale = @locale
    end

    it 'should capitalize all words in a string in Romance and Germanic languages' 


    it 'should NOT capitalize any words in a string from an Asian language' 


    it 'should NOT capitalize some small words in English ' 

  end

  describe 'fix_old_user_added_text_linebreaks' do
    it 'should replace line breaks with HTML BR tags' 


    it 'should wrap the text in a paragraph tag if requested' 


    it 'should not convert if there are already breaks in the text' 

  end

  describe 'add_missing_hyperlinks' do
    it 'should link http URLs' 


    it 'should link https URLs' 


    it 'should link www URLs' 


    it 'should link DOIs' 


    it 'should not link already linked URLs' 

  end

  it 'should know when strings are numeric' 


  it 'should know when strings are integers' 


  it 'should know when strings are floats' 


end

