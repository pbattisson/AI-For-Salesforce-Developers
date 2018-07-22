/**
  * @author Paul Battisson
  * @description This is the basic matrix class we will be using to help us define a matrix within our mathematical framework.
  */

public with sharing class Matrix 
{
	// Utility variables that we will need as we go
	public Integer rows {get; private set;}
	public Integer columns {get; private set;}

	//Our data elements
	private List<List<Double>> elements;

	//Initialise with JSON - will be useful later
	public Matrix(String JSONData) {

		this((List<List<Double>>)JSON.deserialize(JSONData, List<List<Double>>.class));
	}

	//Initialise a matrix with a given number of rows and columns	
	public Matrix(Integer numRows, Integer numCols) {
		rows = numRows;
		columns = numCols;

		elements = new List<List<Double>>();

		for(Integer i = 0; i < numRows; i++) {
			elements.add(new Double[numCols]);
		}
	}

	//Initialise a matrix with a set of elements
	public Matrix(List<List<Double>> elems) {
		if(elems != null) {
			elements = elems;
			rows = elements.size();
			columns = elements.get(0).size();
		}
	}

	//Initialise a matrix with a set of data
	public Matrix(List<Double> elems) {
		if(elems != null) {
			elements = new List<List<Double>>();
			elements.add(elems);
			rows = elements.size();
			columns = elements.get(0).size();
		}
	}

	//Set a specific element in the matrix
	public void setElement(Integer rowNum, Integer colNum, Double value) {
		if(rowNum < rows && colNum < columns && rowNum >= 0 && colNum >= 0) {
			elements.get(rowNum).set(colNum, value);
		}
	}

	//Retrieve a specific element from the matrix
	public Double getElement(Integer rowNum, Integer colNum) {
		if(rowNum < rows && colNum < columns && rowNum >= 0 && colNum >= 0) {
			return elements.get(rowNum).get(colNum);
		}

		return null;
	}

	//Get an entire row
	public List<Double> getRow(Integer rowNum) {
		return elements.get(rowNum);
	}

	//Set an entire row
	public void setRow(List<Double> row, Integer rowNum) {
		elements[rowNum] = row;
	}

	//Fill a matrix with zeroes
	public void Zeros() {
		fill(0);
	}

	//Create a printable form of the matrix for the debug log or screen
	public String Print() {
		String output = '\n';
		for(Integer i = 0; i < rows; i++) {
			for(Integer j = 0; j < columns; j++) {
				output += getElement(i, j) + '\t';
			}
			output += '\n';
		}
		return output;
	}

	//Get the matrix as a single long list
	public List<Double> getDataAsList() {
		
		List<Double> data = new List<Double>();

		for(List<Double> row : elements) {
			data.addAll(row);
		}

		return data;
	}

	//Create a matrix where every element is a specific value
	public void fill(Double value) {
		for(Integer i = 0; i < rows; i++) {
			for(Integer j = 0; j < columns; j++) {
				elements.get(i).set(j, value);
			}
		}
	}

	//Serialise our matrix to JSON
	public String toJSON() {
		return JSON.serialize(elements);
	}
}