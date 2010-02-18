class Category < ActiveRecord::Base
  has_many :images, :foreign_key => "category_id"
end
