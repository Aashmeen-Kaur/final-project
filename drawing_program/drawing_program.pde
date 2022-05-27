void setup() {
  //Initialize Screen size and color
  size(1024, 766);
  background(255);
  //Load font
  font = loadFont("ComicSansMS-100.vlw");
  textFont(font);
  //Change color mode from here on out
  colorMode(HSB, 100);
  black = color(0, 100);
  white = color(100, 100);
  red = color(100, 100, 100);
  cyan = color(50, 100, 100);
  gray = color(40, 100);
  //previousFrame's initial screen
  previousFrame = new PImage(panelWidth, height);
}

//draw the initial draw panel
void initializePanel() {
  strokeWeight(1);
  //Draw panelColor drawing panel
  noStroke();
  fill(panelColor);
  rect(0, 0, panelWidth, 766);
  //
  strokeWeight(1);
  noStroke();
  fill(panelColor);
  rect(0, 0, 900, 115);

  //Brush color box: the color of the Alternative brush color
  //Text: "Brush Color"
  fill(black);
  textSize(16);
  text("Brush Color", 5, 16);

  //Text: "<BrushSize>"
   fill(black);
  textSize(16);
  text("Brush Size", 5, 280);
  
  //Text: "<BrushSize>"
  fill(black);
  textSize(20);
  text(brushSize, 14, 310);
 
  //Text: "Background"
  fill(black);
  textSize(16);
  text("Background", 120, 16);
  
  //Draw GradientBG button box
  if (fillGradientBG) {
    fill(white);
    stroke(white);
    triangle(120, 50, 120, 25, 220, 25);
    fill(gray);
    stroke(gray);
    triangle(120, 50, 225, 49, 225, 25);
    //Text: "GradientBG"
    fill(black);
    textSize(16);
    text("GradientBG", 125, 45);
  } else {
    fill(white);
    stroke(white);
    triangle(120, 50, 120, 25, 220, 25);
    fill(gray);
    stroke(gray);
    triangle(120, 50, 225, 49, 225, 25);
    //Text: "GradientBG"
    fill(black);
    textSize(16);
    text("GradientBG", 125, 45);
  }

  //Draw Background button box
  if (fillBackground) {
    fill(gray);
    stroke(gray);
    rect(120, 55, 105, 22);
    //Text: "FillBG"
    fill(black);
    textSize(16);
    text("FillBG", 120, 74);
  } else {
    fill(gray);
    stroke(gray);
    rect(120, 55, 105, 22);
    //Text: "FillBG"
    fill(black);
    textSize(16);
    text("FillBG", 120, 74);
  }

  //Clear Background button box
  if (clearBackground) {
    fill(gray);
    stroke(gray);
    rect(120, 84, 105, 22);
    //Text: "ClearBG"
    fill(black);
    textSize(16);
    text("ClearBG", 120, 100);
  } else {
    fill(gray);
    stroke(gray);
    rect(120, 84, 105, 22);
    //Text: "ClearBG"
    fill(black);
    textSize(16);
    text("ClearBG", 120, 100);
  }

  //Draw random color button box
  if (randomColor) {
    for (int i = 5; i < 96; i++) {
      stroke(i, 100, 100);
      line(i, 230, i, 255);
    }
    //Text: "Random"
    fill(white);
    textSize(16);
    text("   Random", 8, 249);
  } else {
    for (int i = 5; i < 96; i++) {
      stroke(i, 100, 100, 20);
      line(i, 230, i, 255);
    }
    //Text: "Random"
    fill(white);
    textSize(16);
    text("   Random", 8, 249);
  }

  //Draw Brush Color Bar
 for (int i = 0; i < 200; i += 2) {
    stroke(i / 2, 100, 100);
    line(5, 20 + i, 30, 20 + i);
    line(5, 20 + i + 1, 30, 20 + i + 1);
  }
  for (int i = 0; i < 200; i += 2) {
    stroke(i / 2, 100);
    line(35, 20 + i, 60, 20 + i);
    line(35, 20 + i + 1, 60, 20 + i + 1);
  }
  //Draw this bar once
  if (drawAlphaBar == true) {
    for (int i = 0; i < 200; i += 2) {
      stroke(100, 100, 100, i/2);
      line(65, 20 + i, 90, 20 + i);
      line(65, 20 + i + 1, 90, 20 + i + 1);
    }
  }

  //Draw brushColorBars 1 through 3 for Alt brush
  stroke(white);
  line(5, 20 + brushColorBar1YAlt, 30, 20 + brushColorBar1YAlt);
  line(65, 20 + brushColorBar3YAlt, 90, 20 + brushColorBar3YAlt);
  stroke(cyan);
  line(35, 20 + brushColorBar2YAlt, 60, 20 + brushColorBar2YAlt);
  //Draw brushColorBars 1 through 3
  stroke(black);
  line(5, 20 + brushColorBar1Y, 30, 20 + brushColorBar1Y);
  line(65, 20 + brushColorBar3Y, 90, 20 + brushColorBar3Y);
  stroke(red);
  line(35, 20 + brushColorBar2Y, 60, 20 + brushColorBar2Y);

  //Draw Brush Size Right-Triangle and Bar
  for (int i = 0; i < 91; i++) {
    if (brushSizeBarXAlt == i) {
      stroke(white);
    } else {
      stroke(brushColor);
    }
    if (brushSizeBarX == i) {
      stroke(black);
    }
    line(5 + i, 380, 5 + i, 380 - i);
  }
}

