setkeydelay -1,-1

enable:=0
last:=""

spkey(key, str)
{
	global
	if(enable=0)
		send %key%
	else
	{
		if(last="#ng" and (str="a" or str="e" or str="o" or str="u"))
			send '
		if(last="#n" and (str="a" or str="e" or str="o" or or str="i" or str="u" or str="g"))
			send '
		if((last="j" or last="q" or last="x") and str="o")
			send i
		
		if(((key=";" or key=",") and last="") or str="")
			send %key%
		else
			send %str%
		
		if(((key=";" or key=",") and last="") or str="")
			last:=""
		else if(key!=str)
			last:="#"+str
		else
			last:=str
	}
}

reset()
{
  global
  last:=""
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

$t::
    spkey("t", "t")
return
$r::
    spkey("r", "r")
return
$e::
    spkey("e", "e")
return
$w::
    spkey("w", "w")
return
$q::
    spkey("q", "q")
return
$y::
    spkey("y", "y")
return
$u::
    spkey("u", "u")
return
$i::
    spkey("i", "i")
return
$o::
    spkey("o", "o")
return
$p::
    spkey("p", "p")
return

$g::
    spkey("g", "g")
return
$f::
    spkey("f", "f")
return
$d::
    spkey("d", "d")
return
$s::
    spkey("s", "s")
return
$a::
    spkey("a", "a")
return
$h::
    spkey("h", "h")
return
$j::
    spkey("j", "j")
return
$k::
    spkey("k", "k")
return
$l::
    spkey("l", "l")
return

$v::
    spkey("v", "v")
return
$c::
    spkey("c", "c")
return
$x::
    spkey("x", "x")
return
$z::
    spkey("z", "z")
return
$b::
    spkey("b", "b")
return
$n::
    spkey("n", "n")
return
$m::
    spkey("m", "m")
return

$,::
    spkey(",", "n")
return
$;::
    spkey(";", "ng")
return

$6::
    spkey("6", "zh")
return
$7::
    spkey("7", "ch")
return
$8::
    spkey("8", "sh")
return
$9::
    spkey("9", "ia")
return
$0::
    spkey("0", "ua")
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

$space::
send {space}
if(enable=1)
  reset()
return