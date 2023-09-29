class CreatorArtist < ApplicationRecord
   
    has_secure_password
    has_many :sent_messages, class_name: 'Message', as: :sender
    has_many :received_messages, class_name: 'Message', as: :receiver
    
end
