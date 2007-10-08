require File.expand_path(File.dirname(__FILE__) + '/../../vendor/plugins/rspec/lib') + '/spec/rake/verify_rcov'

namespace :spec do
  desc "Run all specs with rcov"  
  RCov::VerifyTask.new(:verify_rcov => :rcov) do |t|
    t.threshold = 100
    t.index_html = "#{RAILS_ROOT}/coverage/index.html"    
  end
end

desc 'Continuous build target'
task :cruise => ["spec:verify_rcov",:fill_artifacts] do
end

task :patch_rspec do
  sh "patch -p0 < rspec_on_rails_with_edge.diff"
end

task :fill_artifacts => ["spec:verify_rcov","spec:verify_flog",:flog] do
  out = ENV['CC_BUILD_ARTIFACTS']
  mkdir_p out unless File.directory? out if out
  mv 'coverage', "#{out}/coverage" if out
  mv 'tmp/flog', "#{out}/flog" if out
end

task :copy_private do
  cp "#{RAILS_ROOT}/../database.yml", "#{RAILS_ROOT}/config" 
end
