object false
node(:error) { I18n.t(:api_invalid_resource) }
node(:errors) { @resource.errors.to_hash }