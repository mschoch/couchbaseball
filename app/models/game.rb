require 'couchbase/model'

class Game < Couchbase::Model
  attribute :type
  attribute :date
  attribute :gameNumber
  attribute :visitor
  attribute :home
  attribute :umpires
  attribute :acquisition
  attribute :numberOfOuts
  attribute :dayNight
  attribute :park
  attribute :attendance
  attribute :gameDuration
  attribute :wPitcher
  attribute :lPitcher
  attribute :sPitcher
  attribute :gwrbi
  attribute :additional
  attribute :completion
  attribute :forfeit
  attribute :protest

  view :by_team_date
  view :by_season_team
  
  def fromCSVRow(record=[])
    rawDate = record[0]
    date = rawDate[0..3] + "-" + rawDate[4..5] + "-" + rawDate[6..7]
    gamepos = record[1]
    
    
    
    #day_of_week = record[2]
    vis_team = record[3]
    #vis_league = record[4]
    #vis_game_no = record[5]
    home_team = record[6]
    #home_league = record[7]
    #home_game_no = record[8]
    
    puts "Processing game " + home_team + rawDate + gamepos

    vis_score = Integer(record[9])
    home_score = Integer(record[10])
    
    game_num_outs = record[11]
    
    day_night = record[12]
    
    completion = record[13]
    forfeit = record[14]
    protest = record[15]
    
    park_id = record[16]
    attendance = record[17]
    game_time_minutes = record[18]
    
    vis_line_score = record[19]
    home_line_score = record[20]
    
    # visitor offense
    vis_at_bats = record[21]
    vis_hits = record[22]
    vis_doubles = record[23]
    vis_triples = record[24]
    vis_homeruns = record[25]
    vis_rbis = record[26]
    vis_sac_hits = record[27]
    vis_sac_flys = record[28]
    vis_hit_by_pitch = record[29]
    vis_walks = record[30]
    vis_intentional_walks = record[31]
    vis_strikeouts = record[32]
    vis_stolen_bases = record[33]
    vis_caught_stealing = record[34]
    vis_gdp = record[35]
    vis_ci = record[36]
    vis_left_on_base = record[37]
    
    # visitor pitching
    vis_pitchers_used = record[38]
    vis_indiv_earned_runs = record[39]
    vis_team_earned_runs = record[40]
    vis_wild_pitches = record[41]
    vis_balks = record[42]
    
    # visitor defensive
    vis_putouts = record[43]
    vis_assists = record[44]
    vis_errors = record[45]
    vis_passed_balls = record[46]
    vis_dp = record[47]
    vis_tp = record[48]
    
    # home offense
    home_at_bats = record[49]
    home_hits = record[50]
    home_doubles = record[51]
    home_triples = record[52]
    home_homeruns = record[53]
    home_rbis = record[54]
    home_sac_hits = record[55]
    home_sac_flys = record[56]
    home_hit_by_pitch = record[57]
    home_walks = record[58]
    home_intentional_walks = record[59]
    home_strikeouts = record[60]
    home_stolen_bases = record[61]
    home_caught_stealing = record[62]
    home_gdp = record[63]
    home_ci = record[64]
    home_left_on_base = record[65]
    
    # home pitching
    home_pitchers_used = record[66]
    home_indiv_earned_runs = record[67]
    home_team_earned_runs = record[68]
    home_wild_pitches = record[69]
    home_balks = record[70]
    
    # home defensive
    home_putouts = record[71]
    home_assists = record[72]
    home_errors = record[73]
    home_passed_balls = record[74]
    home_dp = record[75]
    home_tp = record[76]
    
    # umpires
    hp_umpire_id = record[77]
    #hp_upimre_name = record[78]
    fb_umpire_id = record[79]
    #fb_upimre_name = record[80]
    sb_umpire_id = record[81]
    #sb_upimre_name = record[82]
    tb_umpire_id = record[83]
    #tb_upimre_name = record[84]
    lf_umpire_id = record[85]
    #lf_upimre_name = record[86]
    rf_umpire_id = record[87]
    #rf_upimre_name = record[88]
    
    vis_manager_id = record[89]
    #vis_manager_name = record[90]
    home_manager_id = record[91]
    #home_manager_name = record[92]
    winning_pitcher_id = record[93]
    #winning_pitcher_name = record[94]
    losing_pitcher_id = record[95]
    #losing_pitcher_name = record[96]
    saving_pitcher_id = record[97]
    #saving_pitcher_name = record[98]
    game_winning_rbi_id = record[99]
    #game_winning_rbi_name = record[100]
    vis_starting_pitcher_id = record[101]
    #vis_starting_pitcher_name = record[102]
    home_starting_pitcher_id = record[103]
    #home_starting_pitcher_name = record[104]
    
    # visitor starting lineup
    vis_starter_1_id = record[105]
    #vis_starter_1_name = record[106]
    vis_starter_1_pos = record[107]
    vis_starter_2_id = record[108]
    #vis_starter_2_name = record[109]
    vis_starter_2_pos = record[110]
    vis_starter_3_id = record[111]
    #vis_starter_3_name = record[112]
    vis_starter_3_pos = record[113]
    vis_starter_4_id = record[114]
    #vis_starter_4_name = record[115]
    vis_starter_4_pos = record[116]
    vis_starter_5_id = record[117]
    #vis_starter_5_name = record[118]
    vis_starter_5_pos = record[119]
    vis_starter_6_id = record[120]
    #vis_starter_6_name = record[121]
    vis_starter_6_pos = record[122]
    vis_starter_7_id = record[123]
    #vis_starter_7_name = record[124]
    vis_starter_7_pos = record[125]
    vis_starter_8_id = record[126]
    #vis_starter_8_name = record[127]
    vis_starter_8_pos = record[128]
    vis_starter_9_id = record[129]
    #vis_starter_9_name = record[130]
    vis_starter_9_pos = record[131]
    
    # home starting lineup
    home_starter_1_id = record[132]
    #home_starter_1_name = record[133]
    home_starter_1_pos = record[134]
    home_starter_2_id = record[135]
    #home_starter_2_name = record[136]
    home_starter_2_pos = record[137]
    home_starter_3_id = record[138]
    #home_starter_3_name = record[139]
    home_starter_3_pos = record[140]
    home_starter_4_id = record[141]
    #home_starter_4_name = record[142]
    home_starter_4_pos = record[143]
    home_starter_5_id = record[144]
    #home_starter_5_name = record[145]
    home_starter_5_pos = record[146]
    home_starter_6_id = record[147]
    #home_starter_6_name = record[148]
    home_starter_6_pos = record[149]
    home_starter_7_id = record[150]
    #home_starter_7_name = record[151]
    home_starter_7_pos = record[152]
    home_starter_8_id = record[153]
    #home_starter_8_name = record[154]
    home_starter_8_pos = record[155]
    home_starter_9_id = record[156]
    #home_starter_9_name = record[157]
    home_starter_9_pos = record[158]
    
    additional_info = record[159]

    acquisition_info = record[160]

    # build some intermediate structures
    self.id = "game_" + home_team + rawDate + gamepos
    vis_runs_inning = []
    if vis_line_score != nil
      vis_runs_inning = parse_line_score(vis_line_score)
    end
    home_runs_inning = []
    if home_line_score != nil
      home_runs_inning = parse_line_score(home_line_score)
    end
    
    vis_lineup = [
        {
                :id =>  vis_starter_1_id,
                :pos => vis_starter_1_pos},
        {
                :id =>  vis_starter_2_id,
                :pos => vis_starter_2_pos},
        {
                :id =>  vis_starter_3_id,
                :pos => vis_starter_3_pos},
        {
                :id =>  vis_starter_4_id,
                :pos => vis_starter_4_pos},
        {
                :id =>  vis_starter_5_id,
                :pos => vis_starter_5_pos},
        {
                :id =>  vis_starter_6_id,
                :pos => vis_starter_6_pos},
        {
                :id =>  vis_starter_7_id,
                :pos => vis_starter_7_pos},
        {
                :id =>  vis_starter_8_id,
                :pos => vis_starter_8_pos},
        {
                :id =>  vis_starter_9_id,
                :pos => vis_starter_9_pos}]

     home_lineup = [
        {
                :id =>  home_starter_1_id,
                :pos => home_starter_1_pos},
        {
                :id =>  home_starter_2_id,
                :pos => home_starter_2_pos},
        {
                :id  => home_starter_3_id,
                :pos => home_starter_3_pos},
        {
                :id =>  home_starter_4_id,
                :pos => home_starter_4_pos},
        {
                :id => home_starter_5_id,
                :pos => home_starter_5_pos},
        {
                :id => home_starter_6_id,
                :pos => home_starter_6_pos},
        {
                :id => home_starter_7_id,
                :pos => home_starter_7_pos},
        {
                :id => home_starter_8_id,
                :pos => home_starter_8_pos},
        {
                :id => home_starter_9_id,
                :pos => home_starter_9_pos}]

    self.type = "game"
    self.date = date
    self.gameNumber = Integer(gamepos)
    
    self.visitor = {
      :id =>              vis_team,
      :lineScore =>       vis_runs_inning,
      :score =>           vis_score,
      :manager =>         vis_manager_id,
      :startingPitcher => vis_starting_pitcher_id,
      :offense => {
        :ab =>           vis_at_bats,
        :h =>             vis_hits,
        :b2 =>          vis_doubles,
        :b3 =>          vis_triples,
        :hr =>         vis_homeruns,
        :rbi =>             vis_rbis,
        :sh =>          vis_sac_hits,
        :sf =>          vis_sac_flys,
        :hbp =>       vis_hit_by_pitch,
        :bb =>            vis_walks,
        :ibb => vis_intentional_walks,
        :k =>       vis_strikeouts,
        :sb =>      vis_stolen_bases,
        :cs =>   vis_caught_stealing,
        :gdp =>              vis_gdp,
        :ci =>               vis_ci,
        :lob =>       vis_left_on_base
        },
      :pitching => {
        :count => vis_pitchers_used,
        :iera =>     vis_indiv_earned_runs,
        :tera =>      vis_team_earned_runs,
        :wp =>  vis_wild_pitches,
        :bk =>        vis_balks},
      :defense => {
        :po =>     vis_putouts,
        :a =>     vis_assists,
        :e =>      vis_errors,
        :pb => vis_passed_balls,
        :dp =>          vis_dp,
        :tp =>          vis_tp
      },
      :lineup => vis_lineup
    }    
    
    self.home = {
      :id =>              home_team,
      :lineScore =>       home_runs_inning,
      :score =>           home_score,
      :manager =>         home_manager_id,
      :startingPitcher => home_starting_pitcher_id,
      :offense => {
        :ab =>           home_at_bats,
        :h =>             home_hits,
        :b2 =>          home_doubles,
        :b3 =>          home_triples,
        :h4 =>         home_homeruns,
        :rbi =>             home_rbis,
        :sh =>          home_sac_hits,
        :sf =>          home_sac_flys,
        :hbp =>       home_hit_by_pitch,
        :bb =>            home_walks,
        :ibb => home_intentional_walks,
        :k =>       home_strikeouts,
        :sb =>      home_stolen_bases,
        :cs =>   home_caught_stealing,
        :gdp =>              home_gdp,
        :ci =>               home_ci,
        :lob =>       home_left_on_base
      },
      :pitching => {
        :count => home_pitchers_used,
        :iera =>     home_indiv_earned_runs,
        :tera =>      home_team_earned_runs,
        :wp =>  home_wild_pitches,
        :bk =>        home_balks
      },
      :defense => {
        :po =>     home_putouts,
        :a =>     home_assists,
        :e =>      home_errors,
        :pb => home_passed_balls,
        :dp =>          home_dp,
        :tp =>          home_tp
      },
      :lineup => home_lineup
    }
    
    self.umpires = { :hp => hp_umpire_id,
                     :fb => fb_umpire_id,
                     :sb => sb_umpire_id,
                     :tb => tb_umpire_id,
                     :lf => lf_umpire_id,
                     :rf => rf_umpire_id}
                                
    self.acquisition = acquisition_info
    self.numberOfOuts = game_num_outs
    self.dayNight = day_night
    self.park = park_id
    self.attendance = attendance
    self.gameDuration = game_time_minutes
    self.wPitcher = winning_pitcher_id
    self.lPitcher = losing_pitcher_id
    self.sPitcher = saving_pitcher_id
    self.gwrbi  = game_winning_rbi_id
    self.additional = additional_info
    self.completion = completion
    self.forfeit = forfeit
    self.protest = protest
    
  end
  
  def parse_line_score(line)
    runs_inning = ""
    inParen = false
    inParenString = ""
    pos = -1;
        
    line.split("").each do |char|
      pos = pos +1
    
      if char == 'x' && (line.length() - 1) == pos
              # ok this X is at the end
              break
      elsif char == 'x'
              abort("Unexpected x in run line, not at the end")
      elsif char == '('
              inParen = true
              next
      elsif char == ')'
              inParen = false
              inningInt = Integer(inParenString)
              runs_inning = runs_inning  + String(inningInt)
              inParenString = ""
      elsif inParen
              inParenString = inParenString + char
      else
              inningInt = Integer(char)
              runs_inning = runs_inning  + String(inningInt)
      end
      
    end

    return runs_inning
  end
  
end