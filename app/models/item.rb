class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :day, :status, :area, :burden
  has_one_attached :image

  with_options presence: true do
    validates :category_id       
    validates :day_id
    validates :status_id      
    validates :area_id  
    validates :burden_id  
    validates :image
    validates :name
    validates :explanation 
         
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ },
    numericality: { greater_than_or_equal_to: 300 , less_than_or_equal_to: 9_999_999 } do
    validates :price
  end


end
