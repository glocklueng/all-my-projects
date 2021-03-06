
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
// Standard Input/Output functions
#include <UART.c>
#include <my_MNEA.c>

char error_code=0;

// Timer 0 overflow interrupt service routine
ISR(TIMER0_OVF_vect)
{
// Reinitialize Timer 0 value
TCNT0=0x95;
//step++;
//if (step>7) step=0;
//DDRA=step;
/*
if (step==0) DDRA=1;
if (step==1) DDRA=2;
if (step==2) DDRA=4;
*/


//DDRA=0x07;

}

// Declare your global variables here


int main(void)
{
// Declare your local variables here

// Input/Output Ports initialization
// Port A initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=Out Func1=Out Func0=Out
// State7=T State6=T State5=T State4=T State3=T State2=0 State1=0 State0=0
PORTA=0x00;
DDRA=0x07;

// Port B initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
PORTB=0x00;
DDRB=0x00;

// Port C initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
PORTC=0x00;
DDRC=0x00;

// Port D initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
PORTD=0x00;
DDRD=0x00;

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: 3,906 kHz
// Mode: Normal top=FFh
// OC0 output: Disconnected
TCCR0=0x05;
TCNT0=0x55;
OCR0=0x00;

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: Timer1 Stopped
// Mode: Normal top=FFFFh
// OC1A output: Discon.
// OC1B output: Discon.
// Noise Canceler: Off
// Input Capture on Falling Edge
// Timer1 Overflow Interrupt: Off
// Input Capture Interrupt: Off
// Compare A Match Interrupt: Off
// Compare B Match Interrupt: Off
TCCR1A=0x00;
TCCR1B=0x00;
TCNT1H=0x00;
TCNT1L=0x00;
ICR1H=0x00;
ICR1L=0x00;
OCR1AH=0x00;
OCR1AL=0x00;
OCR1BH=0x00;
OCR1BL=0x00;

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: Timer2 Stopped
// Mode: Normal top=FFh
// OC2 output: Disconnected
ASSR=0x00;
TCCR2=0x00;
TCNT2=0x00;
OCR2=0x00;

// External Interrupt(s) initialization
// INT0: Off
// INT1: Off
// INT2: Off
MCUCR=0x00;
MCUCSR=0x00;

// Timer(s)/Counter(s) Interrupt(s) initialization
TIMSK=0x01;

// Analog Comparator initialization
// Analog Comparator: Off
// Analog Comparator Input Capture by Timer/Counter 1: Off
ACSR=0x80;
SFIOR=0x00;


// Global enable interrupts

UART_init();
sei();
//UART_putchar(step);
DDRA=0;
/*
 if (UART_rx_buffer_empty ) DDRA |=(1<<DDA0);
   else DDRA &=~ (1<<DDA0);
*/

//MNP_send_message();//str);
//UART_putchar(step);

while (1)
      {

    error_code=MNP_get_message();
    //DDRA=error_code;

    if (GL_valid_flag ) DDRA |=(1<<DDA0);
   else DDRA &=~ (1<<DDA0);

        if (GP_valid_flag ) DDRA |=(1<<DDA1);
   else DDRA &=~ (1<<DDA1);

        if (GN_valid_flag ) DDRA |=(1<<DDA2);
   else DDRA &=~ (1<<DDA2);


       // step++;
  //   UART_putchar(step);
     
/*

         _delay_ms(200);

	// UART_putchar(step);





    _delay_ms(200);
if (UART_rx_buffer_overflow ) DDRA |=(1<<DDA2);
   else DDRA &=~ (1<<DDA2);
_delay_ms(200);
    if (UART_rx_buffer_full ) DDRA |=(1<<DDA1);
   else DDRA &=~ (1<<DDA1);
*/

    //step=UART_getchar();
    // step=UART_getchar();

      }
}
