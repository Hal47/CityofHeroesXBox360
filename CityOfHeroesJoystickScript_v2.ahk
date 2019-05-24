#Persistent  ; Keep this script running until the user explicitly exits it.
#SingleInstance force

GroupAdd, CityOfHeroesGroup, ahk_class CrypticWindow
SetTitleMatchMode, RegEx
;GroupAdd, CityOfHeroesGroup, .*FlashDevelop

;SendMode InputThenPlay

; Left Thumbstick
Axis1Up = w ;Up
Axis1Down = s ;Down
Axis1Left = a ;Left
Axis1Right = d ;Right

; D-Pad
POVKeyUp = Home
POVKeyDown = End
POVKeyLeft = Numpad7
POVKeyRight = Numpad8
POVAltKeyUp = 7
POVAltKeyDown = 8
POVAltKeyLeft = 9
POVAltKeyRight = 0

; Right Thumbstick
Axis2Up = Insert
Axis2Down = Delete
Axis2Left = q
Axis2Right = e

MMFocus = 0
mouseMoveAmount = 30

LeftTrigger = Shift
RightTrigger = Control

; a
Button1 = Space
; b
Button2 = 3
; x
XBox360ButtonX = 1
; y
Button4 = 2
; Left Bumper
Button5 = 
; Right Bumper
Button6 = Tab
; Back (Select)
Button7 = m
; Start
Button8 = Click
; Left Thumb Press
Button9 = x
; Right Thumb Press
Button10 = m

GoSub, SetupButtons

SetTimer, CheckButtonStates, 5
return

