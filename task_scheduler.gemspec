$:.push File.expand_path("../lib", __FILE__)

require "task_scheduler/version"

Gem::Specification.new do |s|
  s.name        = "task_scheduler"
  s.version     = TaskScheduler::VERSION
  s.authors     = ["Mike Mell"]
  s.email       = ["mike.mell@nthwave.net"]
  s.homepage    = "https://github.com/mmell/task_scheduler"
  s.summary     = "Run local rake tasks triggered by cron, scheduled in the db."
  s.description = "See the README."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0"
  # s.add_dependency "jquery-rails"

end
