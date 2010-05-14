require(File.join(File.dirname(__FILE__), 'lib', 'initialize'))

namespace :db do
  desc "Prepare test data"
  task :prepare do
    SETTINGS["number_of_accounts"].times do |account_id|
      account = Account.fake
      p "account: #{account_id}"
      SETTINGS["items_per_account"].times do |item_id|
        item = Item.fake(:account_id => account_id)
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
  
  desc "Wyszkiwanie"
  task :products_find do
    number_of_products = Product.count - 1
    RBench.run(1) do
    end
  end
  
  
  desc "Wszystkie benchamrki"
  task :all => [:products_find]

end

task :default => ["benchmark:all"]