SetupButtons:
	#IfWinActive ahk_group CityOfHeroesGroup

	;! Alt
	;^ Control
	;+ Shift

	;#!a::

	;ToolTip, %newPosX% x %newPosY%

	;DllCall("SetCursorPos", int, newPosX, int, newPosY)
	;return

	; a
		Joy1::
			if (GetKeyState("Joy7")) ; Select / Back
			{
				MouseMove, 0, mouseMoveAmount,, R
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				if (GetKeyState("Joy6")) ; Right Bumper
					Send {F7}
				else
					Send +{y}
				return
			}
			if (GetKeyState("Joy6")) ; Right Bumper hold
			{
				; Inspiration
				Send ^{t}
				return
			}
			pressAndHold(Button1, "Joy1")
			;Send {%Button1%}
		return
		
	; b
		Joy2::
			if (GetKeyState("JoyZ") > 70) ; Left Trigger
			{
				if (GetKeyState("Joy5")) ; Left Bumper
				{
					KeyWait, Joy2, T0.2
					if !ErrorLevel
						sendMMButton(3)
					else
						setMMFocus(2)
				}
				else
				{
					KeyWait, Joy2, T0.2
					if ErrorLevel
						Send ^6
					else
						Send ^3
				}
				return
			}
			if (GetKeyState("Joy5")) ; Left Bumper
			{
				KeyWait, Joy2, T0.2
				if ErrorLevel
					Send !6
				else
					Send !3
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				if (GetKeyState("Joy6")) ; Right Bumper
					Send {F6}
				else
					Send +{n}
				return
			}
			if (GetKeyState("Joy7")) ; Select / Back
			{
				MouseMove, mouseMoveAmount, 0,, R
				return
			}
			if (GetKeyState("Joy6")) ; Right Bumper hold
			{
				; Inspiration
				Send ^{w}
				return
			}
			KeyWait, Joy2, T0.2
			if ErrorLevel
				pressAndHold(6, "Joy2")
			else
				pressAndHold(3, "Joy2")
		return
		
	; x
		Joy3::
			if (GetKeyState("JoyZ") > 70) ; Left Trigger
			{
				if (GetKeyState("Joy5")) ; Left Bumper
				{
					KeyWait, Joy3, T0.2
					if !ErrorLevel
						sendMMButton(4)
					else
						setMMFocus(1)
				}
				else
				{
					KeyWait, Joy3, T0.2
					if ErrorLevel
						Send ^4
					else
						Send ^1
				}
				return
			}
			if (GetKeyState("Joy5")) ; Left Bumper
			{
				KeyWait, Joy3, T0.2
				if ErrorLevel
					Send !4
				else
					Send !1
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				if (GetKeyState("Joy6")) ; Right Bumper
					Send {F10}
				else
					Send +{f}
				return
			}
			if (GetKeyState("Joy7")) ; Select / Back
			{
				MouseMove, -mouseMoveAmount, 0,, R
				return
			}
			if (GetKeyState("Joy6")) ; Right Bumper hold
			{
				; Inspiration
				Send ^{r}
				return
			}
			KeyWait, Joy3, T0.2
			if ErrorLevel
				pressAndHold(4, "Joy3")
			else
				pressAndHold(1, "Joy3")
			;Send 
		return
		
	; y
		Joy4::
			if (GetKeyState("JoyZ") > 70) ; Left Trigger
			{
				if (GetKeyState("Joy5") and GetKeyState("Joy7")) ; Left Bumper & Select
				{
					setupMMControls()
					return
				}
				if (GetKeyState("Joy5")) ; Left Bumper
				{
					KeyWait, Joy4, T0.2
					if !ErrorLevel
						sendMMButton(5)
					else
						setMMFocus(3)
				}
				else
				{
					KeyWait, Joy4, T0.2
					if ErrorLevel
						Send ^5
					else
						Send ^2
				}
				return
			}
			if (GetKeyState("Joy5")) ; Left Bumper
			{
				KeyWait, Joy4, T0.2
				if ErrorLevel
					Send !5
				else
					Send !2
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				if (GetKeyState("Joy6")) ; Right Bumper
					Send {F8}
				else
					Send +{e}
				return
			}
			if (GetKeyState("Joy7")) ; Select / Back
			{
				MouseMove, 0, -mouseMoveAmount,, R
				return
			}
			if (GetKeyState("Joy6")) ; Right Bumper hold
			{
				Send ^{q}
				return
			}
			KeyWait, Joy4, T0.2
			if ErrorLevel
				pressAndHold(5, "Joy4")
			else
				pressAndHold(2, "Joy4")
		return
		
	; Left Bumper
		Joy5::
			if (GetKeyState("JoyZ") > 70) ; Left Trigger
			{
				KeyWait, Joy5, T0.2  ; Wait for the user to release the joystick button in less than 200 milliseconds.
				if !ErrorLevel
					Send {g}
				return
			}
			if (GetKeyState("Joy6")) ; Right Bumper
			{
				KeyWait, Joy5, T0.2  ; Wait for the user to release the joystick button in less than 200 milliseconds.
				if !ErrorLevel
					Send {h}
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				KeyWait, Joy5, T0.2  ; Wait for the user to release the joystick button in less than 200 milliseconds.
				if !ErrorLevel
					Send {k}
				return
			}
			
			KeyWait, Joy5, T0.2  ; Wait for the user to release the joystick button in less than 200 milliseconds.
			if !ErrorLevel
				Send {j}
		return
		
	; Right Bumper
		Joy6::
			if (GetKeyState("JoyZ") > 70) ; Left Trigger
			{
				KeyWait, Joy6, T0.2  ; Wait for the user to release the joystick button in less than 200 milliseconds.
				if !ErrorLevel
					Send ^{Tab}
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				KeyWait, Joy6, T0.2  ; Wait for the user to release the joystick button in less than 200 milliseconds.
				if !ErrorLevel
					Send ^{Tab}
				return
			}
			if (GetKeyState("Joy5")) ; Left Bumper
			{
				KeyWait, Joy6, T0.2  ; Wait for the user to release the joystick button in less than 200 milliseconds.
				if !ErrorLevel
					Send +{Tab}
				return
			}
			;Send {%Button6%}
			KeyWait, Joy6, T0.2  ; Wait for the user to release the joystick button in less than 200 milliseconds.
			if !ErrorLevel
				Send {%Button6%}
		return
		
	; Select
		Joy7::
			if (GetKeyState("JoyZ") > 70) ; Left Trigger
			{
				;Send 
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				;Send 
				return
			}
			if (GetKeyState("Joy5")) ; Left Bumper
			{
				;Send 
				return
			}
			if (GetKeyState("Joy7")) ; Select / Back
			{
				;Send 
				return
			}
			;Send {%Button7%}
		return
		
	; Start
		Joy8::
			if (GetKeyState("JoyZ") > 70) ; Left Trigger
			{
				if (GetKeyState("Joy5") and GetKeyState("Joy7"))  ; Left Bumper & Select
					bindKeys()
				else
				{
					if (GetKeyState("Joy5")) ; Left Bumper
					{
						sendMMButton(6)
						Send +{r}
					}
					else
						Send z
				}
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				WinGetPos, nX, nY, nWidth, nHeight, A
				newPosX := (nX + nWidth * 0.5)
				newPosY := (nY + nHeight * 0.65)
				MouseMove, %newPosX%, %newPosY%, 0
				return
			}
			if (GetKeyState("Joy5")) ; Left Bumper
			{
				Send {Esc}
				return
			}
			if (GetKeyState("Joy6")) ; Right Bumper hold
			{
				Send +{i}
				return
			}
			
			Send {%Button8%}
		return
		
	; Left Thumb Press
		Joy9::
			if (GetKeyState("JoyZ") > 70) ; Left Trigger
			{
				if (GetKeyState("Joy5")) ; Left Bumper
				{
					KeyWait, Joy9, T0.2
					if ErrorLevel ; If it's a hold.
						Send 8
					else ; If it's a tap
						Send 7
				}
				else
				{
					KeyWait, Joy9, T0.2
					if ErrorLevel ; If it's a hold.
						Send ^8
					else ; If it's a tap
						Send ^7
				}
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				return
			}
			if (GetKeyState("Joy5")) ; Left Bumper
			{
				KeyWait, Joy9, T0.2
				if ErrorLevel ; If it's a hold.
					Send !8
				else ; If it's a tap
					Send !7
				return
			}
			pressAndHold(Button9, "Joy9")
		return
		
	; Right Thumb Press
		Joy10::
			if (GetKeyState("JoyZ") > 70) ; Left Trigger
			{
				if (GetKeyState("Joy5")) ; Left Bumper
				{
					KeyWait, Joy10, T0.2
					if ErrorLevel ; If it's a hold.
						Send 0
					else ; If it's a tap
						Send 9
				}
				else
				{
					KeyWait, Joy10, T0.2
					if ErrorLevel ; If it's a hold.
						Send ^0
					else ; If it's a tap
						Send ^9
				}
				return
			}
			if (GetKeyState("JoyZ") < 30) ; Right Trigger
			{
				if (GetKeyState("Joy6")) ; Right Bumper
				{
					WinGetPos, nX, nY, nWidth, nHeight, A
					newPosX := (nX + nWidth * 0.5)
					newPosY := (nY + nHeight * 0.5)
					MouseMove, %newPosX%, %newPosY%, 0
					Send {Click}
				}
				;Send ^0
				return
			}
			if (GetKeyState("Joy5")) ; Left Bumper
			{
				KeyWait, Joy10, T0.2
				if ErrorLevel ; If it's a hold.
					Send !0
				else ; If it's a tap
					Send !9
				return
			}
			if (GetKeyState("Joy6")) ; Right Bumper hold
			{
				Send ^{u}
				return
			}
			pressAndHold(Button10, "Joy10")
		return
