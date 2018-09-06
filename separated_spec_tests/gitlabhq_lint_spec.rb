require 'spec_helper'

describe 'CI Lint', :js do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  before do
    project.add_developer(user)
    sign_in(user)

    visit project_ci_lint_path(project)
    find('#ci-editor')
    execute_script("ace.edit('ci-editor').setValue(#{yaml_content.to_json});")

    # Ace editor updates a hidden textarea and it happens asynchronously
    wait_for('YAML content') do
      find('.ace_content').text.present?
    end
  end

  describe 'YAML parsing' do
    before do
      click_on 'Validate'
    end

    context 'YAML is correct' do
      let(:yaml_content) do
        File.read(Rails.root.join('spec/support/gitlab_stubs/gitlab_ci.yml'))
      end

      it 'parses Yaml' 

    end

    context 'YAML is incorrect' do
      let(:yaml_content) { 'value: cannot have :' }

      it 'displays information about an error' 

    end

    describe 'YAML revalidate' do
      let(:yaml_content) { 'my yaml content' }

      it 'loads previous YAML content after validation' 

    end
  end

  describe 'YAML clearing' do
    before do
      click_on 'Clear'
    end

    context 'YAML is present' do
      let(:yaml_content) do
        File.read(Rails.root.join('spec/support/gitlab_stubs/gitlab_ci.yml'))
      end

      it 'YAML content is cleared' 

    end
  end
end

