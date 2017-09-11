class Pet < ActiveRecord::Base
  belongs_to :owner

  def pet_message
    "Hi! My name is#{self.name} and my owner is #{self.owner.first_name} #{self.owner.last_name}"
  end
end