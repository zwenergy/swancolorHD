// Pin definitions.
// WS outputs.
// These definitions are just for reference. If other pins should be used,
// the updateWonderSignals function needs to be adjusted.
#define X1 2
#define X2 3
#define X3 4
#define X4 5
#define Y1 6
#define Y2 7
#define Y3 8
#define Y4 9
#define BUTA 10 
#define BUTB 11
#define BUTSTART 12

// SNES controller.
#define SNESLATCH A0
#define SNESCLK A1
#define SNESSERIAL A2

#define ARDCON A3

// Polling interval in ms.
#define POLLINT 2

// Some NOP definitions.
// Yes, this is very pretty. But we do not have code size problems,
// hence using stupid sequences of NOPs makes it nicely timing 
// predictable.
#define NOP1 asm volatile( "nop\n" )
#define NOP5 NOP1; NOP1; NOP1; NOP1; NOP1
#define NOP10 NOP5; NOP5
#define NOP20 NOP10; NOP10
#define NOP40 NOP20; NOP20
#define NOP80 NOP40; NOP40

#define WAIT2US NOP20; NOP10; NOP1
#define WAIT8US NOP80; NOP40; NOP5; NOP1; NOP1; NOP1

// The latest controller state.
uint8_t conA;
uint8_t conB;
uint8_t conX1;
uint8_t conX2;
uint8_t conX3;
uint8_t conX4;
uint8_t conY1;
uint8_t conY2;
uint8_t conY3;
uint8_t conY4;
uint8_t conStart;

// Rotate mode?
uint8_t rotate = 0;
uint8_t selectPrev = 0;
uint8_t powerPrev = 0;

// Internal rotate mode?
// (only rotate the controls, not the video)
uint8_t rotateInt = 0;
uint8_t intRotateComboPrev = 0;

// Video only rotation?
// (only used with the swantroller).
uint8_t rotateVideoOnly = 0;

// Alternative input mode?
// X buttons => ABXY
// Y buttons => DPAD
// A/B => L/R
uint8_t altInput = 0;
uint8_t altInputComboPrev = 0;

// Read the controller.
void readController() {
  // Set the latch to high for 12 us.
  digitalWrite( SNESLATCH, 1 );
  delayMicroseconds( 12 );
  digitalWrite( SNESLATCH, 0 );
  delayMicroseconds( 6 );

  // Hold SNES buttons temporarily.
  uint8_t snesUP = 0;
  uint8_t snesDOWN = 0;
  uint8_t snesLEFT = 0;
  uint8_t snesRIGHT = 0;
  uint8_t snesSTART = 0;
  uint8_t snesSELECT = 0;
  uint8_t snesX = 0;
  uint8_t snesY = 0;
  uint8_t snesA = 0;
  uint8_t snesB = 0;
  uint8_t snesL = 0;
  uint8_t snesR = 0;

  // For swantroller.
  uint8_t snesDat12 = 0;
  uint8_t snesDat13 = 0;
  uint8_t snesDat14 = 0;

  conX1 = 0;
  conX2 = 0;
  conX3 = 0;
  conX4 = 0;
  conY1 = 0;
  conY2 = 0;
  conY3 = 0;
  conY4 = 0;
  conA = 0;
  conB = 0;
  conStart = 0;

  // Shift in the controller data.
  // Logic 0 means pressed.
  for ( uint8_t i = 0; i < 16; ++i ) {
    digitalWrite( SNESCLK, 0 );
    delayMicroseconds( 6 );
    // We only care about the first 15 bits.
    if ( i < 15 ) {
      uint8_t curDat = !digitalRead( SNESSERIAL );
      switch ( i ) {
        case 0:
          snesB = curDat;
          break;
        case 1:
          snesY = curDat;
          break;
        case 2:
          snesSELECT = curDat;
          break;
        case 3:
          snesSTART = curDat;
          break;
        case 4:
          // Up
          snesUP = curDat;
          break;
        case 5:
          // Down
          snesDOWN = curDat;
          break;
        case 6:
          // Left
          snesLEFT = curDat;
          break;
        case 7:
          // Right
          snesRIGHT = curDat;
          break;
        case 8:
          snesA = curDat;
          break;
        case 9:
          snesX = curDat;
          break;
        case 10:
          snesL = curDat;
          break;
        case 11:
          snesR = curDat;
          break;
        case 12:
          snesDat12 = curDat;
          break;
        case 13:
          snesDat13 = curDat;
          break;
        case 14:
          snesDat14 = curDat;
          break;
        default:
          break;
        
      }
    }
    digitalWrite( SNESCLK, 1 );
    delayMicroseconds( 6 );
  }

  uint8_t intRotateCombo = snesL && snesR && snesSTART && snesUP;
  uint8_t altInputCombo = snesL && snesR && snesSTART && snesDOWN;

  // At very first, decide whether we have a regular controller
  // or a swantroller. This is done by checking if UP and DOWN are "pressed".
  if ( snesUP && snesDOWN ) {
    // We have swantroller (... or a broken SNES controller).
    conX1 = snesB;
    conX2 = snesY;
    conX3 = snesSELECT;
    conX4 = snesSTART;
    conY1 = snesLEFT;
    conY2 = snesRIGHT;
    conY3 = snesA;
    conY4 = snesX;
    conA = snesL;
    conB = snesR;
    conStart = snesDat12;

    // The POWER button is transmitted as the 14th bit, the SOUND via 13th bit.
    // We currently use the POWER button for video rotation only.
    if ( !powerPrev && snesDat14 ) {
      rotateVideoOnly = !rotateVideoOnly;
    }
    
    
  } else {
    // Regular SNES controller.
    // Do the mapping.
    conStart = snesSTART;
  
    // Pressing SELECT toggles rotate.
    if ( !selectPrev && snesSELECT ) {
      rotate = !rotate;
    }
  
    // Internal rotate?
    if ( !intRotateComboPrev && intRotateCombo ) {
      rotateInt = !rotateInt;
    } else if ( !altInputComboPrev && altInputCombo ) {
      altInput = !altInput;
    }
  
    // Rotated screen?
    if ( rotate || rotateInt ) {
      conY2 = snesUP;
      conY3 = snesRIGHT;
      conY4 = snesDOWN;
      conY1 = snesLEFT;
  
      conX2 = snesX;
      conX3 = snesA;
      conX4 = snesB;
      conX1 = snesY;
      
    } else {
      // Not rotated screen.
      
      //  Regular input mode.
      if ( !altInput ) {
        // In case L is pressed, we map the WS Y buttons to the DPAD.
        if ( snesL ) {
          conY1 = snesUP;
          conY2 = snesRIGHT;
          conY3 = snesDOWN;
          conY4 = snesLEFT;
        } else {
          conX1 = snesUP;
          conX2 = snesRIGHT;
          conX3 = snesDOWN;
          conX4 = snesLEFT;
        }
      
        // In case R is pressed, we map the WS Y buttons to the A/B/X/Y.
        if ( snesR ) {
          conY1 = snesX;
          conY2 = snesA;
          conY3 = snesB;
          conY4 = snesY;
        } else {
          conB = snesB |snesY;
          conA = snesA |snesX;
        }

      } else {
        // Alternative input mode. Useful for, e.g., Rhyme Rider Kerorican.
        conY1 = snesUP;
        conY2 = snesRIGHT;
        conY3 = snesDOWN;
        conY4 = snesLEFT;

        conX1 = snesX;
        conX2 = snesA;
        conX3 = snesB;
        conX4 = snesY;

        conB = snesL;
        conA = snesR;

      }
    }
  }



  selectPrev = snesSELECT;
  intRotateComboPrev = intRotateCombo;
  powerPrev = snesDat14;
  altInputComboPrev = altInputCombo;
}


