const bathroom = 'assets/rooms/Icon_Bathroom.svg';
const bedroom = 'assets/rooms/Icon_Bedroom.svg';
const kitchen = 'assets/rooms/Icon_Kitchen.svg';
const livingroom = 'assets/rooms/Icon_Livingroom.svg';
const toilet = 'assets/rooms/Icon_Toilet.svg';

String setRoomUrl(int index) {
  //get roomimage number/name from Database with index
  var url;
  switch (index) {
    case 0:
      url = bathroom;
      break;
    case 1:
      url = bedroom;
      break;
    case 2:
      url = kitchen;
      break;
    case 3:
      url = livingroom;
      break;
    case 4:
      url = toilet;
      break;
  }
  return url;
}

const lamp = 'assets/icons/Icon_LampE27.svg';
const stripRGB = 'assets/icons/Icon_LED_Stripe.svg';
const stripNeopixel = 'assets/icons/Icon_LED_Stripe.svg';
const powersocket = 'assets/icons/Icon_Powersocket.svg';
const switchSchalter = 'assets/icons/Icon_Button.svg';
const wifiSpeaker = 'assets/icons/Icon_WiFi_Speaker.svg';
const voiceControl = 'assets/icons/Icon_Voice_Assistent.svg';
const sensorMovement = 'assets/icons/Icon_MotionSensor.svg';
const sensorTemperature = 'assets/icons/Icon_Temerature.svg';
const plant = 'assets/icons/Icon_Plant.svg';
const floorLamp = 'assets/icons/Icon_FloorLamp.svg';

String setSensorUrl(int index) {
  //get sensorimage number/name from Database with index
  var url;
  switch (index) {
    case 0:
      url = lamp;
      break;
    case 1:
      url = stripRGB;
      break;
    case 2:
      url = stripNeopixel;
      break;
    case 3:
      url = powersocket;
      break;
    case 4:
      url = switchSchalter;
      break;
    case 5:
      url = wifiSpeaker;
      break;
    case 6:
      url = voiceControl;
      break;
    case 7:
      url = sensorMovement;
      break;
    case 8:
      url = sensorTemperature;
      break;
    case 9:
      url = plant;
      break;
    case 10:
      url = floorLamp;
      break;
  }
  return url;
}
