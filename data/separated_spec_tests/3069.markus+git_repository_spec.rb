describe GitRepository do
  context 'writes to repository permissions file' do

    before :all do
      GitRepository.send :__update_permissions, { mock_repo: [:student1, :student2] }, ['admin1']
    end

    after :all do
      FileUtils.rm MarkusConfigurator.markus_config_repository_permission_file
    end

    let(:file_contents) { File.read(MarkusConfigurator.markus_config_repository_permission_file).lines.map(&:chomp) }

    it 'give admins access to all repos' 


    it 'gives other users access to specific repos' 

  end
end

