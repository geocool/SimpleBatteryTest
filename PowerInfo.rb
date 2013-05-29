#!/usr/bin/ruby
=begin 
class PowerInfo
This class is made so user can easily get power status and battery percentage
Requires acpi installed (sudo apt-get install acpi)
=end

class PowerInfo
  
  def initialize
    #check if acpi is installed TODO
  end
  
  # Returns Battery Percent In Integer ,On Error Returns -1
  def batteryPercent
  
  # Terminal Command String
  comStr = "acpi -b"
  # Get Output
  outObj = IO.popen(comStr)
  # Returns 2 Lines So Split It Into 2 Strings
  batteryStr = outObj.read
  
  if (batteryStr.length < 1)
    return -1
  end
  
    # Battery Percent value is after first comma and before % percent symbol
    percentIndexStr = batteryStr.index('%')-3
    percentStr = batteryStr[percentIndexStr,3]
    return percentStr.to_i
    
  end

  
  # Returns If Power Source Is Connected
  # Returns Null on Error
  def powerSource?
  
  # Terminal Command String
  comStr = "acpi -b"
  # Get Output
  outObj = IO.popen(comStr)
  # Read Out
  batteryStr = outObj.read
  
  if (batteryStr.length < 1)
    return -1
  end
  
  # Read every string. Search For "Charging" Keyword
      if (batteryStr.include?("Charging") || batteryStr.include?("Full"))
	true
      elsif (batteryStr.include?("Discharging"))
	false
      else
	return nil
      end  
  
  #comm = IO.popen("")
  end
  
end # end of class