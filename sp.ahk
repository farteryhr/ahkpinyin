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

reset()
{
  global
  sppart:=0
  lastcon:=""
  lastvow:=""
}

$F2::
enable:=1-enable
if(enable=1)
  reset()
return

$backspace::
reset()
send {backspace}
return

$1::
send 1
if(enable=1)
  reset()
return

$2::
send 2
if(enable=1)
  reset()
return

$3::
send 3
if(enable=1)
  reset()
return

$4::
send 4
if(enable=1)
  reset()
return

$5::
send 5
if(enable=1)
  reset()
return

$6::
send 6
if(enable=1)
  reset()
return

$7::
send 7
if(enable=1)
  reset()
return

$8::
send 8
if(enable=1)
  reset()
return

$9::
send 9
if(enable=1)
  reset()
return

$0::
send 0
if(enable=1)
  reset()
return

$space::
send {space}
if(enable=1)
  reset()
return

$t::
    spkey("t", "", "ia", "|j|q|x|", "a")
return
$r::
    spkey("r", "b", "iai", "|j|q|x|", "ai")
return
$e::
    spkey("e", "p", "iao", "|j|q|x|", "ao")
return
$w::
    spkey("w", "m", "ian", "|j|q|x|", "an")
return
$q::
    spkey("q", "f", "iang", "|j|q|x|", "ang")
return
$y::
    spkey("y", "j", "ie", "|j|q|x|", "o", "|b|p|f|w|", "e")
return
$u::
    spkey("u", "q", "i", "|j|q|x|y|", "ei")
return
$i::
    spkey("i", "x", "iu", "|j|q|x|", "ou")
return
$o::
    spkey("o", "er", "in", "|j|q|x|y|", "en")
return
$p::
    spkey("p", "", "ing", "|j|q|x|y|", "eng")
return

$g::
    spkey("g", "y", "yi", "||", "i")
return
$f::
    spkey("f", "d", "a", "|y|", "ya", "||", "ia")
return
$d::
    spkey("d", "t", "ao", "|y|", "yao", "||", "iao")
return
$s::
    spkey("s", "n", "an", "|y|", "yan", "||", "ian")
return
$a::
    spkey("a", "l", "ang", "|y|w|", "uang", "|g|k|h|w|zh|ch|sh|r|", "iang")
return
$h::
    spkey("h", "zh", "e", "|y|", "ye", "||", "ie")
return
$j::
    spkey("j", "ch", "ou", "|y|", "you", "||", "iu")
return
$k::
    spkey("k", "sh", "yin", "||", "in")
return
$l::
    spkey("l", "r", "ying", "||", "ing")
return

$v::
    spkey("v", "w", "wu", "||", "u")
return
$c::
    spkey("c", "g", "wa", "||", "a", "|w|", "ue", "|j|q|x|y|n|l|", "ua")
return
$x::
    spkey("x", "k", "wai", "||", "ai", "|w|", "o", "|l|y||", "uai")
return
$z::
    spkey("z", "h", "wan", "||", "an", "|w|", "uan")
return
$b::
    spkey("b", "z", "o", "|b|p|m|f|y|w||", "io", "|j|q|x|", "uo")
return
$n::
    spkey("n", "c", "wei", "||", "ei", "|w|", "v", "|j|q|x|y|n|l|", "ui")
return
$m::
    spkey("m", "s", "wen", "||", "en", "|w|", "un")
return
$,::
    spkey(",", ",", "weng", "||", "eng", "|w|", "iong", "|j|q|x|", "ong")
return
