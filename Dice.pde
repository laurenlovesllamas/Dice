int cols = 8;  
int rows = 8;  
int[][] diceValues = new int[cols][rows];  // Array to store dice values
int sum = 0;  
int diceSize = 50;  
int padding = 50;   

void setup() {
  size(500, 500);  
  noLoop();  // Only draw when mouse is pressed
  
  rollAllDice();  
}

void draw() {
  background(255);
  sum = 0;  // Reset sum

  // Draw each die and calculate sum
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = padding + i * diceSize;  
      int y = padding + j * diceSize;  
      int value = diceValues[i][j];
      
      // Draw dice square
      fill(255);
      rect(x, y, diceSize, diceSize);
      
      fill(0);
      textSize(20);
      text(value, x + diceSize / 2 - 5, y + diceSize / 2 + 5);
      
      sum += value;
    }
  }
  
  // Display the sum at the bottom
  fill(0);
  textSize(16);
  text("Sum: " + sum, 10, height - 10);
}

void mousePressed() {
  rollAllDice();  
  redraw();  
}

void rollAllDice() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      diceValues[i][j] = int(random(1, 7));  
    }
  }
}
