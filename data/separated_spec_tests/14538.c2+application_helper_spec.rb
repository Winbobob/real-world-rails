describe ApplicationHelper do
  before do
    controller.singleton_class.class_eval do
      protected
      def current_user
        FactoryGirl.create(:user, first_name: "")
      end
      helper_method :current_user
    end
  end
  describe "#display_profile_warning?" do
    it "detects need for profile warning" 

  end
end

