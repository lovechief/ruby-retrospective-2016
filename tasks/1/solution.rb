def convert_between_temperature_units(degrees, src_units, target_units)
    coefficient = { 'C' => 1.8, 'F' => 1, 'K' => 1.8 }
    constant = { 'C' => 32,  'F' => 0, 'K' => -459.67 }
	(degrees * coefficient[src_units] + constant[src_units] - constant[target_units]) / coefficient[target_units]
end

SUBSTANCES = {
    'water'   => {melting_point: 0,     boiling_point: 100  },
    'ethanol' => {melting_point: -114,  boiling_point: 78.37},
    'gold'    => {melting_point: 1_064, boiling_point: 2_700},
    'silver'  => {melting_point: 961.8, boiling_point: 2_162},
    'copper'  => {melting_point: 1_085, boiling_point: 2_567}
}

def melting_point_of_substance(substance, units)
    convert_between_temperature_units(SUBSTANCES[substance][:melting_point], 'C', units)
end

def boiling_point_of_substance(substance, units)
    convert_between_temperature_units(SUBSTANCES[substance][:boiling_point], 'C', units)
end

p convert_between_temperature_units(0, 'C', 'K')
p convert_between_temperature_units(1, 'C', 'F')