// Drive WS controller signals.
void updateWonderSignals() {
  // Get D0 and D1 values.
  uint8_t d1d0 = PORTD;
  d1d0 = d1d0 & 0b00000011;
  uint8_t dat = d1d0 | ( conX1 << 2 ) | ( conX2 << 3 ) | ( conX3 << 4 ) |
    ( conX4 << 5 ) | ( conY1 << 6 ) | ( conY2 << 7 );
  // Write them.
  PORTD = dat;

  // The next ones.
  dat = ( conY3 ) | ( conY4 << 1 ) | ( conA << 2 ) | ( conB << 3 ) | 
    ( conStart << 4 );
  PORTB = dat; 

}

void doComm() {
  if ( rotate || rotateVideoOnly ) {
    // Actuall drive GND.
    pinMode( ARDCON, OUTPUT );
  } else {
    // High Z.
    pinMode( ARDCON, INPUT );
  }
}

void setup() {
  // DEBUG.
  Serial.begin(9600);
  Serial.println( "Startup" );
  
  // Set up pin modes.
  // First set all output registers of WS buttons to 0.
  pinMode( X1, OUTPUT );
  digitalWrite( X1, 0 );
  pinMode( X2, OUTPUT );
  digitalWrite( X2, 0 );
  pinMode( X3, OUTPUT );
  digitalWrite( X3, 0 );
  pinMode( X4, OUTPUT );
  digitalWrite( X4, 0 );

  pinMode( Y1, OUTPUT );
  digitalWrite( Y1, 0 );
  pinMode( Y2, OUTPUT );
  digitalWrite( Y2, 0 );
  pinMode( Y3, OUTPUT );
  digitalWrite( Y3, 0 );
  pinMode( Y4, OUTPUT );
  digitalWrite( Y4, 0 );
  
  pinMode( BUTA, OUTPUT );
  digitalWrite( BUTA, 0 );
  pinMode( BUTB, OUTPUT );
  digitalWrite( BUTB, 0 );
  
  pinMode( BUTSTART, OUTPUT );
  digitalWrite( BUTSTART, 0 );

  pinMode( ARDCON, OUTPUT );
  digitalWrite( ARDCON, 0 );
  pinMode( ARDCON, INPUT );

  // And the SNES controller pins.
  pinMode( SNESLATCH, OUTPUT );
  digitalWrite( SNESLATCH, 0 );
  pinMode( SNESCLK, OUTPUT );
  digitalWrite( SNESCLK, 1 );
  pinMode( SNESSERIAL, INPUT_PULLUP );

}

void loop() {
  readController();

  updateWonderSignals();

  doComm();

  delay( POLLINT );

}
