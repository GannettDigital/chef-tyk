if defined?(ChefSpec)
  def dump_ark(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:ark, :dump, resource_name)
  end
end
