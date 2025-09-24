function batterystat --wraps='upower -i /org/freedesktop/UPower/devices/battery_BAT0' --description 'alias batterystat=upower -i /org/freedesktop/UPower/devices/battery_BAT0'
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 $argv
        
end