return

WatchAxis2:
	GetKeyState, Joy2X, JoyU  ; Get position of X axis.
	GetKeyState, Joy2Y, JoyR  ; Get position of Y axis.
	Axis2XHoldDownPrev = %Axis2XToHoldDown%  ; Prev now holds the key that was down before (if any).
	Axis2YHoldDownPrev = %Axis2YToHoldDown%  ; Prev now holds the key that was down before (if any).

	if Joy2X > 70
		Axis2XToHoldDown = %Axis2Right%
	else if Joy2X < 30
		Axis2XToHoldDown = %Axis2Left%
	else
		Axis2XToHoldDown =

	if Joy2Y > 70
		Axis2YToHoldDown = %Axis2Up%
	else if Joy2Y < 30
		Axis2YToHoldDown = %Axis2Down%
	else
		Axis2YToHoldDown =
;test := GetKeyState("Shift")
;ToolTip, IsShiftDown %test% 
	if Axis2XToHoldDown != %Axis2XHoldDownPrev%  ; Else correct key is already down (or no key is needed).
	{
		; Otherwise, release the previous key and press down the new key:
		SetKeyDelay -1  ; Avoid delays between keystrokes.
		if Axis2XHoldDownPrev   ; There is a previous key to release.
			Send, {%Axis2XHoldDownPrev% up}  ; Release it.
		if Axis2XToHoldDown   ; There is a key to press down.
			Send, {%Axis2XToHoldDown% down}  ; Press it down.
	}
	if Axis2YToHoldDown != %Axis2YHoldDownPrev%  ; Else correct key is already down (or no key is needed).
	{
		; Otherwise, release the previous key and press down the new key:
		SetKeyDelay -1  ; Avoid delays between keystrokes.
		if Axis2YHoldDownPrev   ; There is a previous key to release.
			Send, {%Axis2YHoldDownPrev% up}  ; Release it.
		if Axis2YToHoldDown   ; There is a key to press down.
			Send, {%Axis2YToHoldDown% down}  ; Press it down.
	}
