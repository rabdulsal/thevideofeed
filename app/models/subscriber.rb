class Subscriber < ActiveRecord::Base
  attr_accessible :email

  validates :email, presence: true, uniqueness: true, email: true

  def key
    Thevideofeed::Application.message_verifier.generate(id)
  end

  def self.find_by_key(key)
    id = Thevideofeed::Application.message_verifier.verify(key)
    find(id)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    raise ActiveRecord::RecordNotFound
  end
end
