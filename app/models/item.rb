class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :day, :status, :area, :burden

  with_options presence: true do
    validates :category       
    validates :day
    validates :status       
    validates :area  
    validates :burden         
  end

  has_one_attached :image

end
