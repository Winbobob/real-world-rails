require 'spec_helper'
require 'rainbow/ext/string'

RSpec.describe 'String mixin' do
  before do
    Rainbow.enabled = true
  end

  it 'proxies foreground to Rainbow().foreground' 


  it 'proxies color to Rainbow().color' 


  it 'proxies x11 color to Rainbow().color' 


  it 'proxies colour to Rainbow().colour' 


  it 'proxies background to Rainbow().background' 


  it 'proxies bright to Rainbow().bright' 


  it 'proxies faint to Rainbow().faint' 


  it 'proxies italic to Rainbow().italic' 


  it 'proxies underline to Rainbow().underline' 


  it 'proxies blink to Rainbow().blink' 


  it 'proxies inverse to Rainbow().inverse' 


  it 'proxies hide to Rainbow().hide' 


  it 'proxies reset to Rainbow().reset' 


  context "when Rainbow is disabled" do
    before do
      Rainbow.enabled = false
    end

    it "allows chaining but doesn't wrap with escape codes" 

  end
end

