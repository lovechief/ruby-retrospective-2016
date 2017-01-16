def convert_between_temperature_units(degrees, src_units, target_units)
	case src_units
	when 'K'
		case target_units
		when 'K'
			degrees
		when 'C'
			degrees - 273.15
		when 'F'
			(9 * degrees) / 5.0 - 459.67
		end
	when 'C'
		case target_units
		when 'K'
			degrees + 273.15
		when 'C'
			degrees
		when 'F'
			(9 * degrees) / 5.0 + 32
		end
	when 'F'
		case target_units
		when 'K'
			(degrees + 459.67) * 5.0 / 9
		when 'C'
			(degrees - 32) * 5.0 / 9
		when 'F'
			degrees
		end
	end
end

def melting_point_of_substance(substance, units)
	case substance
	when 'water'
		convert_between_temperature_units(0, 'C', units)
	when 'ethanol'
		convert_between_temperature_units(-114, 'C', units)
	when 'gold'
		convert_between_temperature_units(1_064, 'C', units)
	when 'silver'
		convert_between_temperature_units(961.8, 'C', units)
	when 'copper'
		convert_between_temperature_units(1_085, 'C', units)
	end
end

def boiling_point_of_substance(substance, units)
	case substance
	when 'water'
		convert_between_temperature_units(100, 'C', units)
	when 'ethanol'
		convert_between_temperature_units(78.37, 'C', units)
	when 'gold'
		convert_between_temperature_units(2_700, 'C', units)
	when 'silver'
		convert_between_temperature_units(2_162, 'C', units)
	when 'copper'
		convert_between_temperature_units(2_567, 'C', units)
	end
end

p convert_between_temperature_units(0, 'C', 'K')
p convert_between_temperature_units(1, 'C', 'F')