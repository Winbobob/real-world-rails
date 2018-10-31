describe MiqApache::Control do
  it "should run_apache_cmd with start when calling start" 


  it "should run_apache_cmd with graceful-stop and start when calling restart with graceful true" 


  it "should run_apache_cmd with graceful-stop when calling stop with graceful true" 


  it "should make the apache control log's directory if missing when calling run_apache_cmd" 


  it "should not make the apache control log's directory if it exists when calling run_apache_cmd" 


  it "should build cmdline when calling run_apache_cmd with start" 


  it "should build cmdline when calling run_apache_cmd with start in debug mode if $log is debug" 


  it "should log a warning when calling run_apache_cmd with start that raises an error" 

end

