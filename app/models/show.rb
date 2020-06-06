class Show < ActiveRecord::Base
  
    has_many :characters
    belongs_to :network

    def actors_list
        self.characters.map {|character| character.actor.full_name}
    end
    
    def build_network(call_letters:)
        n = Network.new(call_letters: call_letters)
        n.shows << self
        n
    end
end