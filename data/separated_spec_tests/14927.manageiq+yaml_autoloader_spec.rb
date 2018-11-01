describe Psych::Visitors::ToRuby do
  let(:missing_model) { Rails.root.join("app/models/zzz_model.rb") }

  before do
    File.write(missing_model, "class ZzzModel\nend\n")
  end

  after do
    require 'fileutils'
    FileUtils.rm_f(missing_model)
  end

  it "missing constants during yaml load are autoloaded" 

end

