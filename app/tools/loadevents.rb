require 'csv'
#require 'models/game'

class LoadEvents
  def run(args=[])

    args.each { |arg|
      file = File.open(arg)
      csv = CSV.parse(file)
      csv.each { |row|
        
        e = Event.new
        e.fromCSVRow(row)
        #print "#{g.inspect}\n"
        e.save
      }
    }

  end

end

if __FILE__ == $0
  x = LoadEvents.new
  x.run(ARGV)
end