//Draw the help panel
void drawHelpPanel() {
  //gray overlay
  fill(black);
  noStroke();
  rect(200, 200, 700,450);

  //Info for Brush Color
  fill(white);
  textSize(helpPanelFontSize);
  text("[1st Bar] = RBG", 210, 18 * helpPanelFontSize );
  text("Is to pick a color for you brush or background ", 210, 19.5 * helpPanelFontSize);
    text("", 210, 20 * helpPanelFontSize);
  text("[2nd Bar] = shades ", 210, 21 * helpPanelFontSize);
  text("Is to use black, white, or grey. Since RGB bar doesn't have those", 210, 22.5 * helpPanelFontSize);
    text("", 210, 23 * helpPanelFontSize);
  text("[3rd Bar] = opasity", 210, 24 * helpPanelFontSize);
  text("is for you to set the oopacity of the colors", 210, 25.5 *helpPanelFontSize);
    text("", 210, 26 * helpPanelFontSize);
  text("Brush Size", 210, 27 *helpPanelFontSize);
  text("Is to set the size of your brush", 210, 28.5 *helpPanelFontSize);
    text("", 210, 29 * helpPanelFontSize);
  text("Gradient Background", 210, 30 *helpPanelFontSize);
  text("After choosing you color click the button to make the background ombre", 210, 31.5 *helpPanelFontSize);
    text("", 210, 32 * helpPanelFontSize);
  text("Fill background: make the background the color of your choice", 210, 33 *helpPanelFontSize);
  text("Clear background: to start on a new canvas", 210, 34.2 *helpPanelFontSize);
  text("Random: Make the background or your pen color rainbow", 210, 35.4 *helpPanelFontSize);
}

