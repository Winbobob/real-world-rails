require 'rails_helper'

describe CspReportsController do
  describe '#create' do
    before do
      SiteSetting.content_security_policy = true
      SiteSetting.content_security_policy_collect_reports = true

      @orig_logger = Rails.logger
      Rails.logger = @fake_logger = FakeLogger.new
    end

    after do
      Rails.logger = @orig_logger
    end

    def send_report
      post '/csp_reports', params: {
        "csp-report": {
          "document-uri": "http://localhost:3000/",
          "referrer": "",
          "violated-directive": "script-src",
          "effective-directive": "script-src",
          "original-policy": "script-src 'unsafe-eval' www.google-analytics.com; report-uri /csp_reports",
          "disposition": "report",
          "blocked-uri": "http://suspicio.us/assets.js",
          "line-number": 25,
          "source-file": "http://localhost:3000/",
          "status-code": 200,
          "script-sample": ""
        }
      }.to_json, headers: { "Content-Type": "application/csp-report" }
    end

    it 'is enabled by SiteSetting' 


    it 'logs the violation report' 

  end
end

