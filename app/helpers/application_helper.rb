module ApplicationHelper
	def cents_pretty(cents)
		'$' + '%.2f' % cents_to_dollars(cents)
	end

	def cents_to_dollars(cents)
		cents.to_f/100
	end
end
