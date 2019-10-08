Die d = new Die(20, 20, 40);
int sum = 0;
int runs = 0;
int movingAverage = 0;
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
	for (int y = 1; y <= 6; y++) {
		for (int x = 1; x <= 6; x++) {
			d = new Die(x * 50 - 45, y * 45 - 40, 40);
			d.roll();
			sum += d.value;
			d.show();
		}
	}
	movingAverage = (sum + (runs - 1) * movingAverage) / runs;
	textAlign(CENTER);
	text("Sum: " + sum, width / 2, 290);
	textAlign(LEFT);
	text("Moving Average:" + movingAverage, 5, 290);

}
void mousePressed()
{
	redraw();
}
void keyPressed()
{
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
