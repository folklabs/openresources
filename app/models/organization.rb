class Organization
  include Mongoid::Document

  field :name, :type => String
  field :description, :type => String
  field :url, :type => String

  include Mongoid::Timestamps # adds created_at and updated_at fields

  embeds_many :offers
  accepts_nested_attributes_for :offers
  # has_and_belongs_to_many :materials

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
end
