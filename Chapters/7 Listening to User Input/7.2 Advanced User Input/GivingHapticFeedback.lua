local HapticService = game:GetService("HapticService")

function giveHapticFeedback(inputType, vibrationMotor, duration, ...)
    if 
        -- Checking if Vibration is supported ...
        HapticService:IsVibrationSupported(inputType) == true
        -- ... and if Motor is supported
        and HapticService:IsMotorSupported(inputType, vibrationMotor) == true
    then
        -- Setting Gamepad Motor
        HapticService:SetMotor(inputType, vibrationMotor, ...)
        
        -- Waiting for duration
        if duration > 0 then
            task.wait(duration)
            HapticService:SetMotor(inputType, vibrationMotor, 0)
        end
    end
end

giveHapticFeedback(
    Enum.UserInputType.Gamepad1, -- inputType
    Enum.VibrationMotor.Large, -- vibrationMotor
    .5, -- duration
    .5 -- intensity
)