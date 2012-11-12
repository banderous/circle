
def calculateTableOfSquares(list)
    return list.map {|x| list.map {|y| x * y}}
end

# Returns the list of minimum column widths for table.
def calculatePaddingForNumericTable(table)
    return table.transpose().map {|x| String(x.max).length}
end

# Prefixes each row in table with specified header.
def insertRowHeaders(table, headers)
    return headers.zip(table).map {|header, row| ([header] << row).flatten}
end

def getFormatStringForPadding(rowPadding)
    return rowPadding.map {|x| "%#{x}s"}.join(" ")
end

def printTableOfSquares(list)
    table = insertRowHeaders(calculateTableOfSquares(list), list)
    
    columnWidths = calculatePaddingForNumericTable(table)
    
    # Add the header row, with a prefixed blank for alignment.
    table = table.unshift(list.unshift(""))
    formatString = getFormatStringForPadding(columnWidths) + "\n"
    
    table.each {|row| printf(formatString, *row) }
end

# As requested, no library function in sight!
firstTenPrimes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
printTableOfSquares(firstTenPrimes)
