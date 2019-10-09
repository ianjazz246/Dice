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

	int diceSize = ((height - 25) / Math.max(rows, columns) - 1);
	int xSpacing = ((width - 10) / rows);
	int ySpacing = ((height -0 - diceSize) / columns);

	for (int y = 0; y < rows; y++)
	{
		for (int x = 1; x <= columns; x++)
		{
			d = new Die(x * xSpacing - xSpacing + 5, y * ySpacing + 5, diceSize);
			d.roll();
			sum += d.value;
			d.show();
		}
	}
	totalSum += sum;
	textAlign(CENTER);
	text("Sum: " + sum, width / 2, 290);
	textAlign(LEFT);
	text("# of dice:" + rows * columns, 5, 290);
	textAlign(RIGHT);
	text("All rolls:" + totalSum, 295, 290);

}
void mousePressed()
{
	redraw();
}
void keyPressed()
{
	if (keyCode == LEFT) {

	}

	if (drawing) {
		noLoop();
	}
	else {
		loop();
	}
	drawing = !drawing;
}


class Die //models one single dice cube
{
	//variable declarations here
	int x, y, size, dotSize;
	int value;
	
	Die(int _x, int _y, int _size) //constructor
	{
		//variable initializations here
		x = _x;
		y = _y;
		size = _size;
		dotSize = size / 5;
		value = 0;
	}
	void roll()
	{
		//your code here
		value = (int)(Math.random() * 6 + 1);
	}
	void show()
	{
		//your code here
		fill(255);
		stroke(0);
		strokeWeight(2);
		rect(x, y, size, size);

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
