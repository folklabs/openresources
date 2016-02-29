module Api
  class OrganizationResource < JSONAPI::Resource
    attributes :name

    has_many :offers

    def self.apply_filter(records, filter, value)
      records.in(filter => value)
    end
  end
end
