PrintWriter output;

void setup() {
  // Create a new file in the sketch directory
  size(1000, 1000);
  output = createWriter("positions.txt");
}

void draw() {
  if (millis()%10==1) {
    ellipse(mouseX, mouseY, 10, 10);
    output.println("ellipse(" + mouseX + " , " + mouseY+ ", 10 , 10);"); // Write the coordinate to the file
  }
}

void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}
