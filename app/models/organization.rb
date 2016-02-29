class Organization
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, :type => String
  field :type, :type => String
  field :website, :type => String
  field :description, :type => String

  include Mongoid::Timestamps

  has_many :offers
end
