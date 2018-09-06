require "rails_helper"

describe "translate accelerator" do
  after do
    I18n.reload!
  end

  it "overrides for both string and symbol keys" 


  describe '.overrides_by_locale' do
    it 'should cache overrides for each locale' 

  end

  context "plugins" do
    before do
      DiscoursePluginRegistry.register_locale(
        "foo",
        name: "Foo",
        nativeName: "Foo Bar",
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
end

