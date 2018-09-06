require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170612071012_move_personal_snippets_files.rb')

describe MovePersonalSnippetsFiles do
  let(:migration) { described_class.new }
  let(:test_dir) { File.join(Rails.root, "tmp", "tests", "move_snippet_files_test") }
  let(:uploads_dir) { File.join(test_dir, 'uploads') }
  let(:new_uploads_dir) { File.join(uploads_dir, '-', 'system') }

  before do
    allow(CarrierWave).to receive(:root).and_return(test_dir)
    allow(migration).to receive(:base_directory).and_return(test_dir)
    FileUtils.remove_dir(test_dir) if File.directory?(test_dir)
    allow(migration).to receive(:say)
  end

  describe "#up" do
    let(:snippet) do
      snippet = create(:personal_snippet) # rubocop:disable RSpec/FactoriesInMigrationSpecs
      create_upload('picture.jpg', snippet)
      snippet.update(description: markdown_linking_file('picture.jpg', snippet))
      snippet
    end

    let(:snippet_with_missing_file) do
      snippet = create(:snippet) # rubocop:disable RSpec/FactoriesInMigrationSpecs
      create_upload('picture.jpg', snippet, create_file: false)
      snippet.update(description: markdown_linking_file('picture.jpg', snippet))
      snippet
    end

    it 'moves the files' 


    describe 'updating the markdown' do
      it 'includes the new path when the file exists' 


      it 'does not update the markdown when the file is missing' 


      it 'updates the note markdown' 

    end
  end

  describe "#down" do
    let(:snippet) do
      snippet = create(:personal_snippet) # rubocop:disable RSpec/FactoriesInMigrationSpecs
      create_upload('picture.jpg', snippet, in_new_path: true)
      snippet.update(description: markdown_linking_file('picture.jpg', snippet, in_new_path: true))
      snippet
    end

    let(:snippet_with_missing_file) do
      snippet = create(:personal_snippet) # rubocop:disable RSpec/FactoriesInMigrationSpecs
      create_upload('picture.jpg', snippet, create_file: false, in_new_path: true)
      snippet.update(description: markdown_linking_file('picture.jpg', snippet, in_new_path: true))
      snippet
    end

    it 'moves the files' 


    describe 'updating the markdown' do
      it 'includes the new path when the file exists' 


      it 'keeps the markdown as is when the file is missing' 


      it 'updates the note markdown' 

    end
  end

  describe '#update_markdown' do
    it 'escapes sql in the snippet description' 

  end

  def create_upload(filename, snippet, create_file: true, in_new_path: false)
    secret = "secret#{snippet.id}"
    absolute_path = if in_new_path
                      File.join(new_uploads_dir, model_file_path(filename, snippet))
                    else
                      File.join(uploads_dir, model_file_path(filename, snippet))
                    end

    if create_file
      FileUtils.mkdir_p(File.dirname(absolute_path))
      FileUtils.touch(absolute_path)
    end

    create(:upload, model: snippet, path: "#{secret}/#{filename}", uploader: PersonalFileUploader) # rubocop:disable RSpec/FactoriesInMigrationSpecs
  end

  def markdown_linking_file(filename, snippet, in_new_path: false)
    markdown =  "![#{filename.split('.')[0]}]"
    markdown += '(/uploads'
    markdown += '/-/system' if in_new_path
    markdown += "/#{model_file_path(filename, snippet)})"
    markdown
  end

  def model_file_path(filename, snippet)
    secret = "secret#{snippet.id}"

    File.join('personal_snippet', snippet.id.to_s, secret, filename)
  end
end

