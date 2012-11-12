
def calculateTableOfSquares(list)
    return list.map {|x| list.map {|y| x * y}}
end

def calculatePaddingForNumericTable(table)
    return table.transpose().map {|x| String(x.max).length}
end

def insertRowHeaders(table, headers)
    return headers.zip(table).map {|header, row| ([header] << row).flatten}
end

def getFormatStringForPadding(rowPadding)
    return rowPadding.map {|x| "%" + String(x) + "d"}.join(" ") + "\n"
end

def printNumericTable(list)
    table = insertRowHeaders(calculateTableOfSquares(list), list)
    columnWidths = calculatePaddingForNumericTable(table)
    headerRow = list.unshift(0 * columnWidths[0])
    table = table.unshift(headerRow)
    formatString = getFormatStringForPadding(columnWidths)
    
    table.each {|row| printf(formatString, *row) }
    return
end
