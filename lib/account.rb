class Account
  include MongoMapper::Document

  key :name, String
  timestamps!

  many :items
  
  def self.fake(attributes = {})
    self.create({:name => Faker::Name.name}.merge(attributes))
  end
  
end
