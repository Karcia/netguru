class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :price
  validates :price, format: { with: /\A\d+\.*\d{0,2}\z/, message: "only allows two decimal" }
  validates_presence_of :description
  validates_presence_of :title

  def average_rating_full
  	ratings = []
  	reviews.each do |r|
  		ratings << r.rating
  	end
  	sum = 0
  	ratings.each do |ra|
  		sum += ra
  	end
	sum.to_f / ratings.count
  end

  def average_rating
  	sum = reviews.collect{|r| r.rating}.inject(:+)
  	sum.to_f / reviews.count
  end
end