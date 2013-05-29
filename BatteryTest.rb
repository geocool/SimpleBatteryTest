#!/usr/bin/ruby
=begin 
..:: BatteryTest ::..

A Simple Script For Testing How Much Time A Notebook Can Stay On.

9 Stages
Stage 1: 100 - 90%
Stage 2:  90 - 80%
Stage 3:  80 - 70%
Stage 4:  70 - 60%
Stage 5:  60 - 50%
Stage 6:  50 - 40%
Stage 7:  40 - 30%
Stage 8:  30 - 20%
Stage 9:  20 - 10%

=end

require_relative 'PowerInfo'

######################  Print Into  ################################
def printIntro
  puts "     ..:: Battery Test ::.."
  puts "A Ruby Script Made By George Sofianos"
  puts ""
end

###################### Print Results ################################
def printResults(stagesRes,stage)
  system("reset")
  #print Intro
  printIntro
  puts "-------------------------------"
  #Overal Seconds Of All Stages
  allSeconds = 0

# Print Every Stage
stagesRes.each {
  |stageNum,stageSeconds| 
 
  allSeconds += stageSeconds
  
  # Count Hours,Minutes,Seconds
  hours = ((stageSeconds / 60)/60).to_i
  minutes = ((stageSeconds - (60*60*hours)) /60).to_i
  seconds = (stageSeconds - (60*60*hours) - (60*minutes)).to_i
  
  puts "Stage #{stageNum} (#{(100 - stageNum*10) +10}% - #{100 - stageNum*10}%):"
  puts "#{hours} Hours, #{minutes} Minutes, #{seconds} seconds"
  puts ""
  puts "-------------------------------"
}
  #---------------------------------------------------------------
  #Print Overal Time Until The End Of The Test
  # Calculate Hours,Minutes,Seconds
  hours = ((allSeconds / 60) /60).to_i
  minutes = ((allSeconds - (60*60*hours)) /60).to_i
  seconds = (allSeconds - (60*60*hours) - (60*minutes)).to_i

  puts "Overal (100% - #{100 - stage.to_i*10}%):"
  puts "#{hours} Hours, #{minutes} Minutes, #{seconds} seconds"
  puts ""
  puts "-------------------------------"
  #---------------------------------------------------------------
  #Print Average Time Per Stage
  averalSeconds = allSeconds / stage.to_i
  # Calculate Hours,Minutes,Seconds
  hours = ((averalSeconds / 60) /60).to_i
  minutes = ((averalSeconds - (60*60*hours)) /60).to_i
  seconds = (averalSeconds - (60*60*hours) - (60*minutes)).to_i
  puts "Average Time Per Stage(10%)"
  puts "#{hours} Hours, #{minutes} Minutes, #{seconds} seconds"
  puts ""
  puts "-------------------------------"
  #---------------------------------------------------------------
  #Print Possible Power On Time
  possibleSeconds = (allSeconds / stage.to_i)*10
  # Calculate Hours,Minutes,Seconds
  hours = ((possibleSeconds / 60) /60).to_i
  minutes = ((possibleSeconds - (60*60*hours)) /60).to_i
  seconds = (possibleSeconds - (60*60*hours) - (60*minutes)).to_i
  puts "Possible Time Computer Can Stay On"
  puts "#{hours} Hours, #{minutes} Minutes, #{seconds} seconds"
  puts ""
  puts "-------------------------------"
end

###################### Save Results ################################
def saveResults(stagesRes,stage)
  f = File.new("batteryTestOut.txt","w+")
  
    allSeconds = 0

