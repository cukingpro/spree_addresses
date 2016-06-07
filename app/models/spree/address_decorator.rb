Spree::Address.class_eval do

	def to_string
		self.address1 + ', ' + self.city + ', ' + self.state.name
	end

end