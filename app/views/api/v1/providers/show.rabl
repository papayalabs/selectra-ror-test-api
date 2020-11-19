object @provider
attributes :id, :name
child @provider.tracking_pixels do
  attributes :id, :name, :converted
end
