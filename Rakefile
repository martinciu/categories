require(File.join(File.dirname(__FILE__), 'lib', 'initialize'))

namespace :db do
  desc "Prepare test data"
  task :prepare do
    SETTINGS["number_of_accounts"].times do |account_id|
      account = Account.fake
      p "account: #{account_id}"
      SETTINGS["items_per_account"].times do |item_id|
        item = Item.fake(:account_id =>account.id)
        p "item: #{item_id}"
      end
    end
  end
  
  desc "Test categories"
  task :categories do
    100.times do
      p Category.fake
    end
  end

  desc "Clear database"
  task :clear do
    DatabaseCleaner.clean
  end

  desc "Clear & prepare database"
  task :clear_and_prepare => ["clear", "prepare"]

end

namespace :benchmark do
  
  desc "Lista kategorii"
  task :category_list do
    RBench.run(1) do
      [1].each do |times|
        report "Lista kategorii", times do
        end
      end
    end
  end
  
  desc "Wszystkie benchamrki"
  task :all => [:category_list]

end

task :default => ["benchmark:all"]
