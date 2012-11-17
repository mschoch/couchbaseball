function(doc, meta) {
    if(doc.type == "game") {
        emit([doc.date.substring(0,4), doc.home.id], 1)
        emit([doc.date.substring(0,4), doc.visitor.id], 1)
    }
}