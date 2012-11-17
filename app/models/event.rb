require 'couchbase/model'

FIRST_EXTRA_FIELD = 97

class Event < Couchbase::Model

  attribute :game
  attribute :number
  attribute :batter
  attribute :batterHand
  attribute :first
  attribute :second
  attribute :third
  attribute :outs
  attribute :eventText
  attribute :eventType
  attribute :errorPlayers
  attribute :putoutPlayers
  attribute :assistPlayers
  attribute :pitchSequence
  attribute :atBat
  attribute :hit
  attribute :sacHit
  attribute :sacFly
  attribute :stolenBases
  attribute :caughtStealing
  attribute :pickedOff
  
  view :individual_atbats
  view :individual_hits
  view :individual_singles
  view :individual_doubles
  view :individual_triples
  view :individual_homeruns
  view :individual_strikeouts
  view :individual_walks
  
  # this is designed to work with the output of the cwevent tool
  # it is expected that you pass all possible fields, currently
  # cwevent -f 0-96 -x 0-62
  def fromCSVRow(record=[])

    gameId = record[0]
    visTeam = record[1]
    inning = record[2]
    battingTeam = record[3]
    outs = record[4]
    balls = record[5]
    strikes = record[6]
    pitchSequence = record[7]
    visScore = record[8]
    homeScore = record[9]
    batter = record[10]
    batterHand = record[11]
    resBatter = record[12]
    resBatterHand = record[13]
    pitcher = record[14]
    pitcherHand = record[15]
    resPitcher = record[16]
    resPitcherHand = record[17]
    catcher = record[18]
    firstBase = record[19]
    secondBase = record[20]
    thirdBase = record[21]
    shortStop = record[22]
    leftField = record[23]
    centerField = record[24]
    rightField = record[25]
    firstRunner = record[26]
    secondRunner = record[27]
    thirdRunner = record[28]
    eventText = record[29]
    leadOff = record[30]
    pinchHit = record[31]
    defensivePosition = record[32]
    lineupPosition = record[33]
    eventType = record[34]
    batterEvent = record[35]
    atBat = record[36]
    hit = record[37]
    sacHit = record[38]
    sacFly = record[39]
    outsOnPlay = record[40]
    doublePlay = record[41]
    triplePlay = record[42]
    rbiOnPlay = record[43]
    wildPitch = record[44]
    passedBall = record[45]
    fieldedBy = record[46]
    battedBallType = record[47]
    bunt = record[48]
    foul = record[49]
    hitLocation = record[50]
    numErrors = record[51]
    firstErrorPlayer = record[52]
    firstErrorType = record[53]
    secondErrorPlayer = record[54]
    secondErrorType = record[55]
    thirdErrorPlayer = record[56]
    thirdErrorType = record[57]
    batterDest = record[58]
    firstRunnerDest = record[59]
    secondRunnerDest = record[60]
    thirdRunnerDest = record[61]
    playOnBatter = record[62]
    playOnRunnerOnFirst = record[63]
    playOnRunnerOnSecond = record[64]
    playOnRunnerOnThird = record[65]
    sbForRunnerOnFirst = record[66]
    sbForRunnerOnSecond = record[67]
    sbForRunnerOnTHird = record[68]
    csForRunnerOnFirst = record[69]
    csForRunnerOnSecond = record[70]
    csForRunnerOnThird = record[71]
    poForRunnerOnFirst = record[72]
    poForRunnerOnSecond = record[73]
    poForRunnerOnThird = record[74]
    rpForRunnerOnFirst = record[75]
    rpForRunnerOnSecond = record[76]
    rpForRunnerOnThird = record[77]
    newGame = record[78]
    endGame = record[79]
    pinchRunnerOnFirst = record[80]
    pinchRunnerOnSecond = record[81]
    pinchRunnerOnThird = record[82]
    runnerRemovedFromFirstForPinchRunner = record[83]
    runnerRemovedFromSecondForPinchRunner = record[84]
    runnerRemovedFromThirdForPinchRunner = record[85]
    batterRemovedForPinchHitter = record[86]
    positionOfBatterRemovedForPinchHitter = record[87]
    fielderWithFirstPutout = record[88]
    fielderWithSecondPutout = record[89]
    fielderWithThirdPutout = record[90]
    fielderWithFirstAssist = record[91]
    fielderWithSecondAssist = record[92]
    fielderWithThirdAssist = record[93]
    fielderWithFourthAssist = record[94]
    fielderWithFifthAssist = record[95]
    eventNum = record[96]

    homeTeamId = record[FIRST_EXTRA_FIELD + 0]
    battingTeamId = record[FIRST_EXTRA_FIELD + 1]
    fieldingTeamId = record[FIRST_EXTRA_FIELD + 2]
    halfInning = record[FIRST_EXTRA_FIELD + 3]
    startHalfInning = record[FIRST_EXTRA_FIELD + 4]
    endHalfInning = record[FIRST_EXTRA_FIELD + 5]
    offenseScore = record[FIRST_EXTRA_FIELD + 6]
    defenseScore = record[FIRST_EXTRA_FIELD + 7]
    runsScoredThisHalfInning = record[FIRST_EXTRA_FIELD + 8]
    numPlateAppearancesForOffense = record[FIRST_EXTRA_FIELD + 9]
    numPlateAppearancesForDefense = record[FIRST_EXTRA_FIELD + 10]
    startPlateAppearance = record[FIRST_EXTRA_FIELD + 11]
    truncatedPlateAppearance = record[FIRST_EXTRA_FIELD + 12]
    baseStateStart = record[FIRST_EXTRA_FIELD + 13]
    baseStateEnd = record[FIRST_EXTRA_FIELD + 14]
    batterIsStarter = record[FIRST_EXTRA_FIELD + 15]
    resultBatterIsStarter = record[FIRST_EXTRA_FIELD + 16]
    batterOnDeckId = record[FIRST_EXTRA_FIELD + 17]
    batterInTheHoldId = record[FIRST_EXTRA_FIELD + 18]
    pitcherIsStarter = record[FIRST_EXTRA_FIELD + 19]
    resultPitcherIsStarter = record[FIRST_EXTRA_FIELD + 20]
    defensivePositionOfRunnerOnFirst = record[FIRST_EXTRA_FIELD + 21]
    lineupPositionOfRunnerOnFirst = record[FIRST_EXTRA_FIELD + 22]
    eventNumberWhenRunnerOnFirstReachedBase = record[FIRST_EXTRA_FIELD + 23]
    defensivePositionOfRunnerOnSecond = record[FIRST_EXTRA_FIELD + 24]
    lineupPositionOfRunnerOnSecond = record[FIRST_EXTRA_FIELD + 25]
    eventNumberWhenRunnerOnSecondReached = record[FIRST_EXTRA_FIELD + 26]
    defensivePositionOfRunnerOnThird = record[FIRST_EXTRA_FIELD + 27]
    lineupPositionOfRunnerOnThird = record[FIRST_EXTRA_FIELD + 28]
    eventNumberWhenRunnerOnThirdReached = record[FIRST_EXTRA_FIELD + 29]
    responsibleCatcherForRunnerOnFirt = record[FIRST_EXTRA_FIELD + 30]
    responsibleCatcherForRunnerOnSecond = record[FIRST_EXTRA_FIELD + 31]
    responsibleCatcherForRunnerOnThird = record[FIRST_EXTRA_FIELD + 32]
    numberOfBallsInPlateAppearance = record[FIRST_EXTRA_FIELD + 33]
    numberOfCalledBallsInPlateAppearance = record[FIRST_EXTRA_FIELD + 34]
    numberOfIntentionalBallsInPlateAppearance = record[FIRST_EXTRA_FIELD + 35]
    numberOfPitchoutsInPlateAppearance = record[FIRST_EXTRA_FIELD + 36]
    numberOfPitchesHittingBatterInPlateAppearance = record[FIRST_EXTRA_FIELD + 37]
    numberOfOtherBallsInPlateAppearance = record[FIRST_EXTRA_FIELD + 38]
    numberOfStrikesInPlateAppearance = record[FIRST_EXTRA_FIELD + 39]
    numberOfCalledStrikesInPlateAppearance = record[FIRST_EXTRA_FIELD + 40]
    numberOfSwingingStrikesInPlateAppearance = record[FIRST_EXTRA_FIELD + 41]
    numberOfFoulBallsInPlateAppearance = record[FIRST_EXTRA_FIELD + 42]
    numberOfBallsInPlayInPlateAppearance = record[FIRST_EXTRA_FIELD + 43]
    numberOfOtherStrikesInPlateAppearance = record[FIRST_EXTRA_FIELD + 44]
    numberOfRunsOnPlay = record[FIRST_EXTRA_FIELD + 45]
    idOfPlayerFieldingBattedBall = record[FIRST_EXTRA_FIELD + 46]
    forcePlayAtSecond = record[FIRST_EXTRA_FIELD + 47]
    forcePlayAtThird = record[FIRST_EXTRA_FIELD + 48]
    forcePlayAtHome = record[FIRST_EXTRA_FIELD + 49]
    batterSafeOnError = record[FIRST_EXTRA_FIELD + 50]
    fateOfBatter = record[FIRST_EXTRA_FIELD + 51]
    fateOfRunnerOnFirst = record[FIRST_EXTRA_FIELD + 52]
    fateOfRunnerOnSecond = record[FIRST_EXTRA_FIELD + 53]
    fateOfRunnerOnThird = record[FIRST_EXTRA_FIELD + 54]
    runsScoredInHalfInningAfterThisEvent = record[FIRST_EXTRA_FIELD + 55]
    fielderWithSixthAssist = record[FIRST_EXTRA_FIELD + 56]
    fielderWithSeventhAssist = record[FIRST_EXTRA_FIELD + 57]
    fielderWithEighthAssist = record[FIRST_EXTRA_FIELD + 58]
    fielderWithNinthAssist = record[FIRST_EXTRA_FIELD + 59]
    fielderWithTenthAssist = record[FIRST_EXTRA_FIELD + 60]
    unknownFieldingCreditFlag = record[FIRST_EXTRA_FIELD + 61]
    uncertainPlay = record[FIRST_EXTRA_FIELD + 62]

    fielders = [{}, pitcher, catcher, firstBase, secondBase, thirdBase, shortStop, leftField, centerField, rightField]

    self.id = "event_" + gameId + "-" + eventNum
    self.game = gameId
    self.number = eventNum
    self.batter = resBatter
    self.batterHand = resBatterHand
    self.first = firstRunner
    self.second = secondRunner
    self.third = thirdRunner
    self.outs = outs
    self.eventText = eventText
    self.eventType = eventType
    self.errorPlayers = []
    self.putoutPlayers = [] 
    self.assistPlayers = []

    if Integer(firstErrorPlayer) != 0
      self.errorPlayers << fielders[Integer(firstErrorPlayer)]
    end

    if Integer(secondErrorPlayer) != 0
      self.errorPlayers << fielders[Integer(secondErrorPlayer)]
    end

    if Integer(thirdErrorPlayer) != 0
      self.errorPlayers << fielders[Integer(thirdErrorPlayer)]
    end

    # putouts
    if Integer(fielderWithFirstPutout) != 0
      self.putoutPlayers << fielders[Integer(fielderWithFirstPutout)]
    end

    if Integer(fielderWithSecondPutout) != 0
      self.putoutPlayers << fielders[Integer(fielderWithSecondPutout)]
    end

    if Integer(fielderWithThirdPutout) != 0
      self.putoutPlayers << fielders[Integer(fielderWithThirdPutout)]
    end

    # assists
    if Integer(fielderWithFirstAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithFirstAssist)]
    end
    
    if Integer(fielderWithSecondAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithSecondAssist)]
    end
    
    if Integer(fielderWithThirdAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithThirdAssist)]
    end
  
    if Integer(fielderWithFourthAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithFourthAssist)]
    end
  
    if Integer(fielderWithFifthAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithFifthAssist)]
    end
  
    if Integer(fielderWithSixthAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithSixthAssist)]
    end
  
    if Integer(fielderWithSeventhAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithSeventhAssist)]
    end
  
    if Integer(fielderWithEighthAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithEighthAssist)]
    end
  
    if Integer(fielderWithNinthAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithNinthAssist)]
    end
  
    if Integer(fielderWithTenthAssist) != 0
        self.assistPlayers << fielders[Integer(fielderWithTenthAssist)]
    end
    
    self.pitchSequence = pitchSequence
    
    self.atBat = false
    if atBat == "T"
      self.atBat = true 
    end
    
    self.hit = false
    if Integer(hit) > 0
      self.hit = true
    end
    
    self.sacHit = false
    if sacHit == "T"
      self.sacHit = true
    end
    
    self.sacFly = false
    if sacFly == "T"
      self.sacFly = true
    end
    
    self.stolenBases = [] 
    self.caughtStealing = [] 
    self.pickedOff = []
    
    # stolen bases
    if sbForRunnerOnFirst == "T"
      self.stolenBases << firstRunner
    end
    
    if sbForRunnerOnSecond == "T"
      self.stolenBases << secondRunner
    end
    
    if sbForRunnerOnTHird == "T"
      self.stolenBases << thirdRunner
    end

    # caught stealing
    if csForRunnerOnFirst == "T"
      self.caughtStealing << firstRunner
    end
    
    if csForRunnerOnSecond == "T"
      self.caughtStealing << secondRunner
    end
    
    if csForRunnerOnThird == "T"
      self.caughtStealing << thirdRunner
    end

    # pickoff
    if poForRunnerOnFirst == "T"
      self.pickedOff << firstRunner
    end
    
    if poForRunnerOnSecond == "T"
      self.pickedOff << secondRunner
    end
    
    if poForRunnerOnThird == "T"
      self.pickedOff << thirdRunner
    end

  end

end