class Stage
  include Mongoid::Document
  
  field :name, type: String
  field :description, type: String
  field :weight, type: String

end
