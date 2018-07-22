public with sharing class MathUtil {

	public static Double sum(List<Double> items) {
		Double sum = 0;
		Integer numItems = items.size();

		for(Integer i = 0; i < numItems; i++) {
			sum += items[i];
		}
		
		return sum;
	}

	public static Double mean(List<Double> items) {
		Double sum = sum(items);
		Integer numItems = items.size();

		return sum/numItems;
	}

	public static Double standardDeviation(List<Double> items) {
		return Math.sqrt(variance(items));
	}

	/*
		NOTE:
		===== 
		The assumption is being made here that we are working on a sample of the overall
		population and not the total population.
	*/
	public static Double variance(List<Double> items) {
		Double mean = mean(items);

		Matrix itemMatrix = new Matrix(items);
		Matrix meanMatrix = new Matrix(1, items.size());
		meanMatrix.fill(mean);

		Matrix diffs = MatrixOperations.subtract(itemMatrix, meanMatrix);
		diffs = MatrixOperations.pointwiseExponent(diffs, 2);
		List<Double> diffList = diffs.getRow(0);
		
		return sum(diffList)/(diffList.size() - 1);
	}

	public static Double pearsonCorrelation(List<Double> x, List<Double> y) {
		Double mean_x = mean(x);
		Double mean_y = mean(y);
		Double std_x = standardDeviation(x);
		Double std_y = standardDeviation(y);

		List<Double> xy = new List<Double>();
		Integer numItems = x.size();
		Double x_diff, y_diff;
		for(Integer i = 0; i < numItems; i++) {
			x_diff = x[i] - mean_x;
			y_diff = y[i] - mean_y;
			xy.add((x_diff/std_x)*(y_diff/std_y));
		}

		return sum(xy)/(numItems - 1);
	}
}