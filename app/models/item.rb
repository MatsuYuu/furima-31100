class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :status
  belongs_to :area
  belongs_to :burden
  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id, inclusion: { in: 2..14 }
    validates :day_id,      inclusion: { in: 2..4 }
    validates :status_id, inclusion: { in: 2..7 }
    validates :area_id, inclusion: { in: 2..48 }
    validates :burden_id, inclusion: { in: 2..3 }
    validates :price, format: { with: /\A[0-9]+\z/ }
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, messeage: 'Price must be greater than or equal to 300' }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999, messeage: 'Price must be less than or equal to 9999999' }
end