return

WatchAxis1:
	GetKeyState, Joy1X, JoyX  ; Get position of X axis.
	GetKeyState, Joy1Y, JoyY  ; Get position of Y axis.
	Axis1XHoldDownPrev = %Axis1XToHoldDown%  ; Prev now holds the key that was down before (if any).
	Axis1YHoldDownPrev = %Axis1YToHoldDown%  ; Prev now holds the key that was down before (if any).

	if Joy1X > 70
		Axis1XToHoldDown = %Axis1Right%
	else if Joy1X < 30
		Axis1XToHoldDown = %Axis1Left%
	else
		Axis1XToHoldDown =

	if Joy1Y > 70
		Axis1YToHoldDown = %Axis1Down%
	else if Joy1Y < 30
		Axis1YToHoldDown = %Axis1Up%
	else
		Axis1YToHoldDown =

	if Axis1XToHoldDown != %Axis1XHoldDownPrev%  ; Else correct key is already down (or no key is needed).
	{
		; Otherwise, release the previous key and press down the new key:
		SetKeyDelay -1  ; Avoid delays between keystrokes.
		if Axis1XHoldDownPrev   ; There is a previous key to release.
			Send, {%Axis1XHoldDownPrev% up}  ; Release it.
		if Axis1XToHoldDown   ; There is a key to press down.
			Send, {%Axis1XToHoldDown% down}  ; Press it down.
	}
	if Axis1YToHoldDown != %Axis1YHoldDownPrev%  ; Else correct key is already down (or no key is needed).
	{
		; Otherwise, release the previous key and press down the new key:
		SetKeyDelay -1  ; Avoid delays between keystrokes.
		if Axis1YHoldDownPrev   ; There is a previous key to release.
			Send, {%Axis1YHoldDownPrev% up}  ; Release it.
		if Axis1YToHoldDown   ; There is a key to press down.
			Send, {%Axis1YToHoldDown% down}  ; Press it down.
	}
return
	
