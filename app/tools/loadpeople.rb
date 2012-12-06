require 'csv'

class LoadPeople
  def run(args=[])

    args.each { |arg|
      file = File.open(arg)
      csv = CSV.parse(file)
      csv.each { |row|
        
        p = Person.find_by_id("person_" + row[2]) || Person.new
        p.fromCSVRow(row)
        #print "#{g.inspect}\n"
        p.save
      }
    }

  end

end

if __FILE__ == $0
  x = LoadPeople.new
  x.run(ARGV)
end
