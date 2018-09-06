require "helper"
require "thor/rake_compat"
require "rake/tasklib"

$main = self

class RakeTask < Rake::TaskLib
  def initialize
    define
  end

  def define
    $main.instance_eval do
      desc "Say it's cool"
      task :cool do
        puts "COOL"
      end

      namespace :hiper_mega do
        task :super do
          puts "HIPER MEGA SUPER"
        end
      end
    end
  end
end

class ThorTask < Thor
  include Thor::RakeCompat
  RakeTask.new
end

describe Thor::RakeCompat do
  it "sets the rakefile application" 


  it "adds rake tasks to thor classes too" 


  it "uses rake tasks descriptions on thor" 


  it "gets usage from rake tasks name" 


  it "uses non namespaced name as description if non is available" 


  it "converts namespaces to classes" 


  it "does not add tasks from higher namespaces in lowers namespaces" 


  it "invoking the thor task invokes the rake task" 

end

