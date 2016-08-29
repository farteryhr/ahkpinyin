setkeydelay -1,-1

enable:=0
zypart:=0
lastcon:=""
lastmid:=""
lastvow:=""

inpzy(key, py, part)
{
  global
  if(enable=0 or enable=2) ;2: temp disable
  {
    send %key%
    return
  }
  if(part=1)
  {
    local lastchar=""
    if(zypart=0)
    {
      lastchar=substr(lastvow,strlen(lastvow),1)
      if(lastchar="n" and (py="g" or py=""))
        send '
      else if(py="")
        send '
    }
    else if(zypart=2)
    {
      if(instr("|p|t|k|m|n|ng||","|" . py . "|")<>0)
        send '
    }
    send %py%
    
    lastcon:=py
    zypart:=1
  }
  else if(part=2)
  {
    if(zypart=1 and lastcon="")
    {
      if(lastvow<>"")
        send '
      else if(lastmid<>"")
        send '
    }
    else if(zypart=0 and lastvow<>"")
    {
      send '
    }
    else if(zypart=2)
    {
      send '
    }
    send %py%
    
    lastmid:=py
    lastvow:=""
    zypart:=2
  }
  else if(part=3)
  {
    if(zypart=1 and lastcon=py)
    {
      
    }
    else if(zypart=1 and lastcon="")
    {
      send %py%
    }
    else if(zypart=2)
    {
      if(lastmid="oe")
      {
        if(py="i" or py="n" or py="t")
          send {backspace}{backspace}eo
      }
      send %py%
    }
    else
    {
      send %py%
    }
    
    zypart:=0
    lastvow:=py
  }
}

$F12::
if(enable<>0)
  enable:=0
else
{
  enable:=1
  reset()
}
if(enable=1)
	zypart:=0
return

$F1::
if(enable=1)
  send 1
else
  send {F1}
return
$F2::
if(enable=1)
  send 2
else
  send {F2}
return
$F3::
if(enable=1)
  send 3
else
  send {F3}
return
$F4::
if(enable=1)
  send 4
else
  send {F4}
return
$F5::
if(enable=1)
  send 5
else
  send {F5}
return
$F6::
if(enable=1)
  send 6
else
  send {F6}
return
$F7::
if(enable=1)
  send 7
else
  send {F7}
return
$F8::
if(enable=1)
  send 8
else
  send {F8}
return
$F9::
if(enable=1)
  send 9
else
  send {F9}
return
$F10::
if(enable=1)
  send 0
else
  send {F10}
return

reset()
{
  global
  lastcon:=""
  lastmid:=""
  lastvow:=""
  zypart:=0
}

$shift::
if(enable=1)
  enable:=2
else if(enable=2)
{
  enable:=1
  reset()
}
;send {shift}
return

$backspace::
if(enable=1)
  reset()
send {backspace}
return

$1::
inpzy("1","b",1)
return
$q::
inpzy("q","p",1)
return
$a::
inpzy("a","m",1)
return
$z::
inpzy("z","f",1)
return

$2::
inpzy("2","d",1)
return
$w::
inpzy("w","t",1)
return
$s::
inpzy("s","n",1)
return
$x::
inpzy("x","l",1)
return

$3::
inpzy("3","z",1)
return
$e::
inpzy("e","c",1)
return
$d::
inpzy("d","s",1)
return
$c::
inpzy("c","j",1)
return

$4::
inpzy("4","g",1)
return
$r::
inpzy("r","k",1)
return
$f::
inpzy("f","ng",1)
return
$v::
inpzy("v","h",1)
return

$5::
inpzy("5","gw",1)
return
$t::
inpzy("t","kw",1)
return
$g::
inpzy("g","w",1)
return
$b::
inpzy("b","",1)
return

$6::
inpzy("6","aa",2)
return
$y::
inpzy("y","a",2)
return
$h::
inpzy("h","e",2)
return
$n::
inpzy("n","i",2)
return

$7::
inpzy("7","o",2)
return
$u::
inpzy("u","u",2)
return
$j::
inpzy("j","oe",2)
return
$m::
inpzy("m","yu",2)
return

$8::
inpzy("8","p",3)
return
$i::
inpzy("i","t",3)
return
$k::
inpzy("k","k",3)
return

$9::
inpzy("9","m",3)
return
$o::
inpzy("o","n",3)
return
$l::
inpzy("l","ng",3)
return

$0::
inpzy("0","i",3)
return
$p::
inpzy("p","u",3)
return