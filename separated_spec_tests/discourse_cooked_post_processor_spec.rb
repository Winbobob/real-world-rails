require "rails_helper"
require "cooked_post_processor"

describe CookedPostProcessor do

  context ".post_process" do

    let(:post) { build(:post) }
    let(:cpp) { CookedPostProcessor.new(post) }
    let(:post_process) { sequence("post_process") }

    it "post process in sequence" 


  end

  context "cooking options" do
    context "regular user" do
      let(:post) { Fabricate(:post) }

      it "doesn't omit nofollow" 

    end

    context "admin user" do
      let(:post) { Fabricate(:post, user: Fabricate(:admin)) }

      it "omits nofollow" 

    end
  end

  context ".keep_reverse_index_up_to_date" do
    let(:video_upload) { Fabricate(:upload, url: '/uploads/default/1/1234567890123456.mp4') }
    let(:image_upload) { Fabricate(:upload, url: '/uploads/default/1/1234567890123456.jpg') }
    let(:audio_upload) { Fabricate(:upload, url: '/uploads/default/1/1234567890123456.ogg') }
    let(:attachment_upload) { Fabricate(:upload, url: '/uploads/default/1/1234567890123456.csv') }

    let(:raw) do
      <<~RAW
      <a href="#{attachment_upload.url}">Link</a>
      <img src="#{image_upload.url}">

      <video width="100%" height="100%" controls>
        <source src="http://myforum.com#{video_upload.url}">
        <a href="http://myforum.com#{video_upload.url}">http://myforum.com#{video_upload.url}</a>
      </video>

      <audio controls>
        <source src="http://myforum.com#{audio_upload.url}">
        <a href="http://myforum.com#{audio_upload.url}">http://myforum.com#{audio_upload.url}</a>
      </audio>
      RAW
    end

    let(:post) { Fabricate(:post, raw: raw) }
    let(:cpp) { CookedPostProcessor.new(post) }

    it "finds all the uploads in the post" 


    it "cleans the reverse index up for the current post" 


  end

  context ".post_process_images" do

    shared_examples "leave dimensions alone" do
      it "doesn't use them" 

    end

    context "with image_sizes" do
      let(:post) { Fabricate(:post_with_image_urls) }
      let(:cpp) { CookedPostProcessor.new(post, image_sizes: image_sizes) }

      before { cpp.post_process_images }

      context "valid" do
        let(:image_sizes) { { "http://foo.bar/image.png" => { "width" => 111, "height" => 222 } } }

        it "uses them" 

      end

      context "invalid width" do
        let(:image_sizes) { { "http://foo.bar/image.png" => { "width" => 0, "height" => 222 } } }
        include_examples "leave dimensions alone"
      end

      context "invalid height" do
        let(:image_sizes) { { "http://foo.bar/image.png" => { "width" => 111, "height" => 0 } } }
        include_examples "leave dimensions alone"
      end

      context "invalid width & height" do
        let(:image_sizes) { { "http://foo.bar/image.png" => { "width" => 0, "height" => 0 } } }
        include_examples "leave dimensions alone"
      end

    end

    context "with unsized images" do

      let(:post) { Fabricate(:post_with_unsized_images) }
      let(:cpp) { CookedPostProcessor.new(post) }

      it "adds the width and height to images that don't have them" 


    end

    context "with large images" do

      let(:upload) { Fabricate(:upload) }
      let(:post) { Fabricate(:post_with_large_image) }
      let(:cpp) { CookedPostProcessor.new(post) }

      before do
        SiteSetting.max_image_height = 2000
        SiteSetting.create_thumbnails = true

        Upload.expects(:get_from_url).returns(upload)
        FastImage.expects(:size).returns([1750, 2000])
        OptimizedImage.expects(:resize).returns(true)

        FileStore::BaseStore.any_instance.expects(:get_depth_for).returns(0)
      end

      it "generates overlay information" 


    end

    context "with tall images" do

      let(:upload) { Fabricate(:upload) }
      let(:post) { Fabricate(:post_with_large_image) }
      let(:cpp) { CookedPostProcessor.new(post) }

      before do
        SiteSetting.create_thumbnails = true

        Upload.expects(:get_from_url).returns(upload)
        FastImage.expects(:size).returns([860, 2000])
        OptimizedImage.expects(:resize).never
        OptimizedImage.expects(:crop).returns(true)

        FileStore::BaseStore.any_instance.expects(:get_depth_for).returns(0)
      end

      it "crops the image" 


    end

    context "with iPhone X screenshots" do

      let(:upload) { Fabricate(:upload) }
      let(:post) { Fabricate(:post_with_large_image) }
      let(:cpp) { CookedPostProcessor.new(post) }

      before do
        SiteSetting.create_thumbnails = true

        Upload.expects(:get_from_url).returns(upload)
        FastImage.expects(:size).returns([1125, 2436])
        OptimizedImage.expects(:resize).returns(true)
        OptimizedImage.expects(:crop).never

        FileStore::BaseStore.any_instance.expects(:get_depth_for).returns(0)
      end

      it "crops the image" 


    end

    context "with large images when using subfolders" do

      let(:upload) { Fabricate(:upload) }
      let(:post) { Fabricate(:post_with_large_image_on_subfolder) }
      let(:cpp) { CookedPostProcessor.new(post) }
      let(:base_url) { "http://test.localhost/subfolder" }
      let(:base_uri) { "/subfolder" }

      before do
        SiteSetting.max_image_height = 2000
        SiteSetting.create_thumbnails = true
        Discourse.stubs(:base_url).returns(base_url)
        Discourse.stubs(:base_uri).returns(base_uri)

        Upload.expects(:get_from_url).returns(upload)
        FastImage.expects(:size).returns([1750, 2000])
        OptimizedImage.expects(:resize).returns(true)

        FileStore::BaseStore.any_instance.expects(:get_depth_for).returns(0)
      end

      it "generates overlay information" 


      it "should escape the filename" 


    end

    context "with title" do

      let(:upload) { Fabricate(:upload) }
      let(:post) { Fabricate(:post_with_large_image_and_title) }
      let(:cpp) { CookedPostProcessor.new(post) }

      before do
        SiteSetting.max_image_height = 2000
        SiteSetting.create_thumbnails = true

        Upload.expects(:get_from_url).returns(upload)
        FastImage.expects(:size).returns([1750, 2000])
        OptimizedImage.expects(:resize).returns(true)

        FileStore::BaseStore.any_instance.expects(:get_depth_for).returns(0)
      end

      it "generates overlay information" 


    end

    context "topic image" do
      let(:topic) { build(:topic, id: 1) }
      let(:post) { Fabricate(:post_with_uploaded_image, topic: topic) }
      let(:cpp) { CookedPostProcessor.new(post) }

      it "adds a topic image if there's one in the first post" 

    end

    context "post image" do
      let(:reply) { Fabricate(:post_with_uploaded_image, post_number: 2) }
      let(:cpp) { CookedPostProcessor.new(reply) }

      it "adds a post image if there's one in the post" 

    end

  end

  context ".extract_images" do

    let(:post) { build(:post_with_plenty_of_images) }
    let(:cpp) { CookedPostProcessor.new(post) }

    it "does not extract emojis or images inside oneboxes or quotes" 


  end

  context ".get_size_from_attributes" do

    let(:post) { build(:post) }
    let(:cpp) { CookedPostProcessor.new(post) }

    it "returns the size when width and height are specified" 


    it "returns the size when width and height are floats" 


    it "resizes when only width is specified" 


    it "resizes when only height is specified" 


    it "doesn't raise an error with a weird url" 


  end

  context ".get_size_from_image_sizes" do

    let(:post) { build(:post) }
    let(:cpp) { CookedPostProcessor.new(post) }

    it "returns the size" 


  end

  context ".get_size" do

    let(:post) { build(:post) }
    let(:cpp) { CookedPostProcessor.new(post) }

    it "ensures urls are absolute" 


    it "ensures urls have a default scheme" 


    it "caches the results" 


    context "when crawl_images is disabled" do

      before do
        SiteSetting.crawl_images = false
      end

      it "doesn't call FastImage" 


      it "is always allowed to crawl our own images" 


      it "returns nil if FastImage can't get the original size" 


    end

  end

  context ".is_valid_image_url?" do

    let(:post) { build(:post) }
    let(:cpp) { CookedPostProcessor.new(post) }

    it "validates HTTP(s) urls" 


    it "doesn't validate other urls" 


    it "doesn't throw an exception with a bad URI" 


  end

  context ".get_filename" do

    let(:post) { build(:post) }
    let(:cpp) { CookedPostProcessor.new(post) }

    it "returns the filename of the src when there is no upload" 


    it "returns the original filename of the upload when there is an upload" 


    it "returns a generic name for pasted images" 


  end

  context ".post_process_oneboxes" do

    let(:post) { build(:post_with_youtube, id: 123) }
    let(:cpp) { CookedPostProcessor.new(post, invalidate_oneboxes: true) }

    before do
      Oneboxer.expects(:onebox)
        .with("http://www.youtube.com/watch?v=9bZkp7q19f0", invalidate_oneboxes: true, user_id: nil, category_id: post.topic.category_id)
        .returns("<div>GANGNAM STYLE</div>")
      cpp.post_process_oneboxes
    end

    it "inserts the onebox without wrapping p" 

  end

  context ".post_process_oneboxes removes nofollow if add_rel_nofollow_to_user_content is disabled" do
    let(:post) { build(:post_with_youtube, id: 123) }
    let(:cpp) { CookedPostProcessor.new(post, invalidate_oneboxes: true) }

    before do
      SiteSetting.add_rel_nofollow_to_user_content = false
      Oneboxer.expects(:onebox)
        .with("http://www.youtube.com/watch?v=9bZkp7q19f0", invalidate_oneboxes: true, user_id: nil, category_id: post.topic.category_id)
        .returns('<aside class="onebox"><a href="https://www.youtube.com/watch?v=9bZkp7q19f0" rel="nofollow noopener">GANGNAM STYLE</a></aside>')
      cpp.post_process_oneboxes
    end

    it "removes nofollow noopener from links" 

  end

  context ".post_process_oneboxes with square image" do

    it "generates a onebox-avatar class" 


  end

  context ".optimize_urls" do

    let(:post) { build(:post_with_uploads_and_links) }
    let(:cpp) { CookedPostProcessor.new(post) }

    it "uses schemaless url for uploads" 


    context "when CDN is enabled" do

      it "uses schemaless CDN url for http uploads" 


      it "doesn't use schemaless CDN url for https uploads" 


      it "doesn't use CDN when login is required" 


      it "doesn't use CDN when preventing anons from downloading files" 


    end

  end

  context ".pull_hotlinked_images" do

    let(:post) { build(:post, created_at: 20.days.ago) }
    let(:cpp) { CookedPostProcessor.new(post) }

    before { cpp.stubs(:available_disk_space).returns(90) }

    it "does not run when download_remote_images_to_local is disabled" 


    context "when download_remote_images_to_local? is enabled" do
      before do
        SiteSetting.download_remote_images_to_local = true
      end

      it "does not run when there is not enough disk space" 


      context "and there is enough disk space" do

        before { cpp.expects(:disable_if_low_on_disk_space).returns(false) }

        it "does not run when the system user updated the post" 


        context "and the post has been updated by an actual user" do

          before { post.id = 42 }

          it "ensures only one job is scheduled right after the editing_grace_period" 


        end

      end

    end

  end

  context ".disable_if_low_on_disk_space" do

    let(:post) { build(:post, created_at: 20.days.ago) }
    let(:cpp) { CookedPostProcessor.new(post) }

    before { cpp.expects(:available_disk_space).returns(50) }

    it "does nothing when there's enough disk space" 


    context "when there's not enough disk space" do

      before { SiteSetting.expects(:download_remote_images_threshold).returns(75) }

      it "disables download_remote_images_threshold and send a notification to the admin" 


    end

  end

  context ".download_remote_images_max_days_old" do

    let(:post) { build(:post, created_at: 20.days.ago) }
    let(:cpp) { CookedPostProcessor.new(post) }

    before do
      SiteSetting.download_remote_images_to_local = true
      cpp.expects(:disable_if_low_on_disk_space).returns(false)
    end

    it "does not run when download_remote_images_max_days_old is not satisfied" 


    it "runs when download_remote_images_max_days_old is satisfied" 

  end

  context ".is_a_hyperlink?" do

    let(:post) { build(:post) }
    let(:cpp) { CookedPostProcessor.new(post) }
    let(:doc) { Nokogiri::HTML::fragment('<body><div><a><img id="linked_image"></a><p><img id="standard_image"></p></div></body>') }

    it "is true when the image is inside a link" 


    it "is false when the image is not inside a link" 


  end

  context "grant badges" do
    let(:cpp) { CookedPostProcessor.new(post) }

    context "emoji inside a quote" do
      let(:post) { Fabricate(:post, raw: "time to eat some sweet \n[quote]\n:candy:\n[/quote]\n mmmm") }

      it "doesn't award a badge when the emoji is in a quote" 

    end

    context "emoji in the text" do
      let(:post) { Fabricate(:post, raw: "time to eat some sweet :candy: mmmm") }

      it "awards a badge for using an emoji" 

    end

    context "onebox" do
      let(:post) { Fabricate(:post, raw: "onebox me:\n\nhttps://www.youtube.com/watch?v=Wji-BZ0oCwg\n") }

      before { Oneboxer.stubs(:onebox) }

      it "awards a badge for using an onebox" 


      it "doesn't award the badge when the badge is disabled" 

    end

    context "reply_by_email" do
      let(:post) { Fabricate(:post, raw: "This is a **reply** via email ;)", via_email: true, post_number: 2) }

      it "awards a badge for replying via email" 

    end

  end

  context "quote processing" do
    let(:cpp) { CookedPostProcessor.new(cp) }
    let(:pp) { Fabricate(:post, raw: "This post is ripe for quoting!") }

    context "with an unmodified quote" do
      let(:cp) do
        Fabricate(
          :post,
          raw: "[quote=\"#{pp.user.username}, post: #{pp.post_number}, topic:#{pp.topic_id}]\nripe for quoting\n[/quote]\ntest"
        )
      end

      it "should not be marked as modified" 

    end

    context "with a modified quote" do
      let(:cp) do
        Fabricate(
          :post,
          raw: "[quote=\"#{pp.user.username}, post: #{pp.post_number}, topic:#{pp.topic_id}]\nmodified\n[/quote]\ntest"
        )
      end

      it "should be marked as modified" 

    end

  end

end

