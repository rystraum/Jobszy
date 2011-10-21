namespace :db do
  desc "Populate database with fake data"
  task :populate => :environment do
    Rake::Task['db:reseed'].invoke
    100.times { FactoryGirl.create :job }
  end
end

