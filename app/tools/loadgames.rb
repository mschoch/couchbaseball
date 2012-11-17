require 'csv'
#require 'models/game'

class LoadGames
  def run(args=[])

    args.each { |arg|
      file = File.open(arg)
      csv = CSV.parse(file)
      csv.each { |row|
        
        g = Game.new
        g.fromCSVRow(row)
        #print "#{g.inspect}\n"
        g.save
      }
    }

  end

end

if __FILE__ == $0
  x = LoadGames.new
  x.run(ARGV)
end