int cupx = 300; 
int cupy = 475;
int cupw = 30;
int cuph = 50;
int ow = 10;
int oh = 30;
int[] oy = new int [31];
int[] oColor = new int[31];
int[] oWeit = new int[31];



void setup() {
    size(650, 550);
    noStroke();
    for (int i=0; i<31; i++) {
        objInit(i);
    }
}

void draw() {
    background(#4C0DFF);
    if (hitCheck() == true) {
        background(#0A0A0A);
        textSize(50);
        text("BROKEN YOUR ROCET!!", width/15, height/2);
    } else {
        objMove();
        objDisp();
        playerMove();
        playerDisp();
    }
}

void playerDisp() {
    fill(#F6FF00);
    rect(cupx, cupy, cupw, cuph, 2);
}

void playerMove() {
    cupx = mouseX;
    if ( (cupx+cupw) > width ) {
        cupx = width - cupw;
    }
}
void objDisp() {
    for (int i=0; i<31; i++) {
        if ( oColor[i] == 0 ) {
            fill(#FF00EF);
        } else {
            fill(#00FFFD);
        }
        rect(i*26+5, oy[i], ow, oh, 5);
    }
}
void objMove() {
    for (int i=0; i<31; i++) {
        if ( oWeit[i] > 0 ) {
            oWeit[i]--;
        } else {
            oy[i] += 2;
        }
        if ( oy[i] > height ) {
            objInit(i);
        }
    }
}
void objInit(int no) {
    oy[no] = 40;
    oColor[no] = int(random(2));
    oWeit[no] = int(random(60, 240));
}
boolean hitCheck() {
    int ox;
    for (int i=0; i<31; i++) {
        ox = i*26+5;
        if ( (cupx < (ox+ow)) && ((cupx+cupw) > ox)
            && (cupy < (oy[i]+oh)) && ((cupy+cuph) > oy[i]) ) {
            return true;
        }
    }
    return false;
}
