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
    lastchar=substr(lastvow,strlen(lastvow),1)
    if((lastchar="a" or lastchar="e" or (lastchar="" and lastmid<>"")) and py="n")
      send '
    else if(lastchar="n" and py="g")
      send '
    else if(lastchar="g" and py="")
      send '
    
    send %py%
    if(instr("|z|c|s|zh|ch|sh|r|","|" . py . "|")<>0)
      send i
    
    lastcon:=py
    zypart:=1
  }
  else if(part=2)
  {
    if(zypart=1 and lastcon<>"" and not (instr("|z|c|s|zh|ch|sh|r|","|" . lastcon . "|")<>0 and instr("iv",py)<>0))
    {
      if(instr("|z|c|s|zh|ch|sh|r|","|" . lastcon . "|")<>0)
      {
        send {backspace}
      }
      if(instr("jqx",lastcon) and py="v")
        send u
      else
        send %py%
    }
    else
    {
      lastcon:=""
      if(py="i")
        send yi
      if(py="u")
        send wu
      if(py="v")
        send yu
    }
    lastmid:=py
    lastvow:=""
    zypart:=2
  }
  else if(part=3)
  {
    if(zypart=1 and lastcon<>"")
    {
      if(instr("|z|c|s|zh|ch|sh|r|","|" . lastcon . "|")<>0)
        send {backspace}
      send %py%
    }
    else if(zypart=2)
    {
      if(lastmid="i" or lastmid="v")
      {
        if(py="o" and lastcon="" and lastmid="i")
          send {backspace}o
        else if(py="en")
          send n
        else if(py="eng")
        {
          if(lastmid="i")
            send ng
          else if(lastcon="") ;v+eng
            send {backspace}ong
          else
            send {backspace}iong
        }
        else if(py="ou")
        {
          if(lastcon="")
            send {backspace}ou
          else
            send u
        }
        else
        {
          if(lastcon="" and lastmid="i")
            send {backspace}
          send %py%
        }
      }
      else if(lastmid="u")
      {
        if(py="o" and lastcon="" and lastmid="u")
          send {backspace}o
        else if(py="en")
        {
          if(lastcon="")
            send {backspace}en
          else
            send n
        }
        else if(py="eng")
        {
          if(lastcon="")
            send {backspace}eng
          else
            send {backspace}ong
        }
        else if(py="ei")
        {
          if(lastcon="")
            send {backspace}ei
          else
            send i
        }
        else
        {
          if(lastcon="" and lastmid="u")
            send {backspace}
          send %py%
        }
      }
    }
    else
    {
      local lastchar=substr(lastvow,strlen(lastvow),1)
      if(lastchar="n" or lastchar="g")
        send '
      if(lastchar="" and lastmid<>"")
        send '
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
{
  send 1
  reset()
}
else
  send {F1}
return
$F2::
if(enable=1)
{
  send 2
  reset()
}
else
  send {F2}
return
$F3::
if(enable=1)
{
  send 3
  reset()
}
else
  send {F3}
return
$F4::
if(enable=1)
{
  send 4
  reset()
}
else
  send {F4}
return
$F5::
if(enable=1)
{
  send 5
  reset()
}
else
  send {F5}
return
$F6::
if(enable=1)
{
  send 6
  reset()
}
else
  send {F6}
return
$F7::
if(enable=1)
{
  send 7
  reset()
}
else
  send {F7}
return
$F8::
if(enable=1)
{
  send 8
  reset()
}
else
  send {F8}
return
$F9::
if(enable=1)
{
  send 9
  reset()
}
else
  send {F9}
return
$F10::
if(enable=1)
{
  send 0
  reset()
}
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

$space::
if(enable=1)
  reset()
send {space}
return

$^!,::
if(enable=1)
  enable:=2
else if(enable=2)
{
  enable:=1
  reset()
}
send ^!,
return

$backspace::
if(enable=1)
  reset()
send {backspace}
return

$3::
inpzy("3", "",1)
return

$`::
if(enable=1)
  send {up}
else
  send ``
return

$4::
if(enable=1)
  send {down}
else
  send 4
return

$6::
if(enable=1)
  send `,
else
  send 6
return

$7::
if(enable=1)
  send .
else
  send 7
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

$e::
inpzy("e","g",1)
return
$d::
inpzy("d","k",1)
return
$c::
inpzy("c","h",1)
return

$r::
inpzy("r","j",1)
return
$f::
inpzy("f","q",1)
return
$v::
inpzy("v","x",1)
return

$5::
inpzy("5","zh",1)
return
$t::
inpzy("t","ch",1)
return
$g::
inpzy("g","sh",1)
return
$b::
inpzy("b","r",1)
return

$y::
inpzy("y","z",1)
return
$h::
inpzy("h","c",1)
return
$n::
inpzy("n","s",1)
return

$u::
inpzy("u","i",2)
return
$j::
inpzy("j","u",2)
return
$m::
inpzy("m","v",2)
return

$8::
inpzy("8","a",3)
return
$i::
inpzy("i","o",3)
return
$k::
inpzy("k","e",3)
return
$,::
inpzy(",","e",3)
return

$9::
inpzy("9","ai",3)
return
$o::
inpzy("o","ei",3)
return
$l::
inpzy("l","ao",3)
return
$.::
inpzy(".","ou",3)
return

$0::
inpzy("0","an",3)
return
$p::
inpzy("p","en",3)
return
$;::
inpzy(";","ang",3)
return
$/::
inpzy("/","eng",3)
return

$-::
inpzy("-","er",3)
return
