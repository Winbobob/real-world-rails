# frozen_string_literal: true

module QA
  context 'Create' do
    describe 'SSH key support' do
      # Note: If you run this test against GDK make sure you've enabled sshd
      # See: https://gitlab.com/gitlab-org/gitlab-qa/blob/master/docs/run_qa_against_gdk.md

      let(:key_title) { "key for ssh tests #{Time.now.to_f}" }

      it 'user adds an ssh key and pushes code to the repository' 

    end
  end
end

