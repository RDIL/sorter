int[] data;
int j, i, value;
boolean sorting;
boolean inserting;

void setup() {
  size(600, 600);
  data = new int[100];

  for (int n = 0; n < data.length; n++) {
    data[n] = (int) random(width);
  }
}

void draw() {
  background(0);
  float h = (float) height / data.length;
  float y = 0;
  color smallC = color(255, 0, 0);
  color bigC = color(0, 255, 0);

  for (int n = 0; n < data.length; n++) {
    float pct = data[n] / (float) width;
    fill(lerpColor(smallC, bigC, pct));
    rect(0, y, data[n], h);
    y += h;
  }

  if (sorting) {
    if (inserting) {
      if (value < data[i - 1]) {
        data[i] = data[i-1];
        data[i - 1] = value;
        i -= 1;

        if (i == 0) {
          inserting = false;
        }
      } else {
        inserting = false;
      }
    } else {
      j += 1;

      if (j < data.length) {
        value = data[j];
        i = j;
        inserting = true;
      } else {
        sorting = false;
        println("Done sorting.");
      }
    }
  }
}

void sort() {
  for (int j = 1; j < data.length; j++) {
    int value = data[j];
    int i = j;

    while (i > 0 && value < data[i - 1]) {
      data[i] = data[i-1];
      data[i - 1] = value;
      i -= 1;
    }
  }
}

void mousePressed() {
  data = new int[100];

  for (int n = 0; n < data.length; n++) {
    data[n] = (int) random(width);
  }

  sorting = true;
  inserting = false;
  j = 0;
}
