module OpenResources
  class EconomicResourceType
    include Tripod::Resource

    rdf_type 'http://openresources.io/economic_resource_type'
    graph_uri 'http://openresources.io/graph'

    # field :name, 'https://schema.org/name'
    field :label, RDF::RDFS.label
    field :description, 'http://purl.org/dc/terms/description'
    field :wikidata_id, 'http://www.wikidata.org/ontology#Item'
  end
end
