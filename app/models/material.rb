class Material
  include Mongoid::Document

  field :name, type: String
  field :path, type: String
  field :description, type: String
  field :wikidata_id, type: String

  include Mongoid::Timestamps # adds created_at and updated_at fields
end
