import processing.awt.PSurfaceAWT.SmoothCanvas;
import java.awt.geom.RoundRectangle2D;
import java.awt.Dimension;
import com.sun.awt.AWTUtilities;
import java.awt.Toolkit;
import javax.swing.JFrame;
import javax.swing.JRootPane;
import java.awt.image.BufferedImage;
import java.awt.Dimension;
import java.awt.Graphics;
import javax.swing.*;
import javax.swing.JApplet;
import java.awt.*;
import java.awt.event.*;
import java.awt.image.*;
import java.io.*;
import java.applet.*;
import javax.imageio.*;
import java.awt.event.MouseEvent;

color ColourSelector;
PImage colourWheel;
PImage NewSketch;
PImage OpenSketch;
PImage Dogg;
color DrawWindowBackground;
color DrawWindowControlBarBack;
color DrawWindowControlBarBorder;
color ColourWindowColourSelectorBar;
color ColourWindowColourOpacityBar;
color ColourWindowBackground;
color ColourSelected;
color ColourWindowColourSelectModeBar;
color ColourWindowControlBarBorder;
color ColourWindowColourBorders;
boolean DarkMode;
boolean NewSketchI;
boolean DrawingMode;
boolean ScreenDrawWindowStartDisplayButton;
boolean ScreenDrawWindowStartDisplay;
boolean StartScreenDrawWindow;
color StartScreenDrawWindowBack;
color StartScreenDrawWindowBorder;
boolean DrawWindowCreateNewSketchWindow;
boolean draw;
PShape MouseTool;
boolean MouseToolSelect;
boolean RectangleSelectToolSelect;
boolean BrushToolSelect;
PShape RectangleSelectTool;
PShape BrushTool;
color MouseToolSelectColour;
color RectangleSelectToolColour;
color BrushToolColour;
boolean OverCloseButtonDrawWindow;
boolean ScreenDrawWindowStartDisplayButtonOver;
JFrame DrawWindowFrame;

void setup() {
  frameRate(240);
  colourWheel = loadImage("ColourWheel.png");
  Dogg = loadImage("Dog.jpg");
  NewSketch = loadImage("New.png");
  OpenSketch = loadImage("Open.png");
  StartScreenDrawWindow = true;
  String[] args = {"TwoFrameTest"};
  SecondApplet sa = new SecondApplet();
  PApplet.runSketch(args, sa);
  ColourSelected = color(255);
  ColourSelector = 0;
  DrawWindowFrame = getJFrame(getSurface());
  DrawWindowFrame.removeNotify();
  DrawWindowFrame.setUndecorated(true);
  DrawWindowFrame.setShape(new RoundRectangle2D.Double(0, 0, displayWidth, displayHeight-(displayHeight/9), 5, 5));
  DrawWindowFrame.setSize(displayWidth, displayHeight-(displayHeight/9));
  surface.setSize(displayWidth, displayHeight-(displayHeight/9));
  DrawWindowFrame.addNotify();
  DrawWindowBackground = color(180);
  DrawWindowControlBarBack = color(240);
  DrawWindowControlBarBorder = color(190);
  DrawWindowFrame.setLocation(0, 25);
  StartScreenDrawWindowBack = color(200);
  StartScreenDrawWindowBorder = color(100);
  DrawingMode = false;
  ScreenDrawWindowStartDisplay = true;
  ScreenDrawWindowStartDisplayButton = true;
  NewSketchI = true;
  MouseTool = loadShape("MouseIcon(Tool).svg");
  RectangleSelectTool = loadShape("Tool_RectangleSelection.svg");
  BrushTool = loadShape("Tool_Brush.svg");

  DarkMode = true;

  if (DarkMode) {
    DrawWindowBackground = color(40);
    DrawWindowControlBarBack = color(80);
    DrawWindowControlBarBorder = color(40);
    ColourWindowColourSelectorBar = color(20);
    ColourWindowColourOpacityBar = color(60);
    ColourWindowBackground = color(80);
    ColourWindowColourSelectModeBar = color(20);
    ColourWindowControlBarBorder = color(40);
    ColourWindowColourBorders = color(120);
    StartScreenDrawWindowBack = color(80);
    StartScreenDrawWindowBorder = color(100);
    MouseToolSelectColour = color(60);
    RectangleSelectToolColour = color(60);
    BrushToolColour = color(60);
  } else {
    DrawWindowBackground = color(180);
    DrawWindowControlBarBack = color(240);
    DrawWindowControlBarBorder = color(190);
    ColourWindowColourSelectorBar = color(250);
    ColourWindowColourOpacityBar = color(230);
    ColourWindowBackground = color(220);
    ColourWindowColourSelectModeBar = color(250);
    ColourWindowControlBarBorder = color(190);
    ColourWindowColourBorders = color(230);
    StartScreenDrawWindowBack = color(200);
    StartScreenDrawWindowBorder = color(100);
  }
}

