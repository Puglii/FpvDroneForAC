Input = {
    throttle = 0,
    roll = 0,
    pitch = 0,
    yaw = 0,
}

function Input:update()
    self.throttle = Settings.throttleAxis == -1 and -1 or ac.getJoystickAxisValue(Settings.inputDevice, Settings.throttleAxis)
    self.roll = ac.getJoystickAxisValue(Settings.inputDevice, Settings.rollAxis)
    self.pitch = ac.getJoystickAxisValue(Settings.inputDevice, Settings.pitchAxis)
    self.yaw = ac.getJoystickAxisValue(Settings.inputDevice, Settings.yawAxis)
    self.throttle = (2 * self.throttle - (Settings.throttleFrom + Settings.throttleTo)) / (Settings.throttleTo - Settings.throttleFrom)
    self.roll = (2 * self.roll - (Settings.rollFrom + Settings.rollTo)) / (Settings.rollTo - Settings.rollFrom)
    self.pitch = (2 * self.pitch - (Settings.pitchFrom + Settings.pitchTo)) / (Settings.pitchTo - Settings.pitchFrom)
    self.yaw = (2 * self.yaw - (Settings.yawFrom + Settings.yawTo)) / (Settings.yawTo - Settings.yawFrom)
    if Settings.invertThrottle then self.throttle = self.throttle * -1 end
    if Settings.invertRoll then self.roll = self.roll * -1 end
    if Settings.invertPitch then self.pitch = self.pitch * -1 end
    if Settings.invertYaw then self.yaw = self.yaw * -1 end
end
