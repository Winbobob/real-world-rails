require_relative 'spec_helper'

describe AutoprefixerRails do
  before :all do
    @dir = Pathname(__FILE__).dirname
    @css = @dir.join('app/app/assets/stylesheets/test.css').read
  end

  it "process CSS" 


  it "process CSS for selected browsers" 


  it "process @supports" 


  it "generates source map" 


  it "generates separated source map" 


  it "uses file name in syntax errors", not_jruby: true do
    expect {
      AutoprefixerRails.process('a {', from: 'a.css')
    }.to raise_error(/a.css:/)
  end

  it "includes sourcesContent by default" 


  it "maps options from Ruby style" 


  it "does not remove old prefixes on request" 


  it "shows debug" 


  it "returns warnings" 


  it "shows correct error on country statistics" 


  context 'Sprockets' do
    before :each do
      @assets = Sprockets::Environment.new
      @assets.append_path(@dir.join('app/app/assets/stylesheets'))
      AutoprefixerRails.install(@assets, browsers: ['chrome 25'])
    end

    it "integrates with Sprockets" 


    it "shows file name from Sprockets", not_jruby: true do
      expect { @assets['wrong.css'] }.to raise_error(/wrong/)
    end

    it "supports disabling", not_jruby: true do
      AutoprefixerRails.uninstall(@assets)
      css = @assets['test.css'].to_s
      expect(css).to eq "a {\n" +
                        "    mask: none\n" +
                        "}\n"
    end

  end
end

