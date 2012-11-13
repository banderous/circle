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
 using iterators that track each prime number we find. The iterators are keyed to their next 
 multiple in an associative array; when a value is reached, any iterators are advanced by
 their respective primes.
=end
def firstNPrimes(n)
    result = []

    # Set a default creator for when keys are not found.
    iterators = Hash.new {|hash, key| hash[key] = []}
    
    # Our first iterator is the first prime number.
    p = 2
    iterators[p * p] << p
    while result.length < n
        iteratorsAtP = iterators[p]
        iterators.delete(p);
        if (0 == iteratorsAtP.length)
            # Never touched so must be prime, add it to the iterators.
            iterators[p * p] << p
            result << p
        else
            # Cannot be prime if reached by an iterator. Advance our iterators
            # to their next composites.
            iteratorsAtP.each {|x| iterators[p + x] << x}
        end
        p = p + 1
    end
    
    return result
end

puts getTableOfSquares(firstNPrimes(10))
