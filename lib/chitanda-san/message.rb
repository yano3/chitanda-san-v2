module ChitandaSan
  class Message
    def self.create(items)
      programs = items.select{|item|
        (item[:Cat] == 1 || item[:Cat] == 8) && item[:ChGID] == 1
      }.map{|item|
        start_date = Time.at(item[:StTimeU].to_i).strftime('%m/%d(%a) %H:%M')
        end_date = Time.at(item[:EdTimeU].to_i).strftime('%m/%d(%a) %H:%M')
        "#{item[:CatName]} #{start_date} - #{end_date} #{item[:ChName]} / *#{item[:Title]} #{item[:Count]}話*"
      }
      "*わたし、今日のテレビアニメが気になります！*\n" + programs.join("\n")
    end
  end
end