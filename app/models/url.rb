class Url < ActiveRecord::Base
  validates :original, :shorten, presence: true

  def self.generate_lorem
    loop do
      lorem = Faker::Lorem.characters(6)
      break if self.find_by_shorten(lorem).nil?
    end
    lorem
  end
end
