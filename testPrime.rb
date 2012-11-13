#!/usr/bin/env ruby

require "prime"
require "test/unit"
 
class TestPrime < Test::Unit::TestCase
 
    def testEmptySquaresTable
        assert_equal([], calculateTableOfSquares([]))
    end
    
    def testSquaresOfSingleElementTable
      assert_equal([[1]], calculateTableOfSquares([1]))
    end
    
    def testSquaresOf2X2Table
        assert_equal([[1, 2],
                      [2, 4]],
                     calculateTableOfSquares([1, 2]))
    end

    def testPaddingEmptyTable
        assert_equal([], calculatePaddingForNumericTable([]))
    end
    
    def testPadsToWidestColumnEntry
        assert_equal([3, 1],
                     calculatePaddingForNumericTable([[1, 2],
                                                      [123, 3]]))
    end
    
    def testConstructsFormatStringWithWidths
        assert_equal("%1s %5s", getFormatStringForPadding([1, 5]))
    end
    
    def testInsertsRowPrefix
       assert_equal([[4, 1, 2]], insertRowPrefixes([[1, 2]], [4]))
    end
    
    def testCompleteTableFormattedAsString
        assert_equal("  1\n1 1", getTableOfSquares([1]));
    end
end
