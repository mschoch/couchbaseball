function(doc, meta) {
    if(doc.type == "game") {
        emit([doc.home.id, doc.date.substring(0,4), doc.date.substring(5,7), doc.date.substring(8,10), doc.gameNumber], 1)
        emit([doc.visitor.id, doc.date.substring(0,4), doc.date.substring(5,7), doc.date.substring(8,10), doc.gameNumber], 1)
    }
}