require 'rails_helper'

RSpec.describe ApplicationController do
  describe '#redirect_to_login_if_required' do
    let(:admin) { Fabricate(:admin) }

    before do
      admin  # to skip welcome wizard at home page `/`
      SiteSetting.login_required = true
    end

    it "should carry-forward authComplete param to login page redirect" 

  end

  describe 'invalid request params' do
    before do
      @old_logger = Rails.logger
      @logs = StringIO.new
      Rails.logger = Logger.new(@logs)
    end

    after do
      Rails.logger = @old_logger
    end

    it 'should not raise a 500 (nor should it log a warning) for bad params' 

  end

  describe 'missing required param' do
    it 'should return a 400' 

  end

  describe 'build_not_found_page' do
    describe 'topic not found' do

      it 'should not redirect to permalink if topic/category does not exist' 


      it 'should return permalink for deleted topics' 


      it 'supports subfolder with permalinks' 


      it 'should return 404 and show Google search' 


      it 'should not include Google search if login_required is enabled' 

    end
  end

  describe "#handle_theme" do
    let(:theme) { Fabricate(:theme, user_selectable: true) }
    let(:theme2) { Fabricate(:theme, user_selectable: true) }
    let(:non_selectable_theme) { Fabricate(:theme, user_selectable: false) }
    let(:user) { Fabricate(:user) }
    let(:admin) { Fabricate(:admin) }

    before do
      sign_in(user)
    end

    it "selects the theme the user has selected" 


    it "can be overridden with a cookie" 


    it "falls back to the default theme when the user has no cookies or preferences" 


    it "can be overridden with preview_theme_id param" 


    it "does not allow non privileged user to preview themes" 


    it "cookie can fail back to user if out of sync" 

  end

  describe 'Content Security Policy' do
    it 'is enabled by SiteSettings' 


    it 'can be customized with SiteSetting' 


    it 'does not set CSP when responding to non-HTML' 


    it 'does not set CSP for /logs' 


    def parse(csp_string)
      csp_string.split(';').map do |policy|
        directive, *sources = policy.split
        [directive, sources]
      end.to_h
    end
  end
end

