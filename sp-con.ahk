setkeydelay -1,-1

enable:=0
sppart:=0
lastcon:=""
lastvow:=""

spkey(key, con, vow0, vow0c="*", vow1="", vow1c="*", vow2="", vow2c="*", vow3="")
{
	global
	if(enable=0)
		send %key%
	else
	{
		if(sppart=0)
		{
			if(lastvow<>"")
			{
				local lastchar=substr(lastvow,strlen(lastvow),1)
				if((instr("aeiu",lastchar)<>0 and (con="er" or con="n")) or (lastchar="n" and (con="er" or con="g")) or (lastchar="g" and (con="er")) or (lastchar="r" and (con="er")))
				{
					send '
				}
			}
			send %con%
			if(con=",")
			{
				lastcon:=""
				lastvow:=""
			}
			else if(con="er")
			{
				lastvow:="er"
			}
			else
			{
				lastcon:=con
				sppart:=1
			}
		}
		else
		{
			local tosend=""
			if(vow0c="*")
				tosend:=vow0
			else if(instr(vow0c, "|" . lastcon . "|")<>0)
				tosend:=vow0
			else if(vow1c="*")
				tosend:=vow1
			else if(instr(vow1c, "|" . lastcon . "|")<>0)
				tosend:=vow1
			else if(vow2c="*")
				tosend:=vow2
			else if(instr(vow2c, "|" . lastcon . "|")<>0)
				tosend:=vow2
			else
				tosend:=vow3
			if(lastcon="" and lastvow<>"" and instr("aoe",substr(tosend,1,1))<>0)
			{
				local lastchar=substr(lastvow,strlen(lastvow),1)
				if(instr("ngriuv",lastchar)<>0)
				{
					send '
				}
			}
			send %tosend%
			lastvow:=tosend
			sppart:=0
		}
	}
}

$F2::
enable:=1-enable
if(enable=1)
	sppart:=0
return

$backspace::
lastcon:=""
lastvow:=""
sppart:=0
send {backspace}
return

$t::
    spkey("t", "t", "ia", "|j|q|x|", "a")
return
$r::
    spkey("r", "r", "iai", "|j|q|x|", "ai")
return
$e::
    spkey("e", "er", "iao", "|j|q|x|", "ao")
return
$w::
    spkey("w", "w", "ian", "|j|q|x|", "an")
return
$q::
    spkey("q", "q", "iang", "|j|q|x|", "ang")
return
$y::
    spkey("y", "y", "ie", "|j|q|x|", "o", "|b|p|f|w|", "e")
return
$u::
    spkey("u", "sh", "i", "|j|q|x|y|", "ei")
return
$i::
    spkey("i", "ch", "iu", "|j|q|x|", "ou")
return
$o::
    spkey("o", "", "in", "|j|q|x|y|", "en")
return
$p::
    spkey("p", "p", "ing", "|j|q|x|y|", "eng")
return

$g::
    spkey("g", "g", "yi", "||", "i")
return
$f::
    spkey("f", "f", "a", "|y|", "ya", "||", "ia")
return
$d::
    spkey("d", "d", "ao", "|y|", "yao", "||", "iao")
return
$s::
    spkey("s", "s", "an", "|y|", "yan", "||", "ian")
return
$a::
    spkey("a", "", "ang", "|y|w|", "uang", "|g|k|h|w|zh|ch|sh|r|", "iang")
return
$h::
    spkey("h", "h", "e", "|y|", "ye", "||", "ie")
return
$j::
    spkey("j", "j", "ou", "|y|", "you", "||", "iu")
return
$k::
    spkey("k", "k", "yin", "||", "in")
return
$l::
    spkey("l", "l", "ying", "||", "ing")
return

$v::
    spkey("v", "zh", "wu", "||", "u")
return
$c::
    spkey("c", "c", "wa", "||", "a", "|w|", "ue", "|j|q|x|y|n|l|", "ua")
return
$x::
    spkey("x", "x", "wai", "||", "ai", "|w|", "o", "|l|y||", "uai")
return
$z::
    spkey("z", "z", "wan", "||", "an", "|w|", "uan")
return
$b::
    spkey("b", "b", "o", "|b|p|m|f|y|w||", "io", "|j|q|x|", "uo")
return
$n::
    spkey("n", "n", "wei", "||", "ei", "|w|", "v", "|j|q|x|y|n|l|", "ui")
return
$m::
    spkey("m", "m", "wen", "||", "en", "|w|", "un")
return
$,::
    spkey(",", ",", "weng", "||", "eng", "|w|", "iong", "|j|q|x|", "ong")
return
