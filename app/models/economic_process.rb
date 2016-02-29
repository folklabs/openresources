class EconomicProcess
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, :type => String
  field :uri, :type => String
  field :level, :type => Integer

  include Mongoid::Timestamps
end
