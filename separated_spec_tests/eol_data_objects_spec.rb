# encoding: utf-8
require "spec_helper"

# TODO - these specs only pass when they're all passing. If one fails, the data isn't reset.

def review_status_should_be(id, vetted, visible, options = {})
  page.body.should have_tag("form.review_status") do
    with_tag("select option[selected=selected]", text: vetted)
    with_tag("select option[selected=selected]", text: visible)
    if options.has_key? :duplicate
      if options[:duplicate]
        with_tag("input[id='#{id}_untrust_reason_duplicate'][checked]")
      else
        without_tag("input[id='#{id}_untrust_reason_duplicate'][checked]")
      end
    end
    if options.has_key? :poor
      if options[:poor]
        with_tag("input[id='#{id}_untrust_reason_poor'][checked]")
      else
        without_tag("input[id='#{id}_untrust_reason_poor'][checked]")
      end
    end
    if options.has_key? :incorrect
      if options[:incorrect]
        with_tag("input[id='#{id}_untrust_reason_incorrect'][checked]")
      else
        without_tag("input[id='#{id}_untrust_reason_incorrect'][checked]")
      end
    end
    if options.has_key? :misidentified
      if options[:misidentified]
        with_tag("input[id='#{id}_untrust_reason_misidentified'][checked]")
      else
        without_tag("input[id='#{id}_untrust_reason_misidentified'][checked]")
      end
    end
  end
end

describe 'Data Object Page' do

  # TODO - this is REALLY slow. Try to reduce the number of TCs, or fix that method.
  before(:all) do
    load_foundation_cache
    # Somewhat empty, to speed things up:
    @tc = build_taxon_concept(images: [object_cache_url: FactoryGirl.generate(:image)], toc: [],
                              comments: [], bhl: [], sounds: [], youtube: [], flash: [])
    @extra_name = 'Annuvvahnaemforyoo'
    @extra_tc = build_taxon_concept(images: [], toc: [], scientific_name: @extra_name,
                                    comments: [], bhl: [], sounds: [], youtube: [], flash: [])
    @single_name = 'Singularusnamicus'
    @singular_tc = build_taxon_concept(images: [], toc: [], scientific_name: @single_name,
                                       comments: [], bhl: [], sounds: [], youtube: [], flash: [])
    @singular_he = @singular_tc.entry
    @name_to_add = 'Addthisnametomeplease'
    @to_add_tc = build_taxon_concept(images: [], toc: [], scientific_name: @name_to_add,
                                     comments: [], bhl: [], sounds: [], youtube: [], flash: [])
    @assistant_curator = build_curator(@tc, level: :assistant)
    @full_curator = build_curator(@tc, level: :full)
    @master_curator = build_curator(@tc, level: :master)
    @admin = User.gen(admin: 1)
    @image = @tc.data_objects.select { |d| d.data_type.label == "Image" }[0]
    @extra_he = @extra_tc.entry
    @assistants_entry = build_taxon_concept(images: [], toc: [],
                                            comments: [], bhl: [], sounds: [], youtube: [], flash: []).entry

    @dato_no_comments = build_data_object('Image', 'No comments',
    num_comments: 0,
    object_cache_url: FactoryGirl.generate(:image),
    vetted: Vetted.trusted,
    visibility: Visibility.visible)
    @dato_comments_no_pagination = build_data_object('Image', 'Some comments',
    num_comments: 4,
    object_cache_url: FactoryGirl.generate(:image),
    vetted: Vetted.trusted,
    visibility: Visibility.visible)
    @dato_comments_with_pagination = build_data_object('Image', 'Lots of comments',
    num_comments: 15,
    object_cache_url: FactoryGirl.generate(:image),
    vetted: Vetted.trusted,
    visibility: Visibility.visible)
    @dato_untrusted = build_data_object('Image', 'removed',
    num_comments: 0,
    object_cache_url: FactoryGirl.generate(:image),
    vetted: Vetted.untrusted,
    visibility: Visibility.invisible)
    @user_submitted_text = @tc.add_user_submitted_text(user: @full_curator)
    @user = User.gen
    EOL::Solr::SiteSearchCoreRebuilder.begin_rebuild
  end

  # TODO - this is slow. Find out why.
  before(:each) do
    DataObjectsHierarchyEntry.where(data_object_id: @image.id).update_all(visibility_id: Visibility.visible.id)
    @image.add_curated_association(@full_curator, @extra_he)
    @image.data_objects_hierarchy_entries.first.update_attributes(:vetted_id => Vetted.trusted.id)
    @image.data_objects_hierarchy_entries.first.show(@full_curator)
    @image.curated_data_objects_hierarchy_entries.each do |assoc|
      next if assoc.hierarchy_entry_id == @extra_he.id # Keep this one.
      @image.remove_curated_association(assoc.user, assoc.hierarchy_entry) if # ...only if it's real:
        CuratedDataObjectsHierarchyEntry.find_by_data_object_guid_and_hierarchy_entry_id(assoc.data_object_guid,
                                                                                         assoc.hierarchy_entry_id)
    end
  end

  it "should render" 


  it "should show data object attribution" 


  it "should show image description for image objects" 


  it "should not show comments section if there are no comments (obsolete?)" 


  it "should not show pagination if there are less than 10 comments (waiting on feed items adjustments)"

  it "should show pagination if there are more than 10 comments (waiting on feed items adjustments)"

  # TODO - this should open the data object page, NOT the overview page!
  it "should have a taxon_concept link for untrusted image, but following the link should show a warning"

  it "should not show a link for data_object if its taxon page is not in database anymore" 


  it 'should allow a curator to add an association' 


  it 'should show proper vetted & visibility statuses of associations to the anonymous users' 


  # TODO - Hi there. You'll notice the next few specs are quite redundant. Do you see a way to generalize them?
  # Thanks for your consideration,
  # The management.

  it 'should be able curate a DOHE association as Unreviewed, Untrusted and Trusted' 


  it 'should be able curate a CDOHE association as Unreviewed, Untrusted and Trusted' 


  it 'should be able curate a UDO association as Unreviewed, Untrusted and Trusted' 


  it 'should not allow assistant curators to remove curated associations' 


  it 'should allow a full curators to remove self added associations' 


  it 'should allow a master curator to remove curated associations' 


  it 'should allow logged in users to rate' 


  it 'should allow logged in users to post a comment' 


  it "should not show copyright symbol for public domain objects" 


  it 'should save owner as rights holder(if not specified) while editing an article' 


  it "should link agents to their homepage, and add http if the link does not include it" 


  it "should allow assistant curators to add and/or remove associations, but not to curate them" 


  it "should allow data object owners to add and/or remove associations, but not to curate them" 


  it "should show associations in preview mode, but not be able to curate them" 


  it 'should not allow a curator to add an association which already exists' 


  it 'should link image on the image data object page to it\'s original version' 


  it 'should not show an image cropping tool to non-admins' 


  it 'should show admins an image cropping tool' 


  it 'should use the resource rights holder if the data object doesnt have one' 


  it 'should use the resource rights statement if the data object doesnt have one' 


  it 'should use the resource bibliographic citation if the data object doesnt have one' 


  it 'should preserve data rating when editing' 


  it 'should not show a description if there isnt one' 


  it 'should show references and identifiers' 


  it 'should not show names from untrusted associations, unless thats is all there is' 


  it 'should change vetted to unreviewed and visibility to visible when self added article is edited by assistant curator/normal user'
  it 'should change vetted to trusted and visibility to visible when self added article is edited by full/master curator or admin'

end