# Print Every Stage
stagesRes.each {
  |stageNum,stageSeconds| 
 
  allSeconds += stageSeconds
  
  # Count Hours,Minutes,Seconds
  hours = ((stageSeconds / 60)/60).to_i
  minutes = ((stageSeconds - (60*60*hours)) /60).to_i
  seconds = (stageSeconds - (60*60*hours) - (60*minutes)).to_i
  
  f.puts "Stage #{stageNum} (#{(100 - stageNum*10) +10}% - #{100 - stageNum*10}%):"
  f.puts "#{hours} Hours, #{minutes} Minutes, #{seconds} seconds"
  f.puts ""
  f.puts "-------------------------------"
}
  #---------------------------------------------------------------
  #Print Overal Time Until The End Of The Test
  # Calculate Hours,Minutes,Seconds
  hours = ((allSeconds / 60) /60).to_i
  minutes = ((allSeconds - (60*60*hours)) /60).to_i
  seconds = (allSeconds - (60*60*hours) - (60*minutes)).to_i

  f.puts "Overal (100% - #{100 - stage.to_i*10}%):"
  f.puts "#{hours} Hours, #{minutes} Minutes, #{seconds} seconds"
  f.puts ""
  f.puts "-------------------------------"
  #---------------------------------------------------------------
  #Print Average Time Per Stage
  averalSeconds = allSeconds / stage.to_i
  # Calculate Hours,Minutes,Seconds
  hours = ((averalSeconds / 60) /60).to_i
  minutes = ((averalSeconds - (60*60*hours)) /60).to_i
  seconds = (averalSeconds - (60*60*hours) - (60*minutes)).to_i
  f.puts "Average Time Per Stage(10%)"
  f.puts "#{hours} Hours, #{minutes} Minutes, #{seconds} seconds"
  f.puts ""
  f.puts "-------------------------------"
  #---------------------------------------------------------------
  #Print Possible Power On Time
  possibleSeconds = (allSeconds / stage.to_i)*10
  # Calculate Hours,Minutes,Seconds
  hours = ((possibleSeconds / 60) /60).to_i
  minutes = ((possibleSeconds - (60*60*hours)) /60).to_i
  seconds = (possibleSeconds - (60*60*hours) - (60*minutes)).to_i
  f.puts "Possible Time Computer Can Stay On"
  f.puts "#{hours} Hours, #{minutes} Minutes, #{seconds} seconds"
  f.puts ""
  f.puts "-------------------------------"
  
end

###################### App Stars Here ################################
#Create Power Object
powerObj = PowerInfo.new	

#Requires Power Source And Full Battery Charge
until (powerObj.powerSource? && powerObj.batteryPercent==100)
  
  system("clear")
  printIntro
  puts "To start testing you must have power source plugged"
  puts "and battery percentage must be 100%"
  puts ""
  puts "Battery: #{powerObj.batteryPercent}%"
  puts "Power Source: Yes" if powerObj.powerSource?
  puts "Power Source: No " if !powerObj.powerSource?
  sleep(1)
  
end

#Ask User To Input Stage Of Test
stage = -1
until ((1..9).to_a.include?(stage.to_i))
  system("clear")
  printIntro
  puts "Choose until what stage you want to run the test."
  puts "For better results Run The Full Test(Stage 9)"
  puts  "Stage 1:  90%"
  puts  "Stage 2:  80%"
  puts  "Stage 3:  70%"
  puts  "Stage 4:  60%"
  puts  "Stage 5:  50%"
  puts  "Stage 6:  40%"
  puts  "Stage 7:  30%"
  puts  "Stage 8:  20%"
  puts  "Stage 9:  10%"
  print  "Choose Stage: "
  stage = gets.chomp
end

#Waits Until User Unplages Power Source
until (!powerObj.powerSource?)
  system("clear")
  printIntro
  puts "Please unplug power source to start the test"
  puts "The test will stop at #{100 - stage.to_i*10}% Of Battery"
  sleep(1)
end

# Main Test Loop
stagesRes = Hash.new(0)
# Get time started
timeStarted = Time.now
currentStage = 0
until (currentStage == stage.to_i)
  

  # Check If state changed
  if(powerObj.batteryPercent == ((100 - currentStage*10) - 10))
    # Go to next state and save time elapsed
    currentStage +=1
    stagesRes[currentStage] = (Time.now - timeStarted).to_i
  end
  
  
  # Check If Power Supply Plugged
  if(powerObj.powerSource?)
    break
  end
  
  
  # Output
  system("clear")
  printIntro
  puts "Please wait until battery reaches #{100 - stage.to_i*10}% or"
  puts "plug power supply to stop the test"
  puts ""
  puts "Battery: #{powerObj.batteryPercent}%"
  sleep(1)
  
end

# Print Results
printResults(stagesRes,stage)

# Save Results To File
saveResults(stagesRes,stage)