void draw() {

  background(DrawWindowBackground);

  if (NewSketchI) {
    //UI Bar Division
    fill(40);
    noStroke();
    rect(0, 20, width, height);
    fill(60);
    rect(0, 20, width, 50);
    rect(0, 70, width, 30);
    rect(0, 100, 72.5, height-100);
    stroke(0);
    strokeWeight(1);
    line(0, 70, width, 70);

    if (mouseX >= 7.5 && mouseY >= 120 &&
      mouseX <= 32.5 && mouseX <= 145 && mousePressed) {
      MouseToolSelect = true;
      BrushToolSelect = false;
    }

    if (MouseToolSelect) {
      if (DarkMode) {
        BrushToolColour = color(60);
        RectangleSelectToolColour = color(60);
        MouseToolSelectColour = color(0);
      }
    }

    if (key == 'b') {
      BrushToolSelect = true;
      MouseToolSelect = false;
      key = '' ;
    }

    if (key == 'B') {
      BrushToolSelect = true;
      MouseToolSelect = false;
      key = '' ;
    }

    if (mouseX >= 7.5 && mouseY >= 152.5 &&
      mouseX <= 32.5 && mouseX <= 177.5 && mousePressed) {
      BrushToolSelect = true;
      MouseToolSelect = false;
    }

    fill(255);
    rect(200, 180, width - (width/6)-(width/24), height - (height/4)-(height/24));
    noFill();

    if (DarkMode) {
      if (BrushToolSelect) {
        BrushToolColour = color(0);
      }
    }

    if (BrushToolSelect) {
      if (DarkMode) {
        MouseToolSelectColour = color(60);
        RectangleSelectToolColour = color(60);
      }
      if (mouseX >= 72.5 && mouseY >= 100) {
        stroke(0);
        noFill();
        ellipse(mouseX, mouseY, 50, 50);
        noCursor();
      } else {
        cursor();
      }
    }

    stroke(MouseToolSelectColour);
    rect(5, 120, 30, 30, 5);
    shape(MouseTool, 5, 120, 30, 30);
    stroke(RectangleSelectToolColour);
    rect(37.5, 120, 30, 30, 5);
    shape(RectangleSelectTool, 37.5, 120, 30, 30);
    stroke(BrushToolColour);
    rect(5, 152.5, 30, 30, 5);
    shape(BrushTool, -5, 142, 50, 50);
    stroke(60);
    rect(37.5, 152.5, 30, 30, 5);
    rect(5, 185, 30, 30, 5);
    rect(37.5, 185, 30, 30, 5);
    rect(5, 217.5, 30, 30, 5);
    rect(37.5, 217.5, 30, 30, 5);
    rect(5, 250, 30, 30, 5);
    rect(37.5, 250, 30, 30, 5);
  }

  fill(DrawWindowControlBarBack);
  stroke(DrawWindowControlBarBorder);
  rect(-10, -10, displayWidth+10, 30);
  stroke(200);
  strokeWeight(0.5);
  fill(255, 100, 30);
  stroke(220, 0, 0);
  ellipse(15, 10, 11, 11);
  stroke(200);
  fill(230);
  ellipse(35, 10, 11, 11);
  fill(230);
  ellipse(55, 10, 11, 11);

  if (dist(mouseX, mouseY, 15, 10) < (11)) {
    OverCloseButtonDrawWindow = true;
  }

  if (ScreenDrawWindowStartDisplay) {
    if (StartScreenDrawWindow) {
      stroke(StartScreenDrawWindowBorder);
      fill(StartScreenDrawWindowBack);
      rect(width/6, height/6, width/1.5, height/1.5, 10);
      fill(150);
      rect((width/6)+(width/64), (height/6)+(height/1.56), width/128, width/128);

      if (ScreenDrawWindowStartDisplayButton) {
        stroke(255);
        strokeWeight(2);
        line((width/6)+(width/64), (height/6)+(height/1.56)+(height/256), (width/6)+(width/64)+(width/256), (height/6)+(height/1.56)+(width/256)+(width/512));
        line((width/6)+(width/64)+(width/256), (height/6)+(height/1.56)+(width/256)+(width/512), (width/6)+(width/64)+(width/256)+(width/512)+(width/512)+(width/512), (height/6)+(height/1.56)-(height/512)-(height/512)-(height/512));
      }
      stroke(StartScreenDrawWindowBorder);
      textSize(11);
      text("Display This Screen Ever Time You Open This Application", (width/6)+(width/38), (height/6)+(height/1.532));
      fill(60);
      noStroke();
      rect((width/6), (height/6)+(height/24), (width/2.2), (height/1.7));
      noFill();
      stroke(200);
      strokeWeight(2);
      rect((width/6)+(width/2.2)+(width/64), (height/6)+(height/24), (width/5.5), (height/1.7)/2);
      stroke(200);
      strokeWeight(2);
      rect((width/6)+(width/2.2)+(width/64), (height/6)+(height/24)+((height/1.7)/2), (width/5.5), ((height/1.7)/2));

      if (mouseX >= (width/6)+(width/64) && mouseY >= (height/6)+(height/1.56) &&
        mouseX <= (width/6)+(width/64)+(width/128) && mouseY <= (height/6)+(height/1.56)+(width/128)) {
        ScreenDrawWindowStartDisplayButtonOver = true;
      }

      if (mouseX <= ((width/6)+(width/2.2)+(width/64)+(width/5.5)) && mouseX >= ((width/6)+(width/2.2)+(width/64)) &&
        mouseY >= ((height/6)+(height/24)) && mouseY <= ((height/6)+(height/24)+((height/1.7)/2)) && mousePressed) {
        StartScreenDrawWindow = false;
        DrawWindowCreateNewSketchWindow = true;
      }

      image(Dogg, (width/6)+(width/100), (height/6)+(height/24)+(height/64), (width/2.3), (height/1.8));
      image(NewSketch, (width/6)+(width/2.2)+(width/64)+(width/32), (height/6)+(height/128), (width/8), (height/2.7586));
      image(OpenSketch, (width/6)+(width/2.2)+(width/64)+(width/32), (height/6)+(height/128)+((height/1.7)/2), (width/8), (height/2.7586));

      fill(255);
      PFont DrawWindowStartScreenSketch = createFont("Avenir-Book", 16);
      textFont(DrawWindowStartScreenSketch);
      text("New Sketch", (width/6)+(width/2.2)+(width/64)+(width/16), (height/6)+(height/4));
      text("Open Sketch", (width/6)+(width/2.2)+(width/64)+(width/16), (height/6)+(height/5)+((height/1.7)/2));
    }
  }

  if (DrawWindowCreateNewSketchWindow) {
    fill(60);
    noStroke();
    rect(width/3, height/5, width/3, height/1.8, 10);
  }
  if (key == 'k') {
    DrawWindowCreateNewSketchWindow = false;
  }
}

