$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'

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
  # Write this implementation
  list_of_dir = []
  dir_index = 0 
  while dir_index < source.count do
    list_of_dir << source[dir_index][:name]
    dir_index += 1 
  end
  # pp list_of_dir
  list_of_dir
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  total = 0 
  dir_totals = directors_totals(source)
  list_of_dir = list_of_directors(source)
  index = 0 
  while index < list_of_dir.length do 
    dir = list_of_dir[index]
    total += dir_totals[dir]
    index += 1 
  end
  # pp total
  total
end


