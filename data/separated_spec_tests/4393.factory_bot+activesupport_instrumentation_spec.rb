unless ActiveSupport::Notifications.respond_to?(:subscribed)
  module SubscribedBehavior
    def subscribed(callback, *args)
      subscriber = subscribe(*args, &callback)
      yield
    ensure
      unsubscribe(subscriber)
    end
  end

  ActiveSupport::Notifications.extend SubscribedBehavior
end

describe "using ActiveSupport::Instrumentation to track factory interaction" do
  let(:slow_user_factory) { FactoryBot.factory_by_name("slow_user") }
  let(:user_factory) { FactoryBot.factory_by_name("user") }
  before do
    define_model("User", email: :string)
    FactoryBot.define do
      factory :user do
        email { "john@example.com" }

        factory :slow_user do
          after(:build) { Kernel.sleep(0.1) }
        end
      end
    end
  end

  it "tracks proper time of creating the record" 


  it "builds the correct payload" 

end

