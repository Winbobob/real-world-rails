require "spec_helper"

def data_object_create_edit_variables_should_be_assigned
  assigns[:data_object].should be_a(DataObject)
  assigns[:toc_items].should_not be_nil
  assigns[:toc_items].first.should be_a(TocItem)
  assigns[:toc_items].select{|ti| ti.id == assigns[:selected_toc_item_id]}.first.should be_a(TocItem)
  assigns[:languages].first.should be_a(Language)
  assigns[:licenses].first.should be_a(License)
  assigns[:page_title].should be_a(String)
  assigns[:page_description].should be_a(String)
end

describe DataObjectsController do
  before(:all) do
    load_foundation_cache
    @taxon_concept = TaxonConcept.gen
    @user = User.gen
    @udo = @taxon_concept.add_user_submitted_text(:user => @user)
    Visibility.create_enumerated
    Vetted.create_enumerated
  end

  describe 'GET delete' do
     before(:all) do
      he1 = HierarchyEntry.gen
      he2 = HierarchyEntry.gen
      @image = DataObject.gen(data_type_id: DataType.image.id, object_cache_url: FactoryGirl.generate(:image))
      @dohe1 = DataObjectsHierarchyEntry.create(hierarchy_entry_id: he1.id, data_object_id: @image.id,
      vetted_id: Vetted.trusted.id, visibility_id: Visibility.visible.id)
      @dohe2 = DataObjectsHierarchyEntry.create(hierarchy_entry_id: he2.id, data_object_id: @image.id,
      vetted_id: Vetted.trusted.id, visibility_id: Visibility.visible.id)
      col1 = Collection.gen
      col2 = Collection.gen
      @ci1 = CollectionItem.gen(collection_id: col1.id, collected_item_id: @image.id, collected_item_type: @image.class.to_s)
      @ci2 = CollectionItem.gen(collection_id: col2.id, collected_item_id: @image.id, collected_item_type: @image.class.to_s)
      
    end
    
    before do
      get :delete, { id: @image.id }
    end
    
    it "should mark data_object as untrusted/hidden for all its' associations" 

    
    it "should mark data_object as unpublished" 

    it "should remove all collection_items that contains this data_object" 

  end
  
  # GET /pages/:taxon_id/data_objects/new
  describe 'GET new' do
    it 'should render new if logged in' 

  end

  describe 'POST create' do
    it 'should instantiate references' 

    it 'should re-render new if model validation fails' 

    it 'should create Link objects and prefix URLs with http://' 

    it 'fails validation on invalid link URLs' 


       it 'fails when a duplicate text is added' do 
       dato = { toc_items: { id: TocItem.overview.id.to_s },  data_type_id: DataType.text.id.to_s,
               object_title: "title", language_id: Language.english.id.to_s,
               description: "text" }
       post :create, { taxon_id: @taxon_concept.id,
                      data_object: dato },{ user: @user, user_id: @user.id }
       post :create, { taxon_id: @taxon_concept.id, 
                      data_object: dato },{ user: @user, user_id: @user.id }
      expect(flash[:notice]).to eq(I18n.t(:duplicate_text_warning))
      expect(response).to render_template(:new)
    end
    it 'passes when a non-duplicate text is added' 

  end

  describe 'GET edit' do
    it 'should not allow access to user who do not own the users data object' 

    it 'should only render edit users data object of data type text and owned by current user' 

  end

  describe 'PUT update' do
    it 'should re-render edit if validation fails' 

    it 'should create a new data object revision'
  end

  describe 'GET crop' do
    before(:each) do
      @image = DataObject.gen(:data_type_id => DataType.image.id, :object_cache_url => FactoryGirl.generate(:image))
    end

    it 'should not allow access to non-curators' 


    it 'should allow access to curators' 

  end

  describe 'GET reindex' do 
    before(:all) do
      @dato = DataObject.gen(data_type_id: DataType.image.id, object_cache_url: FactoryGirl.generate(:image))
    end

    context 'allows reindexing' do 
      it 'allows access to admins' 


      it 'allows access to master curators' 

    end

   context 'does not allow reindexing' do 
     it 'does not allow access to non-master curators/non-admins' 

    end
  end
end

