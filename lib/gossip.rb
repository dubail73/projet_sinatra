require 'csv'
#require 'pry'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

    def self.find(id)
      all_gossips = Gossip.all # On récupère tous les gossips
      return all_gossips[id.to_i - 1] # On retourne le gossip qui correspond à l'ID (en ajustant pour l'index)
    end
end
#binding.pry