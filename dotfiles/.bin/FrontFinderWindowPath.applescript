tell application "Finder"
	if (count of Finder windows) > 0 then
		get POSIX path of (target of front Finder window as text)
	else
		get "No Finder window found"
	end if
end tell