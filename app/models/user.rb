class User < ApplicationRecord
  has_many :reviews
  extend DisplayList
  extend SwitchFlg
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable #←confirmableを追加

         acts_as_liker

         scope :search_information, -> (keyword) { 
               where("name like ?","%#{keyword}%").
               or(where("email like ?","%#{keyword}%")).
               or(where("address like ?","%#{keyword}%")).
               or(where("postal_code like ?","%#{keyword}%")).
               or(where("phone like ?","%#{keyword}%")).
               or(where("id ?","%#{keyword}%"))
             }
end
