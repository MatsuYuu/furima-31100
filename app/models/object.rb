class Object < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :municipality, 
                :house_number, :building_name, :phone_number
                
  
with_options presence: true do
   validates :postal_code
   validates :prefecture_id
   validates :municipality
   validates :house_number
   validates :building_name
   validates :phone_number
  
end


  def save
    
  end
end
