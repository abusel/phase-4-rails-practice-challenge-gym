class Membership < ApplicationRecord
    validates :gym_id, presence: true
    validates :client_id, presence: true
    validate :client_gym
    belongs_to :client
    belongs_to :gym


    def client_gym
        Membership.all.each do |membership| 
            if client_id == membership.client_id && gym_id == membership.gym_id
                errors.add(:client_id, "cannot have another membership with the same gym")
            end
        end
    end
end
