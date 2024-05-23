


   % Controlling two encoders at a time Using arduino Mega2560

    
   %% give the board name and usb port name, and interrupt pins
   clc;
   clear;
   a = arduino('COM7','Mega2560','Libraries','rotaryEncoder');
   true=1;
   encoder1 = rotaryEncoder(a,'D2','D3');
   encoder2 = rotaryEncoder(a,'D18','D19');
   while(true)
  %% give direction in D4 and PWM in D5     
           writeDigitalPin(a,'D4',0);
           writePWMDutyCycle(a,'D5',0.1);
 %% Get encoder count value and convert it into angle (degrees)
           [count,time] = readCount(encoder1)
           encodervalue=count;

           % 7392 encoder count value per one revolution
           degree=(360/7392)*encodervalue

           %% give direction in D6 and PWM in D7 

           writeDigitalPin(a,'D6',1);
           writePWMDutyCycle(a,'D7',0.1);
          
           [count2,time2] = readCount(encoder2)
           encodervalue2=count2;
           degree2=(360/7392)*encodervalue2
%%  Condition to stop the motors
           if(degree2>=90 && degree>=90)
               true=0;
               writePWMDutyCycle(a,'D5',0);
               writePWMDutyCycle(a,'D7',0);

           end
   end
   



  