if defined?(JRUBY_VERSION) && ENV['TEST_NO_UNSAFE']
  # to be used like this: rake test TEST_NO_UNSAFE=true
  load 'test/package.jar'
  java_import 'thread_safe.SecurityManager'
  manager = SecurityManager.new

  # Prevent accessing internal classes
  manager.deny(java.lang.RuntimePermission.new('accessClassInPackage.sun.misc'))
  java.lang.System.setSecurityManager(manager)

  module ThreadSafe
    describe 'no_unsafe' do
      it 'security_manager_is_used' 


      it 'no_unsafe_version_of_chmv8_is_used' 

    end
  end
end

