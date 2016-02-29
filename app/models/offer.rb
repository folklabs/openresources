class Offer
  include Mongoid::Document

  belongs_to :organization
  belongs_to :economic_process, inverse_of: nil
  has_and_belongs_to_many :materials, inverse_of: nil

  include Mongoid::Timestamps
end
