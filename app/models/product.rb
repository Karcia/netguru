class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :price
  validates :price, format: { with: /\A\d+\.*\d{0,2}\z/, message: "only allows two decimal" }
  validates_presence_of :description
  validates_presence_of :title

end
# /^\d+\.*\d{0,2}$/