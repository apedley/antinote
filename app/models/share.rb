class Share < ActiveRecord::Base
  belongs_to :note
  before_create { generate_uuid }

  def generate_uuid
    self.uuid = SecureRandom.hex(3)
  end

  def self.stale
    where("updated_at < '#{DateTime.now - 30.days}'")
  end
end