void mouseReleased() {
  if (OverCloseButtonDrawWindow) {
    exit();
  }

  if (ScreenDrawWindowStartDisplayButtonOver) {
    if (ScreenDrawWindowStartDisplayButton) {
      ScreenDrawWindowStartDisplayButton = false;
    } else if (!ScreenDrawWindowStartDisplayButton) {
      ScreenDrawWindowStartDisplayButton = true;
    }
  }
}

static final JFrame getJFrame(final PSurface surf) {
  return (JFrame) ((SmoothCanvas) surf.getNative()).getFrame();
}

public class SecondApplet extends PApplet {
  JFrame tFrame;
  int FrameWidth;
  int FrameHeight;
  boolean OverColourControlBar;
  color CloseButtonclr;
  float ScrollCircleX;
  float ScrollCircleY;
  boolean OverScrollEllipse;
  boolean ClickedScrollEllipse;
  float xOffsetColourSelectBox = 0.0;
  float yOffsetColourSelectBox = 0.0;
  float ColourSelectBoxX;
  float ColourSelectBoxY;
  boolean OverColourSelectBox;
  boolean ClickedColourSelectBox;
  float xOffsetColourSelectBoxColourSelectBox = 0.0;
  float yOffsetColourSelectBoxColourSelectBox = 0.0;
  float OpacityPercentageNumber;
  String OpacityPercentage;
  float WindowControlBarColourHoverandFocused;
  boolean OverColourWheel;
  color CloseButtonclrStrk;
  Boolean OverCloseButton;

