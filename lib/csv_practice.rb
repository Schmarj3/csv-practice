require 'csv'
require 'awesome_print'

# Nominal Test Cases
# 1 - The method should return a hash
# 2 - the method should select specific data to return
def get_all_olympic_athletes(filename)
  selected_headers = %w[ID Name Height Team Year City Sport Event Medal]
  olympic_athletes = CSV.read(filename, headers: true).map { |athlete| athlete.to_h.select { |key| selected_headers.include? key } }
  return olympic_athletes
end

def total_medals_per_team(olympic_data)
  medals_per_team = {}
  olympic_data.map do |athlete|
    unless athlete['Medal'] == 'NA'
      team = athlete['Team']
      if medals_per_team.has_key? team
        medals_per_team[team] += 1
      else
        medals_per_team[team] = 1
      end
    end
  end
  return medals_per_team
end

def get_all_gold_medalists(olympic_data)
end

# get_all_olympic_athletes('../data/athlete_events.csv')
# total_medals_per_team(get_all_olympic_athletes('../data/athlete_events.csv'))