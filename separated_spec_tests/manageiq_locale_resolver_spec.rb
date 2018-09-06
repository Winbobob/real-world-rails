RSpec.describe LocaleResolver do
  context "when the user's locale is set" do
    it "returns the user's locale" 

  end

  context "when the user's locale is 'default'" do
    context "and the server's locale is set" do
      before { stub_server_settings_with_locale("en-US") }

      it "returns the server's locale" 

    end

    context "and the server's locale is 'default'" do
      before { stub_server_settings_with_locale("default") }

      it "returns the locale from the headers" 

    end

    context "and the server's locale is not set" do
      before { stub_server_settings_with_locale(nil) }

      it "returns the locale from the headers" 

    end
  end

  context "when the user's locale is not set" do
    context "and the server's locale is set" do
      before { stub_server_settings_with_locale("en-US") }

      it "returns the server's locale" 

    end

    context "and the server's locale is 'default'" do
      before { stub_server_settings_with_locale("default") }

      it "returns the locale from the headers" 

    end

    context "and the server's locale is not set" do
      before { stub_server_settings_with_locale(nil) }

      it "returns the locale from the headers" 

    end
  end

  def stub_server_settings_with_locale(locale)
    allow(Settings.server).to receive(:locale).and_return(locale)
  end
end

