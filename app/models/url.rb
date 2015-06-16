class Url < ActiveRecord::Base
  validates :original, :shorten, presence: true

  def self.generate_lorem
    lorem = Faker::Lorem.characters(6)
    loop do
      break if self.find_by_shorten(lorem).nil?
      lorem = Faker::Lorem.characters(6)
    end
    lorem
  end

  def valid_url?
    return false if original.blank?
    self.original = "http://#{original}" if original.match(/^http/).nil?
    uri = URI.parse original
    Net::HTTP.get_response(uri).code == '200'
  rescue
    false
  end

  def increase_counter
    self.counter += 1
    save
  end

end
