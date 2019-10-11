Die d = new Die(20, 20, 40);
int totalSum = 0;
int sum = 0;
int runs = 0;
int rows = 8;
int columns = 6;

double movingAverage = 0;
boolean drawing = false;

void setup()
{
	size(300, 300);
	noLoop();
}
void draw()
{
	background(167);
	sum = 0;
	runs++;

	float xOffset = 5;
	float yOffset = 5;

	float xSpacing = (width - 10) / (float) columns;
	//System.out.println(xSpacing);
	float ySpacing = (height - 25) / (float) rows;
	//System.out.println(ySpacing);

	int diceSize = (int)(Math.min(xSpacing, ySpacing));
	if (xSpacing > ySpacing) {
		//System.out.println("x > y");
	}
	else {
		//System.out.println("y > x");
	}
	//System.out.println("Dice size: " + diceSize);
	//int diceSize = ((height - 25) / Math.max(rows, columns) - 1);



	// if (xSpacing < ySpacing) {
	// 	yOffset = ((height - 25) - (ySpacing * rows) + diceSize) / 2.;
	// }
	// else {
	// 	xOffset = ((width - 10) - (xSpacing * columns) + diceSize) / 2.;	
	// }
	xOffset = ((width) - (xSpacing * (columns - 1)) - diceSize / 2) / 2.;	
	//System.out.println(xOffset);
	//System.out.println(yOffset);

	for (int y = 0; y < rows; y++)
	{
		for (int x = 0; x < columns; x++)
		{
			d = new Die(x * xSpacing + xOffset, y * ySpacing + 5, diceSize);
			
			sum += d.roll();
			d.show();
		}
	}
	totalSum += sum;
	textAlign(CENTER);
	text("Sum: " + sum, width / 2, 295);
	textAlign(LEFT);
	text("# of dice:" + rows * columns, 5, 295);
	textAlign(RIGHT);
	text("All rolls:" + totalSum, 295, 295);

}
void mousePressed()
{
	redraw();
}
void keyPressed()
{
	if (keyCode == LEFT) {
		if (columns > 1) {
			--columns;
			redraw();
		}
	}
	else if (keyCode == RIGHT) {
		++columns;
		redraw();
	}
	else if (keyCode == UP) {
		++rows;
		redraw();
	}
	else if (keyCode == DOWN) {
		if (rows > 1) {
			--rows;
			redraw();
		}
		
	}
	else if (key == 'r' || key == 'R') {
		if (drawing) {
		noLoop();
		}
		else {
			loop();
		}
		drawing = !drawing;
	}

	
}


class Die //models one single dice cube
{
	//variable declarations here
	float x, y;
	int size, dotSize;
	int value;
	
	Die(float _x, float _y, int _size) //constructor
	{
		//variable initializations here
		x = _x;
		y = _y;
		size = _size;
		dotSize = size / 5;
		value = 0;
	}
	int roll()
	{
		//your code here
		value = (int)(Math.random() * 6 + 1);
		return value;
	}
	void show()
	{
		//your code here
		fill(255);
		stroke(0);
		strokeWeight(2);
		rect(x, y, size, size, 4, 4, 4, 4);

		fill(0);
		noStroke();
		switch (value) {
			case 1:
				ellipse(x + size / 2, y + size / 2, dotSize, dotSize);
				break;
			case 2:
				ellipse(x + size / 4, y + size / 4, dotSize, dotSize);
				ellipse(x + size * 3 / 4, y + size * 3 / 4, dotSize, dotSize);
				break;
			case 3:
				ellipse(x + size / 4, y + size / 4, dotSize, dotSize);
				ellipse(x + size / 2, y + size / 2, dotSize, dotSize);
				ellipse(x + size * 3 / 4, y + size * 3 / 4, dotSize, dotSize);
				break;
			case 4:
				ellipse(x + size / 4, y + size / 4, dotSize, dotSize);
				ellipse(x + size * 3 / 4, y + size / 4, dotSize, dotSize);
				ellipse(x + size / 4, y + size * 3 / 4, dotSize, dotSize);
				ellipse(x + size * 3 / 4, y + size * 3 / 4, dotSize, dotSize);
				break;
			case 5:
				ellipse(x + size / 4, y + size / 4, dotSize, dotSize);
				ellipse(x + size * 3 / 4, y + size / 4, dotSize, dotSize);
				ellipse(x + size / 4, y + size * 3 / 4, dotSize, dotSize);
				ellipse(x + size * 3 / 4, y + size * 3 / 4, dotSize, dotSize);
				ellipse(x + size / 2, y + size / 2, dotSize, dotSize);
				break;
			case 6:
				ellipse(x + size / 4, y + size / 4, dotSize, dotSize);
				ellipse(x + size / 4, y + size / 2, dotSize, dotSize);
				ellipse(x + size / 4, y + size * 3/ 4, dotSize, dotSize);
				ellipse(x + size * 3 / 4, y + size / 4, dotSize, dotSize);
				ellipse(x + size * 3 / 4, y + size / 2, dotSize, dotSize);
				ellipse(x + size * 3 / 4, y + size * 3/ 4, dotSize, dotSize);
				break;
		}
	}
}
