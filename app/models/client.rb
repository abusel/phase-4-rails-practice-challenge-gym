class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships
    #  def total_membership
    #     total = self.memberships.sum(:charge)
    #     total
    # end

end
