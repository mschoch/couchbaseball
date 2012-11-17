require 'couchbase/model'

class Person < Couchbase::Model
  
  attribute :type
  attribute :first
  attribute :last
  attribute :dob
  
  def fromCSVRow(record=[])
    self.type = "person"
    self.last = record[0]
    self.first = record[1]
    self.id = "person_" + record[2]
    rawDob = record[3]
    self.dob = rawDob[6..9] + "-" + rawDob[0..1] + "-" + rawDob[3..4]
  end
end