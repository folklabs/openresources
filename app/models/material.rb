class Material
  include Mongoid::Document

  field :name, type: String
  field :path, type: String
  field :description, type: String
  field :wikidata_id, type: String
  field :wrap_category, type: String
  field :material_stream, type: String
  field :osm_tag, type: String
  field :guidelines, type: String

  include Mongoid::Timestamps # adds created_at and updated_at fields
end
