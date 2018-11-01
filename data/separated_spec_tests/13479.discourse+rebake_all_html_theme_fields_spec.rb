require 'rails_helper'

describe Jobs::RebakeAllHtmlThemeFields do
  let(:theme) { Fabricate(:theme) }
  let(:theme_field) { ThemeField.create!(theme: theme, target_id: 0, name: "header", value: "<script>console.log(123)</script>") }

  it 'extracts inline javascripts' 

end

