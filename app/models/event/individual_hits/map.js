function(doc, meta) {
    if(doc.type == "event" && doc.hit) {
        date = doc.game.substring(3,11)
        year = date.substring(0,4)
        month = date.substring(4,6)
        day = date.substring(6,8)
        emit([doc.batter, year, month, date], 1)
    }
}