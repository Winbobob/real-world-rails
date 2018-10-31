require "rails_helper"

describe "translate accelerator" do
  before(:all) do
    @original_i18n_load_path = I18n.load_path.dup
    I18n.load_path += Dir["#{Rails.root}/spec/fixtures/i18n/translate_accelerator.*.yml"]
    I18n.reload!
  end

  after(:all) do
    I18n.load_path = @original_i18n_load_path
    I18n.reload!
  end

  after do
    I18n.reload!
  end

  def override_translation(locale, key, value)
    expect(I18n.exists?(key, locale)).to eq(true)
    override = TranslationOverride.upsert!(locale, key, value)
    expect(override.persisted?).to eq(true)
  end

  it "overrides for both string and symbol keys" 


  describe ".overrides_by_locale" do
    it "should cache overrides for each locale" 

  end

  context "plugins" do
    before do
      DiscoursePluginRegistry.register_locale(
        'foo',
        name: 'Foo',
        nativeName: 'Foo Bar',
        plural: {
          keys: [:one, :few, :other],
          rule: lambda do |n|
            return :one if n == 1
            return :few if n < 10
            :other
          end
        }
      )

      LocaleSiteSetting.reset!
      I18n.reload!
    end

    after do
      DiscoursePluginRegistry.reset!
      LocaleSiteSetting.reset!
    end

    it "loads plural rules from plugins" 

  end

  describe "with overrides" do
    it "returns the overridden key" 


    it "returns the overridden key after switching the locale" 


    it "can be searched" 


    it "supports disabling" 


    it "supports interpolation" 


    it "supports interpolation named count" 


    it "ignores interpolation named count if it is not applicable" 


    it "supports one and other" 


    it "supports one and other when only a single pluralization key is overridden" 


    it "returns the overriden text when falling back" 


    it "returns override if it exists before falling back" 


    it "does not affect ActiveModel::Naming#human" 


    describe "client json" do
      it "is empty by default" 


      it "doesn't return server overrides" 


      it "returns client overrides" 

    end
  end
end

