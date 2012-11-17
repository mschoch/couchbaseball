class PeopleController < ApplicationController
  def show
    person_id = params[:id]
    @person = Person.find("person_" + person_id)

    # stats
    startkey = [person_id]
    endkey = [person_id, {}]

    @stat_categories = [
      {:key => "atbats", :display => "AB"},
      {:key => "hits", :display => "H"},
      {:key => "doubles", :display => "2B"},
      {:key => "triples", :display => "3B"},
      {:key => "homeruns", :display => "HR"}]

    @all_stats = {}

    atbats = Event.individual_atbats(:group_level => 2, :include_docs => false, :startkey => startkey, :endkey => endkey)
    atbats.each do |row|
      all_stats_year = @all_stats[row.key[1]]
      if all_stats_year == nil
        all_stats_year = {}
        @all_stats[row.key[1]] = all_stats_year
      end
      all_stats_year["atbats"] = row.value
    end

    hits = Event.individual_hits(:group_level => 2, :include_docs => false, :startkey => startkey, :endkey => endkey)
    hits.each do |row|
      all_stats_year = @all_stats[row.key[1]]
      if all_stats_year == nil
        all_stats_year = {}
        @all_stats[row.key[1]] = all_stats_year
      end
      all_stats_year["hits"] = row.value
    end

    doubles = Event.individual_doubles(:group_level => 2, :include_docs => false, :startkey => startkey, :endkey => endkey)
    doubles.each do |row|
      all_stats_year = @all_stats[row.key[1]]
      if all_stats_year == nil
        all_stats_year = {}
        @all_stats[row.key[1]] = all_stats_year
      end
      all_stats_year["doubles"] = row.value
    end

    triples = Event.individual_triples(:group_level => 2, :include_docs => false, :startkey => startkey, :endkey => endkey)
    triples.each do |row|
      all_stats_year = @all_stats[row.key[1]]
      if all_stats_year == nil
        all_stats_year = {}
        @all_stats[row.key[1]] = all_stats_year
      end
      all_stats_year["triples"] = row.value
    end

    homeruns = Event.individual_homeruns(:group_level => 2, :include_docs => false, :startkey => startkey, :endkey => endkey)
    homeruns.each do |row|
      all_stats_year = @all_stats[row.key[1]]
      if all_stats_year == nil
        all_stats_year = {}
        @all_stats[row.key[1]] = all_stats_year
      end
      all_stats_year["homeruns"] = row.value
    end

  end

end
