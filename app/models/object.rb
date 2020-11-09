class UserObject
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :municipality, 
                :house_number, :building_name, :phone_number
                
  
with_options presence: true do
   validates :postal_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
   validates :municipality,  format: { with: /\A[ぁ-んァ-ン一-龥]/}
   validates :house_number,  format: { with: /\A[ぁ-んァ-ン一-龥]/}
   validates :phone_number,  format: {with: /\A\d{10,11}\z/}
  
end


  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, user_id: user_id)
  end
end
