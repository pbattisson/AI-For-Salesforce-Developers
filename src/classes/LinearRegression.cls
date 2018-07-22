public with sharing class LinearRegression {
	
	private Double coefficient {get; private set;}
	private Double intercept {get; private set;}

	private List<Double> x_train {get; private set;}
	private List<Double> y_train {get; private set;}
	
	public LinearRegression(List<Double> x_data, List<Double> y_data) {
		x_train = x_data;
		y_train = y_data;
	}

	public void train() {
		Double mean_x = MathUtil.mean(x_train);
		Double mean_y = MathUtil.mean(y_train);
		coefficient = MathUtil.pearsonCorrelation(x_train, y_train);
		intercept = mean_y - coefficient*mean_x;
	}

	public Double predict(Double value) {
		return intercept + coefficient*value;
	}

	public Double rootMeanSquaredError() {
		List<Double> predictions = new List<Double>();
		Integer num_items = x_train.size();
		for(Integer i = 0; i < num_items; i++) {
			predictions.add(predict(x_train[i]));
		}

		List<Double> squaredErrors = new List<Double>();
		for(Integer i = 0; i < num_items; i++) {
			squaredErrors.add(Math.pow(predictions[i] - y_train[i], 2));
		}

		return MathUtil.mean(squaredErrors);
	}	
}