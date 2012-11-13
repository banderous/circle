#!/usr/bin/env ruby

def calculateTableOfSquares(list)
    return list.map {|x| list.map {|y| x * y}}
end

# Returns the list of minimum column widths for table.
def calculatePaddingForNumericTable(table)
    return table.transpose().map {|x| String(x.max).length}
end

# Prefixes each row in table with specified header.
def insertRowPrefixes(table, headers)
    return headers.zip(table).map {|header, row| ([header] << row).flatten}
end

def getFormatStringForPadding(rowPadding)
    return rowPadding.map {|x| "%#{x}s"}.join(" ")
end

def getTableOfSquares(list)
    table = insertRowPrefixes(calculateTableOfSquares(list), list)
    columnWidths = calculatePaddingForNumericTable(table)
    
    # Add the header row, with a prefixed blank column for alignment.
    table = table.unshift(list.unshift(""))
    formatString = getFormatStringForPadding(columnWidths)
    
    return table.map {|row| formatString % row }.join("\n")
end

=begin
 Based on the Sieve of Eratosthenes but modified to be incremental.
 
 Rather than searching to a fixed upper bound, we compute and discard composite numbers lazily,
 using iterators that track each prime number we find. Iterators are keyed on their next 
 multiple in an associative array and advanced by their prime when that number is checked.
=end
def firstNPrimes(n, p = 2, iterators = Hash.new {|hash, key| hash[key] = []})
    if (n == 0)
        return []
    end

    iteratorsAtP = iterators[p]
    iterators.delete(p);
    if (0 == iteratorsAtP.length)
        # Never touched so must be prime, add it to the iterators.
        iterators[p * p] << p
        return [p] + firstNPrimes(n - 1, p + 1, iterators)
    end
    # Cannot be prime if reached by an iterator. Advance our iterators
    # to their next composites.
    iteratorsAtP.each {|x| iterators[p + x] << x}
    return firstNPrimes(n, p + 1, iterators)
end

puts getTableOfSquares(firstNPrimes(10))
