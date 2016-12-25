class Session < ApplicationRecord
  belongs_to :user
  before_create :generate_auth_token
  before_create :set_expiry_date

  private

  def generate_auth_token
    begin
      self.auth_token = SecureRandom.hex
    end while self.class.exists(auth_token: auth_token)
  end

  def set_expiry_date
    self.expiry_date = DateTime.now.days_ago(-365)
  end
end
