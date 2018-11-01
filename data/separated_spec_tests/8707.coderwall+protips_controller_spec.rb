RSpec.describe ProtipsController, type: :controller do
  let(:current_user) { Fabricate(:user) }

  before { controller.send :sign_in, current_user }

  def valid_attributes
    {
      title: 'hello world',
      body: "somethings that's meaningful and nice",
      topic_list: "java, javascript",
      user_id: current_user.id
    }
  end

  describe 'GET user' do
    describe 'banned' do
      it 'should assign user @protips for page, despite not being in search index' 

    end

    describe 'not banned' do
      it 'should assign user @protips for page' 

    end
  end

  # describe "GET topic" do
  #   it "assigns all protips as @protips" do
  #     Protip.rebuild_index
  #     protip = Protip.create! valid_attributes
  #     get :topic, {tags: "java"}
  #     expect(assigns(:protips).results.first.title).to eq(protip.title)
  #   end
  # end

  describe 'GET show using public_id' do
    it 'redirects to GET show if slug is empty' 


    it 'redirects to GET show if slug is invalid' 

  end

  describe 'GET show using slug' do
    it 'assigns the requested protip as @protip' 

  end

  describe 'GET new' do
    before { allow_any_instance_of(User).to receive(:skills).and_return(['skill']) } # User must have a skill to create protips

    it 'assigns a new protip as @protip' 


    it 'allows viewing the page when you have a skill' 


    it "prevents viewing the page when you don't have a skill" 

  end

  describe 'GET edit' do
    it 'assigns the requested protip as @protip' 

  end

  describe 'POST create' do
    before { allow_any_instance_of(User).to receive(:skills).and_return(['skill']) } # User must have a skill to create protips

    describe 'with valid params' do
      it 'creates a new Protip' 


      it 'assigns a newly created protip as @protip' 


      it 'redirects to the created protip' 

    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved protip as @protip' 


      it "re-renders the 'new' template" 

    end

    it "prevents creating when you don't have a skill" 

  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested protip' 


      it 'assigns the requested protip as @protip' 


      it 'redirects to the protip' 

    end

    describe 'with invalid params' do
      it 'assigns the protip as @protip' 


      it "re-renders the 'edit' template" 

    end
  end

  describe 'DELETE destroy' do
    it 'returns forbidden if current user not owner' 


    it 'destroys the requested protip' 


    it 'redirects to the protips list' 

  end

end

