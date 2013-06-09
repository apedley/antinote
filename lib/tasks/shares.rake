require 'rake'
namespace :shares do
  desc "destroy shares older than a week"
  task :clean => :environment do
    Share.stale.each { |s| s.destroy }
  end
end