WatchPOV:
	GetKeyState, POV, JoyPOV  ; Get position of the POV control.
	POVHoldDownPrev = %POVHoldDown%  ; Prev now holds the key that was down before (if any).
	
	; Some joysticks might have a smooth/continous POV rather than one in fixed increments.
	; To support them all, use a range:
	GetKeyState, leftTrig, JoyZ
	
	if POV < 0   ; No angle to report
		POVHoldDown =
	else if POV > 31500                 ; 315 to 360 degrees: Forward
	{
		if (leftTrig > 30 and leftTrig < 70  and !(GetKeyState("Joy5")))
			POVHoldDown = %POVKeyUp%
		else if (leftTrig > 70 and GetKeyState("Joy5"))
		{
			SetKeyDelay, 600
			sendMMButton(0)
			return
		}
		else
			POVHoldDown = %POVAltKeyUp%
	}
	else if POV between 0 and 4500      ; 0 to 45 degrees: Forward
	{
		if (leftTrig > 30 and leftTrig < 70  and !(GetKeyState("Joy5")))
			POVHoldDown = %POVKeyUp%
		else if (leftTrig > 70 and GetKeyState("Joy5"))
		{
			SetKeyDelay, 600
			sendMMButton(0)
			return
		}
		else
			POVHoldDown = %POVAltKeyUp%
	}
	else if POV between 4501 and 13500  ; 45 to 135 degrees: Right
	{
		if (leftTrig > 30 and leftTrig < 70  and !(GetKeyState("Joy5")) and !(GetKeyState("Joy6")))
			POVHoldDown = %POVKeyRight%
		else if (GetKeyState("Joy6"))
		{
			SetKeyDelay, 600
			Send, ^{y}
			return
		}
		else if (leftTrig > 70 and GetKeyState("Joy5"))
		{
			SetKeyDelay, 600
			setMMFocus(0)
			return
		}
		else if (leftTrig > 70)
		{
			SetKeyDelay, 600
			Send, ^{Numpad8}
			return
		}
		else if (GetKeyState("Joy5"))
		{
			SetKeyDelay, 600
			Send, !{Numpad8}
			return
		}
		else
			POVHoldDown = %POVAltKeyRight%
	}
	else if POV between 13501 and 22500 ; 135 to 225 degrees: Down
	{
		if (leftTrig > 30 and leftTrig < 70  and !(GetKeyState("Joy5")))
			POVHoldDown = %POVKeyDown%
		else if (leftTrig > 70 and GetKeyState("Joy5"))
		{
			SetKeyDelay, 600
			sendMMButton(1)
			return
		}
		else
			POVHoldDown = %POVAltKeyDown%
	}
	else                                ; 225 to 315 degrees: Left
	{
		if (leftTrig > 30 and leftTrig < 70  and !(GetKeyState("Joy5")) and !(GetKeyState("Joy6")))
			POVHoldDown = %POVKeyLeft%
		else if (GetKeyState("Joy6"))
		{
			SetKeyDelay, 600
			Send, ^{e}
			return
		}
		else if (leftTrig > 70 and GetKeyState("Joy5"))
		{
			SetKeyDelay, 600
			sendMMButton(2)
			return
		}
		else if (leftTrig > 70)
		{
			SetKeyDelay, 600
			Send, ^{Numpad7}
			return
		}
		else if (GetKeyState("Joy5"))
		{
			SetKeyDelay, 600
			Send, !{Numpad7}
			return
		}
		else
			POVHoldDown = %POVAltKeyLeft%
	}

	if POVHoldDown = %POVHoldDownPrev%  ; The correct key is already down (or no key is needed).
		return  ; Do nothing.

	; Otherwise, release the previous key and press down the new key:
	SetKeyDelay -1  ; Avoid delays between keystrokes.
	if POVHoldDownPrev   ; There is a previous key to release.
		Send, {%POVHoldDownPrev% up}  ; Release it.
	if POVHoldDown   ; There is a key to press down.
		Send {%POVHoldDown% down}  ; Press it down.
return