void draw() {
  //Determine brush color
  if (brushColorBW) {
    brushColor = color(brushColorHue, brushColorAlp);
  } else {
    brushColor = color(brushColorHue, brushColorSat, brushColorBri, brushColorAlp);
  }

  if (brushColorBWAlt) {
    brushColorAlt = color(brushColorHueAlt, brushColorAlpAlt);
  } else {
    brushColorAlt = color(brushColorHueAlt, brushColorSatAlt, brushColorBriAlt, brushColorAlpAlt);
  }

  //Display draw panel or not
  if (displayPanel == true) {
    drawAlphaBar = true;
    initializePanel();

    //Check if user wants to display the help
    if (helpPanel == true) {
      drawHelpPanel();
    }
  }

  //Draw gradientBG if directed
  if (fillGradientBG) {
    if (displayPanel) {
      colorMode(HSB, 360);
      if (!brushColorBW) {
        if (randomColor) {
          for (float i = 0.0; i < height; i++) {
            stroke(i * (360.0/height), 3.6 * brushColorSat, 3.6 * brushColorBri, i * ((4.0 * gradientX)/height));
            line(panelWidth, i, width, i);
          }
        } else {
          for (float i = 0; i < height; i++) {
            strokeWeight(1);
            stroke(brushColorHue * 3.6, brushColorSat * 3.6, brushColorBri * 3.6, i * ((4.0 * gradientX)/766.0));
            line(panelWidth, i, width, i);
          }
        }
        fillGradientBG = false;
      } else {
        for (float i = 0; i < height; i++) {
          strokeWeight(1);
          stroke(brushColorHue * 3.6, i * ((4.0 * gradientX)/766.0));
          //print("i = " + i + ": ");
          //println(3.6, i * (200.0/766.0));
          line(panelWidth, i, width, i);
        }
        fillGradientBG = false;
      }
      colorMode(HSB, 100);
    } else {
      colorMode(HSB, 360);
      if (!brushColorBW) {
        if (randomColor) {
          for (float i = 0.0; i < height; i++) {
            stroke(i * (360.0/height), 3.6 * brushColorSat, 3.6 * brushColorBri, i * ((4.0 * gradientX)/height));
            line(0, i, width, i);
          }
        } else {
          for (float i = 0; i < height; i++) {
            strokeWeight(1);
            stroke(brushColorHue * 3.6, brushColorSat * 3.6, brushColorBri * 3.6, i * ((4.0 * gradientX)/766.0));
            line(0, i, width, i);
          }
        }
        fillGradientBG = false;
      } else {
        for (float i = 0; i < height; i++) {
          strokeWeight(1);
          stroke(brushColorHue * 3.6, i * ((4.0 * gradientX)/766.0));
          line(0, i, width, i);
        }
        fillGradientBG = false;
      }
      colorMode(HSB, 100);
    }
  } 

  //Draw background if directed
  if (fillBackground) {
    if (displayPanel) {
      if (randomColor) {
        colorMode(HSB, 360);
        for (float i = 0.0; i < height; i++) {
          stroke(i * (360.0/height), 3.6 * brushColorSat, 3.6 * brushColorBri, 3.6 * brushColorAlp);
          line(panelWidth, i, width, i);
        }
        colorMode(HSB, 100);
      } else {
        fill(brushColor);
        stroke(brushColor);
        rect(panelWidth, 0, width, height);
      }
    } else {
      if (randomColor) {
        colorMode(HSB, 360);
        for (float i = 0.0; i < height; i++) {
          stroke(i * (360.0/height), 3.6 * brushColorSat, 3.6 * brushColorBri, 3.6 * brushColorAlp);
          line(0, i, width, i);
        }
        colorMode(HSB, 100);
      } else {
        fill(brushColor);
        stroke(brushColor);
        rect(0, 0, width, height);
      }
    }
    fillBackground = false;
  }

  if (clearBackground) {
    if (displayPanel) {
      fill(white);
      noStroke();
      rect(panelWidth, 0, width, height);
    } else {
      fill(white);
      noStroke();
      rect(0, 0, width, height);
    }
    clearBackground = false;
  }


  //Listen for mouse events
  if (mousePressed) {
    //If the display panel is there, detect the clicking of the options
    if (displayPanel) {
      //If mouse clicks on "GradientBG" Button
      if (mouseX > 120 && mouseX < 227 && mouseY > 10 && mouseY < 50) {
        fillGradientBG = true;
        gradientX = mouseX;
      }
      //If mouse clicks on "FillBG" Button
      if (mouseX > 120 && mouseX < 227 && mouseY > 52 && mouseY < 80) {
        fillBackground = true;
      }
      //If mouse clicks on "ClearBG" Button
      if (mouseX > 120 && mouseX < 227 && mouseY > 82 && mouseY < 110) {
        clearBackground = true;
      }
      //If mouse clicks on "Random" Button
      if (mouseX > 5 && mouseX < 96 && mouseY > 228 && mouseY < 257) {
        if (frameCount > randomColorFrameCount + inputDelay) {
          if (randomColor) {
            randomColor = false;
          } else {
            randomColor = true;
          }
        }
        randomColorFrameCount = frameCount;
      }
      //If mouse clicks on bars
      if (mouseX > 0 && mouseX < panelWidth && mouseY > 0 && mouseY < height) {
        if (mouseButton == LEFT) {
          if (mouseX > 5 && mouseX < 30 && mouseY > 20 && mouseY < 220) {
            //brushColor = color((mouseY - 15) / 2, 100, 100);
            brushColorHue = (mouseY - 15) / 2;
            brushColorBW = false;
            brushColorBar1Y = mouseY - 20;
          }
          if (mouseX > 35 && mouseX < 60 && mouseY > 20 && mouseY < 220) {
            brushColorHue = (mouseY - 15) / 2;
            brushColorBW = true;
            brushColorBar2Y = mouseY - 20;
          }
          if (mouseX > 65 && mouseX < 90 && mouseY > 20 && mouseY < 220) {
            brushColorAlp = (mouseY - 15) / 2;
            brushColorBar3Y = mouseY - 20;
          }
          if (mouseX > 5 && mouseX < 96 && mouseY > 300 && mouseY < 370) {
            brushSize = mouseX - 5;
            brushSizeBarX = mouseX - 5;
          }
        } else if (mouseButton == RIGHT) {
          if (mouseX > 5 && mouseX < 30 && mouseY > 20 && mouseY < 220) {
            brushColorHueAlt = (mouseY - 15) / 2;
            brushColorBWAlt = false;
            brushColorBar1YAlt = mouseY - 20;
          }
          if (mouseX > 35 && mouseX < 60 && mouseY > 20 && mouseY < 220) {
            //brushColor = color((mouseY - 15) / 2, 100);
            brushColorHueAlt = (mouseY - 15) / 2;
            brushColorBWAlt = true;
            brushColorBar2YAlt = mouseY - 20;
          }
          if (mouseX > 65 && mouseX < 90 && mouseY > 20 && mouseY < 220) {
            brushColorAlpAlt = (mouseY - 15) / 2;
            brushColorBar3YAlt = mouseY - 20;
          }
          if (mouseX > 5 && mouseX < 96 && mouseY > 350 && mouseY < 370) {
            brushSizeAlt = mouseX - 5;
            brushSizeBarXAlt = mouseX - 5;
          }
        }
      }
  



      //If mouse is within the canvas while displayPanel is displayed
      if (mouseX > panelWidth && mouseX < width && mouseY > 0 && mouseY < height) {
        if (drawCircle || drawEllipse || drawSquare 
          || drawRectangle|| drawTriangle || drawLine) {
          if (drawSquare) { //Draw Square
            if (randomColor) {
              fill(random(0, 100), 100, 100, brushColorAlp);
              stroke(random(0, 100), 100, 100, brushColorAlp);
            } else {
              fill(brushColor);
              stroke(brushColorAlt);
            }
            rectMode(CENTER);
            rect(mouseX, mouseY, brushSize * 8, brushSize * 8);
            rectMode(CORNER);
          }
          if (drawRectangle) { //Draw Rectangle
            if (randomColor) {
              fill(random(0, 100), 100, 100, brushColorAlp);
              stroke(random(0, 100), 100, 100, brushColorAlp);
            } else {
              fill(brushColor);
              stroke(brushColorAlt);
            }
            rectMode(CENTER);
            rect(mouseX, mouseY, brushSize * 8, brushSizeAlt * 8);
            rectMode(CORNER);
          }
          if (drawCircle) { //Draw Circle
            if (randomColor) {
              fill(random(0, 100), 100, 100, brushColorAlp);
              stroke(random(0, 100), 100, 100, brushColorAlp);
            } else {
              fill(brushColor);
              stroke(brushColorAlt);
            }
            ellipse(mouseX, mouseY, brushSize * 8, brushSize * 8);
          }
          if (drawEllipse) { //Draw Ellipse
            if (randomColor) {
              fill(random(0, 100), 100, 100, brushColorAlp);
              stroke(random(0, 100), 100, 100, brushColorAlp);
            } else {
              fill(brushColor);
              stroke(brushColorAlt);
            }
            ellipse(mouseX, mouseY, brushSize * 8, brushSizeAlt * 8);
          }
          if (drawTriangle) { //Draw Triangle
            if (randomColor) {
              fill(random(0, 100), 100, 100, brushColorAlp);
              stroke(random(0, 100), 100, 100, brushColorAlp);
            } else {
              fill(brushColor);
              stroke(brushColorAlt);
            }
            //x, y: CEIL(SQRT((size^2)/2)) = dist :: triangle(x, y - dist, x + dist, y + dist, x - dist, y + dist)
            //triangle(25, 507, 43, 543, 7, 543);  given 25, 525
            int distance = brushSize * 8;
            int distance2 = (int) Math.ceil((Math.sqrt((distance * distance) / 2)));
            triangle(mouseX, mouseY - distance2, mouseX + distance2, mouseY + distance2, mouseX - distance2, mouseY + distance2);
          }
        } else if (mouseButton == LEFT) { //Default LMB to draw
          if (randomColor) {
            stroke(random(0, 100), brushColorSat, brushColorBri, brushColorAlp);
          } else {
            stroke(brushColor);
          }
          strokeWeight(brushSize);
          line(pmouseX, pmouseY, mouseX, mouseY);
        } else if (mouseButton == RIGHT) { //Default RMB to draw
          if (randomColor) {
            stroke(random(0, 100), brushColorSatAlt, brushColorBriAlt, brushColorAlpAlt);
          } else {
            stroke(brushColorAlt);
          }
          strokeWeight(brushSizeAlt);
          line(pmouseX, pmouseY, mouseX, mouseY);
        }
      }
    }
    //If display panel is not showing
    if (!displayPanel) {
      //If mouse is anywhere within the canvas while displayPanel is not displayed
      if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
        if (drawLine) {
            //x, y: CEIL(SQRT((size^2)/2)) = dist :: triangle(x, y - dist, x + dist, y + dist, x - dist, y + dist)
            //triangle(25, 507, 43, 543, 7, 543);  given 25, 525
            int distance = brushSize * 8;
            int distance2 = (int) Math.ceil((Math.sqrt((distance * distance) / 2)));
            triangle(mouseX, mouseY - distance2, mouseX + distance2, mouseY + distance2, mouseX - distance2, mouseY + distance2);
          }
        } else if (mouseButton == LEFT) { //Default LMB to draw
          if (randomColor) {
            stroke(random(0, 100), brushColorSat, brushColorBri, brushColorAlp);
          } else {
            stroke(brushColor);
          }
          strokeWeight(brushSize);
          line(pmouseX, pmouseY, mouseX, mouseY);
        } else if (mouseButton == RIGHT) { //Default RMB to draw
          if (randomColor) {
            stroke(random(0, 100), brushColorSatAlt, brushColorBriAlt, brushColorAlpAlt);
          } else {
            stroke(brushColorAlt);
          }
          strokeWeight(brushSizeAlt);
          line(pmouseX, pmouseY, mouseX, mouseY);
        }
      }
    }
 

  //Listen for key events
  if (keyPressed) {
    //If '+' or '=' is pressed, show/hide panel
    if (key == '+' || key == '=') {
      displayPanel = true;
    }

    //If '-' or '_' is pressed, show/hide panel
    if (key == '-' || key == '_') {
      if (displayPanel) {
        fill(100, 100);
        noStroke();
        rect(0, 0, panelWidth, height);
      }
      displayPanel = false;
    }

    //If '?' or '/' is pressed, show help info
    if (key == '?' || key == '/') {
      if (frameCount > helpFrameCount + inputDelay) {
        if (helpPanel) {
          helpPanel = false;
        } else {
          helpPanel = true;
        }
      }
      helpFrameCount = frameCount;
    }

    //Save the frame to a file
    if (key == 's') {
      if (frameCount > sKeyFrameCount + inputDelay) {
        saveFrame("Drawing" + frameCount + ".png");
      }
      sKeyFrameCount = frameCount;
    }

    //Save the canvas to a file
    if (key == 'S') {
      if (frameCount > sKeyFrameCount + inputDelay) {
        PImage img = get(panelWidth, 0, width - panelWidth, height);
        img.save("Drawing" + frameCount + ".png");
      }
      sKeyFrameCount = frameCount;
    }

    //Set gradient
    if (key == 'g' || key == 'G') {
      fillGradientBG = true;
      gradientX = 15;
    }

    //Set fill
    if (key == 'f' || key == 'F') {
      fillBackground = true;
    }
    
    //If 'c' or 'C' is pressed, clear the drawing
    if (key == 'c' || key == 'C') {
      clearBackground = true;
    }
    
    //Set random
    if (key == 'r' || key == 'R') {
      if (frameCount > randomColorFrameCount + inputDelay) {
        if (randomColor) {
          randomColor = false;
        } else {
          randomColor = true;
        }
      }
      randomColorFrameCount = frameCount;
    }

    //Save the current frame
    if (key == 'x' || key == 'X') {
      loadPixels();
    }
    
    //Revert to the previous frame
    if (key == 'z' || key == 'Z') {
      updatePixels();
    }
  }
  drawAlphaBar = false;
}

//Execute whenever a mouse button is pressed
void mousePressed() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    if (drawLine) { //Draw Line
      lineFirstX = mouseX;
      lineFirstY = mouseY;
    }
  }
}
//Execute whenever a mouse button is released
void mouseReleased() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    if (drawLine) { //Draw Line
      if (randomColor) {
        stroke(random(0, 100), 100, 100, brushColorAlp);
      } else {
        stroke(brushColor);
      }
      strokeWeight(brushSize);
      line(lineFirstX, lineFirstY, mouseX, mouseY);
    }
  }
}