  void setup() {
    tFrame = getJFrame(getSurface());
    WindowControlBarColourHoverandFocused = 250;
    FrameWidth = 280;
    FrameHeight = 360;
    ScrollCircleX = 260;
    ScrollCircleY = 275;
    ColourSelectBoxX = 133;
    ColourSelectBoxY = 155;
    ColourWindowColourSelectorBar = color(250);
    ColourWindowColourOpacityBar = color(230);
    ColourWindowBackground = color(220);
    ColourWindowColourSelectModeBar = color(250);
    ColourWindowColourBorders = color(230);
    CloseButtonclr = color(255, 0, 0);
    CloseButtonclrStrk = color(200);
    tFrame = getJFrame(getSurface());
    tFrame.removeNotify();
    tFrame.setUndecorated(true);
    tFrame.setShape(new RoundRectangle2D.Double(0, 0, FrameWidth, FrameHeight, 5, 5));
    surface.setSize(FrameWidth, FrameHeight);
    tFrame.addNotify();
    tFrame.setLocation(int((displayWidth/1.242)), (displayHeight/2)-180);
    tFrame.setVisible(true);
  }

  public void draw() {
    background(ColourWindowBackground);
    noStroke();

    if (mouseX >= 0 && mouseY <= 20) {
      OverColourControlBar = true;
    } else {
      OverColourControlBar = true;
    }

    if (OverColourControlBar) {
      CloseButtonclr = color(255, 100, 30);
      CloseButtonclrStrk = color(220, 0, 0);
    } else if (!OverColourControlBar) {
      CloseButtonclr = color(230);
      CloseButtonclrStrk = color(200);
    }

    //UI Bar Division
    strokeWeight(1);
    fill(ColourWindowColourOpacityBar);
    rect(0, 260, 280, 100);
    fill(ColourWindowColourSelectorBar);
    rect(0, 305, 280, 55);
    fill(ColourWindowColourSelectModeBar);
    rect(0, 0, 280, 60);
    fill(WindowControlBarColourHoverandFocused);
    stroke(ColourWindowControlBarBorder);
    rect(-10, -10, 290, 30);

    //Window Control Bar Buttons
    stroke(200);
    strokeWeight(0.5);
    fill(CloseButtonclr);
    stroke(CloseButtonclrStrk);
    ellipse(15, 10, 11, 11);
    stroke(200);
    fill(230);
    ellipse(35, 10, 11, 11);
    fill(230);
    ellipse(55, 10, 11, 11);

    //Window Control Bar Function
    if (dist(mouseX, mouseY, 15, 10) < (6) && mousePressed) {
      OverCloseButton = true;
    }

    //Colour Selector && Section Division Lines
    fill(ColourSelected);
    stroke(ColourWindowColourBorders);
    rect(10, 314, 35, 35, 5);
    strokeWeight(1);
    line(52, 315, 52, 349);
    line(92, 315, 92, 349);

    //Colours Selected History Panel
    noFill();
    rect(97, 315, 15, 15, 5);
    rect(97, 334, 15, 15, 5);
    rect(115, 315, 15, 15, 5);
    rect(115, 334, 15, 15, 5);
    rect(97, 334, 15, 15, 5);
    rect(133, 315, 15, 15, 5);
    rect(133, 334, 15, 15, 5);
    rect(151, 315, 15, 15, 5);
    rect(151, 334, 15, 15, 5);
    rect(169, 315, 15, 15, 5);
    rect(169, 334, 15, 15, 5);
    rect(187, 315, 15, 15, 5);
    rect(187, 334, 15, 15, 5);
    rect(205, 315, 15, 15, 5);
    rect(205, 334, 15, 15, 5);
    rect(223, 315, 15, 15, 5);
    rect(223, 334, 15, 15, 5);
    rect(241, 315, 15, 15, 5);
    rect(259, 315, 15, 15, 5);

    //Window Control Bar Hover Function
    fill(210);
    if (mouseY >= 0) {
      fill(130);
      WindowControlBarColourHoverandFocused = 240;
      if (DarkMode) {
        WindowControlBarColourHoverandFocused = 60;
      }
    } else {
      WindowControlBarColourHoverandFocused = 250;
      if (DarkMode) {
        WindowControlBarColourHoverandFocused = 65;
      }
    }

    //Window Tittle and Text
    text("Colours", 120, 15);
    fill(180);
    PFont ClrFont = createFont("SansSerif", 10);
    textFont(ClrFont);
    text("Clear", 248, 347);
    line(248, 348, 272, 348);
    text("Opacity :", 195, 298);

    //Opacity Text Box
    fill(220);
    rect(242, 289, 32, 11, 2);

    //Opacity Slider
    stroke(160);
    strokeWeight(4);
    line(15, 275, 270, 275);

    //Colour Wheel
    stroke(ColourWindowColourBorders);
    strokeWeight(1);
    image(colourWheel, 37, 60, 200, 200);
    noFill();
    ellipse(138, 160, 180, 180);

    if (dist(mouseX, mouseY, 138, 160) < (90)) {
      OverColourWheel = true;
    } else {
      OverColourWheel = false;
    }

    if (dist(mouseX, mouseY, ScrollCircleX, ScrollCircleY) < (11)) {
      OverScrollEllipse = true;  
      if (!ClickedScrollEllipse) { 
        stroke(100);
      }
    } else {
      stroke(153);
      OverScrollEllipse = false;
    }

    if (ScrollCircleX < 30) {
      ScrollCircleX = 30;
    }
    if (ScrollCircleX > 260) {
      ScrollCircleX = 260;
    }

    ellipse(ScrollCircleX, ScrollCircleY, 12, 12);

    OpacityPercentageNumber = (ScrollCircleX-30)/2.3;
    OpacityPercentage = "" + int(OpacityPercentageNumber) + " %";
    fill(130);
    textSize(10);
    text(OpacityPercentage, 244, 299);

    //ellipse(100,100,180,180);
    /*text("R",10,135);
     rect(23,125,36,12);
     text("G",75,135);
     rect(88,125,36,12);
     text("B",140,135);
     rect(153,125,36,12);
     fill(ColourSelector);
     rect(10,10,180,100);*/

    stroke(180);
    strokeWeight(1);
    line(68, 342, 64, 345);
    line(64, 345, 64, 342);
    line(64, 342, 75, 325);
    line(68, 342, 79, 325);
    strokeWeight(5);
    line(71, 325, 79, 330);
    line(79, 322, 77, 325);

    if (mouseX > ColourSelectBoxX-10 && mouseX < ColourSelectBoxX+10 && 
      mouseY > ColourSelectBoxY-10 && mouseY < ColourSelectBoxY+10) {
      OverColourSelectBox = true;  
      if (!ClickedColourSelectBox) {
      }
    } else {
      OverColourSelectBox = false;
    }

    if (ClickedColourSelectBox) {
      if (dist(ColourSelectBoxX+5, ColourSelectBoxY+5, 138, 160) > (90)) {
        ColourSelectBoxX = 133;
        ColourSelectBoxY = 155;
        mouseReleased();
      }
    }

    //Colour Wheel Selector Dragable Button
    noFill();
    strokeWeight(1);
    stroke(120);
    line(ColourSelectBoxX-5, ColourSelectBoxY+5, ColourSelectBoxX+3, ColourSelectBoxY+5);
    line(ColourSelectBoxX+5, ColourSelectBoxY-5, ColourSelectBoxX+5, ColourSelectBoxY+3);
    line(ColourSelectBoxX+15, ColourSelectBoxY+5, ColourSelectBoxX+7, ColourSelectBoxY+5);
    line(ColourSelectBoxX+5, ColourSelectBoxY+15, ColourSelectBoxX+5, ColourSelectBoxY+7);
    rect(ColourSelectBoxX, ColourSelectBoxY, 10, 10);
    fill(220);
  }

