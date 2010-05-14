class Item
  include MongoMapper::Document

  key :name, String
  key :description, String
  key :price, Float
  key :delivery_cost, Float
  key :account_id, Mongo::ObjectID
  key :category, String
  key :parent_categories, Array
  timestamps!

  belongs_to :account

  validates_presence_of :name
  validates_presence_of :price
  validates_numericality_of :price
  
  def initialize(attributes = {})
    attributes[:parent_categories] = []
    (attributes[:category].split("/").count).times do |i|
      attributes[:parent_categories] << attributes[:category].split("/").slice(0, i).join("/") if i>0
    end
    super(attributes)
  end
    
  def self.fake(attributes = {})
    item = Item.create({
      :name              => Faker::Lorem.words(5).join(" "), 
      :price             => rand(10000)/100.0,
      :description       => Faker::Lorem.paragraphs(5).join(" "),
      :delivery_cost     => rand(100)/100.0,
      :account_id        => rand(SETTINGS["number_of_accounts"]),
      :category          => Category.fake
    }.merge(attributes))
    return item
  end
  
end
