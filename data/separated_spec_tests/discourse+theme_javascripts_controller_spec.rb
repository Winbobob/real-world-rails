# frozen_string_literal: true
require 'rails_helper'

describe ThemeJavascriptsController do
  let(:theme) { Fabricate(:theme) }
  let(:theme_field) { ThemeField.create!(theme: theme, target_id: 0, name: "header", value: "<a>html</a>") }
  let(:javascript_cache) { JavascriptCache.create!(content: 'console.log("hello");', theme_field: theme_field) }

  describe '#show' do
    def update_digest_and_get(digest)
      # actually set digest to make sure 404 is raised by router
      javascript_cache.update_attributes(digest: digest)

      get "/theme-javascripts/#{digest}.js"
    end

    it 'only accepts 40-char hexdecimal digest name' 


    it 'considers the database record as the source of truth' 


    def clear_disk_cache
      `rm #{ThemeJavascriptsController::DISK_CACHE_PATH}/*`
    end
  end
end