WatchLeftRightTrig:
	GetKeyState, JoyRud, JoyZ  ; Get position of the POV control.
	RudHoldDownPrev = %RudHoldDown%  ; Prev now holds the key that was down before (if any).
	
	; Some joysticks might have a smooth/continous POV rather than one in fixed increments.
	; To support them all, use a range:
	if JoyRud > 70
		RudHoldDown = %LeftTrigger%
	else if JoyRud < 30
		RudHoldDown = %RightTrigger%
	else
		RudHoldDown =

	if RudHoldDown != %RudHoldDownPrev%  ; The correct key is already down (or no key is needed).
	{
		; Otherwise, release the previous key and press down the new key:
		SetKeyDelay -1  ; Avoid delays between keystrokes.
		if RudHoldDownPrev   ; There is a previous key to release.
			Send, {%RudHoldDownPrev% up}  ; Release it.
		if RudHoldDown   ; There is a key to press down.
			Send, {%RudHoldDown% down}  ; Press it down.
	}
return

CheckButtonStates:
if WinActive("ahk_group CityOfHeroesGroup") ; If City of Heroes is active.
{
	GetKeyState, JoyName, 1JoyName
	if JoyName <>
	{
		;ToolTip, city of heroes Active
		GoSub, WatchAxis2
		GoSub, WatchAxis1
		GoSub, WatchPOV
	}
	else
		return
}
return

pressAndHold(value, key)
{
	Send {%value% down}  ; Hold down the left-arrow key.
	KeyWait, %key%  ; Wait for the user to release the joystick button.
	Send {%value% up}  ; Release the left-arrow key.
}

