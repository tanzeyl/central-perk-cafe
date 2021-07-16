class OrderItem < ActiveRecord::Base
  belongs_to :menu_item

  def self.of_user(user)
    all.where(user_id: user.id)
  end

end
