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
        assert_equal("%1d %5d", getFormatStringForPadding([1, 5]))
    end
    
    def testInsertsRowHeaders
       assert_equal([[4, 1, 2]], insertRowHeaders([[1, 2]], [4]))
    end
end
