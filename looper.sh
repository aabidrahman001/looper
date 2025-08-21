echo "
 ___           ________      ________      ________    _______       ________     
|\  \         |\   __  \    |\   __  \    |\   __  \  |\  ___ \     |\   __  \    
\ \  \        \ \  \|\  \   \ \  \|\  \   \ \  \|\  \ \ \   __/|    \ \  \|\  \   
 \ \  \        \ \   \\\  \   \ \   \\\  \   \ \   ____\ \ \  \_|/__   \ \   _  _\  
  \ \  \____    \ \   \\\  \   \ \   \\\  \   \ \  \___|  \ \  \_|\ \   \ \  \\  \| 
   \ \_______\   \ \_______\   \ \_______\   \ \__\      \ \_______\   \ \__\\ _\ 
    \|_______|    \|_______|    \|_______|    \|__|       \|_______|    \|__|\|__|
                                                                                  
"
echo "Please wait while Gandalf does his magic on your IDE..."
echo "Cleanup running..."
sleep 2

echo "Stopping running Java tasks,your IDE will now exit..."
pkill -9 java

sleep 2
echo "Creating log..."
LOG_FILE="$(dirname "$0")/task.log"

sleep 2
echo "Feeding the Hamsters..."
rm -rf ~/.config/JetBrains/IntelliJIdea2020.1/eval/idea201.evaluation.key

echo "Setting your house on fire..."
rm -rf ~/.config/JetBrains/IntelliJIdea*/options/other.xml

echo "Inviting Elon Musk to a boxing match..."
rm -rf ~/.java/.userPrefs/jetbrains/idea

echo "Trial period has been extended!"

echo "Running looper task at $(date)" >> "$LOG_FILE"

