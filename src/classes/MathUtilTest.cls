@isTest
private class MathUtilTest {
	
	private static List<Double> testData = new List<Double>{1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0};
	private static List<Double> testOutputs = new List<Double>{9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0};
	
	@isTest
	static void testSum() {
		System.assertEquals(45, MathUtil.sum(testData));
	}

	@isTest 
	static void testMean() {
		System.assertEquals(5, MathUtil.mean(testData));
	}
	
	@isTest 
	static void testStandardDeviation() {
		System.assertEquals(2.739, ((Decimal)(MathUtil.standardDeviation(testData))).setScale(3));
	}

	@isTest 
	static void testVariance() {
		System.assertEquals(7.5, ((Decimal)(MathUtil.variance(testData))).setScale(1));
	}

	@isTest
	static void testPearsonCorrelation() {
		System.assertEquals(-1, ((Decimal)(MathUtil.pearsonCorrelation(testData, testOutputs))).setScale(3));
	}
	
}