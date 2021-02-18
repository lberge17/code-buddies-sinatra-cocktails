class CocktailAPI
    class << self
       
        # returns array of all drinks from that search
        def search(name: nil, ingredient: nil)
            
            # search by name
            if name
                url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}"
            
            # search by ingredient
            elsif ingredient
                url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
            
            # random search (1 drink)
            else
                url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
            end
            
            JSON.parse(Net::HTTP.get(URI(url)))["drinks"]
        end

    end
end