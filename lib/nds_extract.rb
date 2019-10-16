$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  pp source
  direct_names = []
  source.length.times { |i|
    direct_names.append(source[i][:name])
  }
  direct_names
end

def total_gross(source)
  dir_totals = directors_totals(source)
  dir_names = list_of_directors(source)
  total = 0
  
  dir_names.length.times { |i|
    total += dir_totals[dir_names[i]]
  }
  
  total
end


