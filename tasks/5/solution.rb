class DataModel
  def self.attributes(attrs)
    attrs.each { |attr| attr_accessor attr.to_sym }
    attrs.map { |attr| attr.to_sym }
  end
  def self.data_store(store)
    @store = store unless store.nil?
    @store
  end
end