module Api
  class OfferResource < JSONAPI::Resource
    # attributes :name
    # attributes :path

    has_many :materials

  end
end