  void mousePressed() {
    //if (OverCloseButton) {
    //  CloseButtonclr = color(190, 60, 0);
    //}

    if (OverScrollEllipse) { 
      ClickedScrollEllipse = true; 
      fill(255, 255, 255);
    } else {
      ClickedScrollEllipse = false;
    }
    xOffsetColourSelectBox = mouseX-ScrollCircleX;

    if (OverColourSelectBox) { 
      ClickedColourSelectBox = true; 
      fill(255, 255, 255);
    } else {
      ClickedColourSelectBox = false;
    }
    xOffsetColourSelectBox = mouseX-ColourSelectBoxX; 
    yOffsetColourSelectBox = mouseY-ColourSelectBoxY;
  }

  void mouseDragged() {
    if (ClickedScrollEllipse) {
      ScrollCircleX = mouseX-xOffsetColourSelectBox;
    }
    if (ClickedColourSelectBox) {
      ColourSelectBoxX = mouseX-xOffsetColourSelectBox; 
      ColourSelectBoxY = mouseY-yOffsetColourSelectBox;
    }
  }

  void mouseReleased() {
    //if (OverCloseButton) {
    //  tFrame.setVisible(false);
    //}

    ClickedScrollEllipse = false;
    ClickedColourSelectBox = false;
    ColourSelected = get(int(ColourSelectBoxX+5), int(ColourSelectBoxY+5));
  }
}

public class ThridApplet extends JApplet {
}