bindKeys()
{
	Sleep 100
	BlockInput On
	SetKeyDelay 100 ; Avoid delays between keystrokes.
	;ACC (Accuracy)
	NewCommand = bind control+q "inspexecname uncanny_insight$$inspexecname keen_insight$$inspexecname insight"
	sendCommand(NewCommand)
	;DAM (Damage)
	NewCommand = bind control+w "inspexecname righteous_rage$$inspexecname focused_rage$$inspexecname enrage"
	sendCommand(NewCommand)
	;DEF (Defense)
	NewCommand = bind control+e "inspexecname phenomenal_luck$$inspexecname good_luck$$inspexecname luck"
	sendCommand(NewCommand)
	;END (Endurance)
	NewCommand = bind control+r "inspexecname second_wind$$inspexecname take_a_breather$$inspexecname catch_a_breath"
	sendCommand(NewCommand)
	;HTH (Heal)
	NewCommand = bind control+t "inspexecname resurgence$$inspexecname dramatic_improvement$$inspexecname respite"
	sendCommand(NewCommand)
	;RES (Resistance)
	NewCommand = bind control+y "inspexecname robust$$inspexecname rugged$$inspexecname sturdy"
	sendCommand(NewCommand)
	;BF (Anti-status effects)
	NewCommand = bind control+u "inspexecname escape$$inspexecname emerge$$inspexecname break_free"
	sendCommand(NewCommand)
	;Awaken (New Life)
	NewCommand = bind control+i "inspexecname awaken$$inspexecname bounce_back$$inspexecname restoration"
	sendCommand(NewCommand)
	
	; Binds for D-Pad left and right (http://cityofheroes.wikia.com/wiki/Target_custom_next_(Slash_Command))
	NewCommand = bind j target_friend_next
	sendCommand(NewCommand)
	NewCommand = bind g target_friend_near
	sendCommand(NewCommand)
	NewCommand = bind h target_friend_prev
	sendCommand(NewCommand)
	NewCommand = bind k target_friend_far
	sendCommand(NewCommand)
	
	NewCommand = bind lshift+y dialog_yes
	sendCommand(NewCommand)
	NewCommand = bind lshift+n dialog_no
	sendCommand(NewCommand)
	NewCommand = bind lshift+e requestexitmission 1
	sendCommand(NewCommand)
	NewCommand = bind lshift+r release
	sendCommand(NewCommand)
	NewCommand = bind lshift+f face$$target_custom_near notteammate notmypet
	sendCommand(NewCommand)
	
	;setupMMControls()
	
	Loop, 10
	{
		index := A_index - 1
		NewCommand = bind ALT+%index% "powexec_altslot %index%"
		sendCommand(NewCommand)
		NewCommand = bind CTRL+%index% "powexec_alt2slot %index%"
		sendCommand(NewCommand)
	}
	
	NewCommand = bind numpad7 "prev_tray"
	sendCommand(NewCommand)
	NewCommand = bind numpad8 "next_tray"
	sendCommand(NewCommand)
	NewCommand = bind lalt+numpad7 "prev_tray_alt"
	sendCommand(NewCommand)
	NewCommand = bind lalt+numpad8 "next_tray_alt"
	sendCommand(NewCommand)
	NewCommand = bind lctrl+numpad7 "prev_tray_alt2"
	sendCommand(NewCommand)
	NewCommand = bind lctrl+numpad8 "next_tray_alt2"
	sendCommand(NewCommand)
	
	NewCommand = s Keys bound successfully. Thanks for using your XBox360 controller!
	sendCommand(NewCommand)
	
	BlockInput Off
}

setupMMControls()
{
	NewCommand = bind numpad0 "petcomall agg"
	sendCommand(NewCommand)
	NewCommand = bind lalt+numpad0 "petcompow ling agg$$petcompow sold agg$$petcompow zomb agg$$petcompow gen agg$$petcompow batt agg$$petcompow thug agg"
	sendCommand(NewCommand)
	NewCommand = bind lctrl+numpad0 "petcompow mons agg$$petcompow spec agg$$petcompow grav agg$$petcompow jou agg$$petcompow prot agg$$petcompow enf agg"
	sendCommand(NewCommand)
	NewCommand = bind lshift+numpad0 "petcompow prin agg$$petcompow comm agg$$petcompow lich agg$$petcompow oni agg$$petcompow assa agg$$petcompow bru agg"
	sendCommand(NewCommand)
	NewCommand = bind numpad1 "petcomall def"
	sendCommand(NewCommand)
	NewCommand = bind lalt+numpad1 "petcompow ling def$$petcompow sold def$$petcompow zomb def$$petcompow gen def$$petcompow batt def$$petcompow thug def"
	sendCommand(NewCommand)
	NewCommand = bind lctrl+numpad1 "petcompow mons def$$petcompow spec def$$petcompow grav def$$petcompow jou def$$petcompow prot def$$petcompow enf def"
	sendCommand(NewCommand)
	NewCommand = bind lshift+numpad1 "petcompow prin def$$petcompow comm def$$petcompow lich def$$petcompow oni def$$petcompow assa def$$petcompow bru def"
	sendCommand(NewCommand)
	NewCommand = bind numpad2 "petcomall pass"
	sendCommand(NewCommand)
	NewCommand = bind lalt+numpad2 "petcompow ling pass$$petcompow sold pass$$petcompow zomb pass$$petcompow gen pass$$petcompow batt pass$$petcompow thug pass"
	sendCommand(NewCommand)
	NewCommand = bind lctrl+numpad2 "petcompow mons pass$$petcompow spec pass$$petcompow grav pass$$petcompow jou pass$$petcompow prot pass$$petcompow enf pass"
	sendCommand(NewCommand)
	NewCommand = bind lshift+numpad2 "petcompow prin pass$$petcompow comm pass$$petcompow lich pass$$petcompow oni pass$$petcompow assa pass$$petcompow bru pass"
	sendCommand(NewCommand)
	NewCommand = bind numpad3 "petcomall att"
	sendCommand(NewCommand)
	NewCommand = bind lalt+numpad3 "petcompow ling att$$petcompow sold att$$petcompow zomb att$$petcompow gen att$$petcompow batt att$$petcompow thug att"
	sendCommand(NewCommand)
	NewCommand = bind lctrl+numpad3 "petcompow mons att$$petcompow spec att$$petcompow grav att$$petcompow jou att$$petcompow prot att$$petcompow enf att"
	sendCommand(NewCommand)
	NewCommand = bind lshift+numpad3 "petcompow prin att$$petcompow comm att$$petcompow lich att$$petcompow oni att$$petcompow assa att$$petcompow bru att"
	sendCommand(NewCommand)
	NewCommand = bind numpad4 "petcomall fol"
	sendCommand(NewCommand)
	NewCommand = bind lalt+numpad4 "petcompow ling fol$$petcompow sold fol$$petcompow zomb fol$$petcompow gen fol$$petcompow batt fol$$petcompow thug fol"
	sendCommand(NewCommand)
	NewCommand = bind lctrl+numpad4 "petcompow mons fol$$petcompow spec fol$$petcompow grav fol$$petcompow jou fol$$petcompow prot fol$$petcompow enf fol"
	sendCommand(NewCommand)
	NewCommand = bind lshift+numpad4 "petcompow prin fol$$petcompow comm fol$$petcompow lich fol$$petcompow oni fol$$petcompow assa fol$$petcompow bru fol"
	sendCommand(NewCommand)
	NewCommand = bind numpad5 "petcomall goto"
	sendCommand(NewCommand)
	NewCommand = bind lalt+numpad5 "petcompow ling goto$$petcompow sold goto$$petcompow zomb goto$$petcompow gen goto$$petcompow batt goto$$petcompow thug goto"
	sendCommand(NewCommand)
	NewCommand = bind lctrl+numpad5 "petcompow mons goto$$petcompow spec goto$$petcompow grav goto$$petcompow jou goto$$petcompow prot goto$$petcompow enf goto"
	sendCommand(NewCommand)
	NewCommand = bind lshift+numpad5 "petcompow prin goto$$petcompow comm goto$$petcompow lich goto$$petcompow oni goto$$petcompow assa goto$$petcompow bru goto"
	sendCommand(NewCommand)
	NewCommand = bind numpad6 "petcomall dismiss"
	sendCommand(NewCommand)
	NewCommand = bind lalt+numpad6 "petcompow ling dismiss$$petcompow sold dismiss$$petcompow zomb dismiss$$petcompow gen dismiss$$petcompow batt dismiss$$petcompow thug dismiss"
	sendCommand(NewCommand)
	NewCommand = bind lctrl+numpad6 "petcompow mons dismiss$$petcompow spec dismiss$$petcompow grav dismiss$$petcompow jou dismiss$$petcompow prot dismiss$$petcompow enf dismiss"
	sendCommand(NewCommand)
	NewCommand = bind lshift+numpad6 "petcompow prin dismiss$$petcompow comm dismiss$$petcompow lich dismiss$$petcompow oni dismiss$$petcompow assa dismiss$$petcompow bru dismiss"
	sendCommand(NewCommand)
}

unbindMMControls()
{
	Loop, 7
	{
		index := A_index - 1
		NewCommand = bind numpad%index% "nop"
		ToolTip, %NewCommand%
		sendCommand(NewCommand)
		NewCommand = bind lalt+numpad%index% "nop"
		sendCommand(NewCommand)
		NewCommand = bind lctrl+numpad%index% "nop"
		sendCommand(NewCommand)
		NewCommand = bind lctrl+numpad%index% "nop"
		sendCommand(NewCommand)
	}
}

sendCommand(sCommand)
{
	SendInput /
	Clipboard = %sCommand%
	Sleep 100
	SendInput ^v
	SendInput {Enter}
	Sleep 100
}
				
sendMMButton(val)
{
	global MMFocus
	key = Numpad%val% 
	if ( MMFocus = 0)
	{
		;ToolTip, set to all %val% 
		Send {%key%}
	}
	else if (MMFocus = 1)
	{
		;ToolTip, set to minions %val%
		Send !{%key%}
	}
	else if (MMFocus = 2)
	{
		;ToolTip, set to lieuts %val%
		Send ^{%key%}
	}
	else if (MMFocus = 3)
	{
		;ToolTip, set to boss %val% %key%
		Send +{%key%} 
	}
}
				
setMMFocus(val)
{
	global MMFocus 
	MMFocus := val
	;ToolTip, Set focus to %val% = %MMFocus%
}

;#+s::setupMMControls()
!+b::bindKeys()
#+!r::unbindMMControls()

#+r::Reload

#IfWinActive