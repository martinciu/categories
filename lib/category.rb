class Category
  def self.fake()
    root_category = rand(SETTINGS['number_of_root_categories'])
    categories = []
    (rand(SETTINGS['max_category_depth'])+3).times.each do |num|
      categories << "category #{root_category+1}.#{rand(10)+1}"
    end
    categories.join("/")
  end
end