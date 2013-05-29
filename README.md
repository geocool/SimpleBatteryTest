Simple Battery Test
=================

A Simple Ruby Script For Testing How Much Time A Notebook Can Stay On.   
After the test finishes, it will save results on a file in the same folder.   
   
**Requirements**   
Target OS: Ubuntu   
You need to have installed ruby (sudo apt-get install ruby)   
You also need to have installed acpi (sudo apt-get install acpi)   
   

**How It Works**   
In every stage(every stage is 10% Of battery loss) script saves time elapsed.  
At the end of the test it shows time elapsed, average time elapsed and possible  
computer can stay on.  
   
**Run**   
Run the script and choose at what battery percentage test will stop.   
Smaller percentage mean more accurate result. Try to run Full Test(Stage 9)   
To run the script type at terminal ./BatteryTest.rb   
   
Tested On Ubuntu 13.04
