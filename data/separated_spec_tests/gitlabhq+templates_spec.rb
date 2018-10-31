# frozen_string_literal: true

require 'spec_helper'

describe "CI YML Templates" do
  Gitlab::Template::GitlabCiYmlTemplate.all.each do |template|
    it "#{template.name} should be valid" 

  end
end

