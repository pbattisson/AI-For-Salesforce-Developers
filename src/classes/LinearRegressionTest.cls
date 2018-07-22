@isTest
private class LinearRegressionTest {

	private static List<Double> testInputs = new List<Double>{1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0};
	private static List<Double> testOutputs = new List<Double>{9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0};
	
	@isTest 
	private static void testPredict() {
		Double predictionInput = 10.0;
		LinearRegression regression = new LinearRegression(testInputs, testOutputs);
		regression.train();
		System.assertEquals(0, ((Decimal)(regression.predict(predictionInput))).setScale(3));
	}

	@isTest
	private static void testRootMeanSquaredError() {
		LinearRegression regression = new LinearRegression(testInputs, testOutputs);
		regression.train();
		System.assertEquals(0, ((Decimal)(regression.rootMeanSquaredError())).setScale(3));
	}
	
}