class BuyItem
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
    user = User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, lase_name: lase_name, first_name: first_name, lase_name_kana: lase_name_kana, first_name_kana: first_name_kana, birth_date: birth_date)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, user_id: user_id)
  end
end
