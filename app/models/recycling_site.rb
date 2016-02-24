module OpenResources
  class RecyclingSite
    include Tripod::Resource

    rdf_type 'http://openresources.io/bringpoint'
    graph_uri 'http://openresources.io/graph'

    field :materials_accepted, 'http://openresources.io/def/material', :multivalued => true
  end
end
