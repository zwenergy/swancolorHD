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

// Read the controller.
void readController() {
  // Set the latch to high for 12 us.
  digitalWrite( SNESLATCH, 1 );
  delayMicroseconds( 12 );
  digitalWrite( SNESLATCH, 0 );
  delayMicroseconds( 6 );

  // Init A and B.
  conB = 0;
  conA = 0;

  // Shift in the controller data.
  // Logic 0 means pressed.
  for ( uint8_t i = 0; i < 16; ++i ) {
    digitalWrite( SNESCLK, 0 );
    delayMicroseconds( 6 );
    // We only care about the first 12 bits.
    if ( i < 12 ) {
      uint8_t curDat = !digitalRead( SNESSERIAL );
      switch ( i ) {
        case 0:
          conB |= curDat;
          break;
        case 1:
          conB |= curDat;
          break;
        case 2:
          // Select, do nothing.
          break;
        case 3:
          conStart = curDat;
          break;
        case 4:
          // Up
          conX1 = curDat;
          break;
        case 5:
          // Down
          conX3 = curDat;
          break;
        case 6:
          // Left
          conX4 = curDat;
          break;
        case 7:
          // Right
          conX2 = curDat;
          break;
        case 8:
          conA |= curDat;
          break;
        case 9:
          conA |= curDat;
          break;
        case 10:
          // L, do nothing.
          break;
        case 11:
          // R, do nothing
          break;
        default:
          break;
        
      }
    }
    digitalWrite( SNESCLK, 1 );
    delayMicroseconds( 6 );
  }
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

  delay( POLLINT );

}
