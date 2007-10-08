namespace :spec do
  desc "Verify flog treshold"
  task :verify_flog do
    threshold = (ENV['FLOG_THRESHOLD'] || 120).to_i
    result = IO.popen('flog app lib 2>/dev/null | grep "(" |  head -n 1').readlines.join('')
    result =~ /\((.*)\)/
    flog = $1.to_f
    result =~ /^(.*):/
    method = $1
    if flog > threshold
      raise "FLOG failed for #{method} with score of #{flog} (threshold is #{threshold})."
    end  
    puts "FLOG passed, with highest score being #{flog} for #{method}."
  end
end

def flog(output, *directories)
   out = "#{RAILS_ROOT}/tmp/flog"
   mkdir_p out unless File.directory? out if out   
  `find #{directories.join(" ")} -name \\*.rb|xargs flog > #{RAILS_ROOT}/tmp/flog/#{output}.txt`
  `echo "<html><body><a href='#{output}.txt'>all text</a></body></html>" > #{RAILS_ROOT}/tmp/flog/index.html`    
end

desc "Flog models, controller, helpers and lib"
task :flog do
  flog "all", *%w[app/models app/controllers app/helpers lib]
end

namespace :flog do
  desc "Flog code in app/models"
  task :models do
    flog "models", "app/models"
  end
  
  desc "Flog code in app/controllers"  
  task :controllers do
    flog "controllers", "app/controllers"
  end
  
  desc "Flog code in app/helpers"  
  task :helpers do
    flog "helpers", "app/helpers"
  end
  
  desc "Flog code in lib"  
  task :lib do
    flog "lib", "lib"
  end
end