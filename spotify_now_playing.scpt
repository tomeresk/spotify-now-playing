if application "Spotify" is running then
	tell application "Spotify"
		if player state is playing then
			set _artist to (get artist of current track)
			set _name to (get name of current track)
			set _position to player position
			set _duration to (get duration of current track) / 1000
			set _timeInfo to my formatNumber(_position) & " / " & my formatNumber(_duration)
			return _artist & " - " & _name & " - " & _timeInfo
		else
			return ""
		end if
	end tell
else
	return ""
end if

on formatNumber(n)
	set _rounded to round (n)
	set _seconds to _rounded mod 60
	set _minutes to round ((_rounded - _seconds) / 60)
	
	if _seconds < 10 then
		set _formattedSeconds to "0" & _seconds
	else
		set _formattedSeconds to _seconds
	end if
	
	return _minutes & ":" & _formattedSeconds
end formatNumber