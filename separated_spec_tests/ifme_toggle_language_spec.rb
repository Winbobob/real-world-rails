describe 'ToggleLanguage', js: true do
  let(:user) { create :user }

  feature 'Toggling the locale dropdown to change the language' do
    let(:en_root_title) do
      'if me is a community for mental health experiences'
    end
    let(:es_root_title) do
      'if me es una comunidad para compartir experiencias de salud mental'
    end

    let(:en_signed_in_root_title) { 'Welcome' }
    let(:es_signed_in_root_title) { '¡Adelante!' }

    context 'When on pages that do not require sign in' do
      before { visit(root_path) }

      it 'toggles locale dropdown on the same page' 


      it 'persists locale selection on a different page' 

    end

    context 'When signed out and then signed in' do
      before do
        visit(root_path)
        change_language('en')
      end

      it 'persists locale selection from signed out to signed in state' 

    end

    context 'When signed in and then signed out' do
      before do
        login_as(user)
        visit(root_path)
        change_language('en')
      end

      it 'persists locale selection from signed in to signed out state' 

    end

    context 'When signed in' do
      before do
        login_as(user)
        visit(root_path)
        change_language('en')
      end

      it 'toggles locale selection on the same page' 


      it 'persists locale selection on a different page' 

    end
  end
end

