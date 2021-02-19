class CocktailAPI
    class << self
       
        # returns array of all drinks from that search
        def search(params = {"name" => "", "ingredient" => ""})
            @base_url ||= "https://www.thecocktaildb.com/api/json/v1/1/"
            # search by name
            if !params["name"].empty?
                url = @base_url + "search.php?s=#{params["name"]}"
            
            # search by ingredient
            elsif !params["ingredient"].empty?
                url = @base_url + "filter.php?i=#{params["ingredient"]}"
            
            # random search (1 drink)
            else
                url = @base_url + "random.php"
            end
            
            JSON.parse(Net::HTTP.get(URI(url)))["drinks"]
        end

    end
end