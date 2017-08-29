module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    new_toy = Toy.find_or_create_by(name: name)
    new_toy.toyable_type = self.class
    new_toy.toyable_id = self.id
    new_toy.save
  end
end
