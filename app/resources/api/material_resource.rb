module Api
  class MaterialResource < JSONAPI::Resource
    attributes :name
    attributes :path

    def self.apply_filter(records, filter, value)
      records.in(filter => value)
    end

  end
end
