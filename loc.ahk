; loc stands for local

global Loc := {}

global Accent := 0

global Toggle := 0

global JustToggled := false

Menu, Tray, Icon, cono/old.png

my_send(key)
{
  as_list := Dual.subKeySet(key)

  for index, subKey in as_list {
    Dual.sendInternal(subKey)
  }
}

resolve_shift(topo,below)
{
  LS := GetKeyState("LShift")

  RS := GetKeyState("RShift")

  CL := GetKeyState("CapsLock","T")

  S := 0

  if (LS && RS)
  {
    go_up := "{LShift UP}{RShift UP}"
    S := 3
  }
  else if (LS)
  {
    go_up := "{LShift UP}"
    S := 1
  }
  else if (RS)
  {
    go_up := "{RShift UP}"
    S := 2
  }

  if (CL)
  {
    tmp := topo
    topo := below
    below := tmp
  }

  data := {go_up:go_up,S:S,topo:topo,below:below}

  return data
}

fr_remap(letter,symbol)
{

}


three_symbols(small,mid,tower)
{
  dual.combo("")

  data := resolve_shift(small,mid)

  if (data.S = 2)
  {

    toc := data.go_up . tower
    SendInput %toc%
    return
  }

  if (data.S = 1)
  { 
    toc := data.go_up . data.topo
    SendInput %toc%
  }
  else
  {
    toc := data.go_up . data.below
    SendInput %toc%
  }

}

constant(below,topo)
{
  dual.comboKey(below,{Shift:topo})
}

switch_language_on_F20()
{

  fn20 := GetKeyState("F20")

  if (fn20)
  {
    switch_language_main()
  }

}

ru_remap_through_custom(ob)
{

  Caps := GetKeyState("CapsLock","T")
  C    := GetKeyState("Ctrl")
  A    := GetKeyState("Alt")
  LS   := GetKeyState("LShift")
  RS   := GetKeyState("RShift")

  if (ob.LShift)
  {
    if (LS)
    {
      return ["{LShift UP}",ob.LShift,"{LShift DOWN}"]
    }
  }

  if (ob.RShift)
  {
    if (RS)
    {
      return ["{RShift UP}",ob.RShift,"{RShift DOWN}"]
    }
  }

  below := ob.below
  topo := ob.topo

  if (Caps)
  {
    tmp := ob.topo
    topo := ob.below
    below := tmp
  }

  if (C || A)
  {
    if (ob.en)
    {
      return ob.en
    }
  }


  if (LS || RS)
  {
    return topo
  }
  else
  {
    return below
  }
}

ru_X()
{

  ob := {}

  ob.topo := "{U+042E}" ;Ю
  ob.below := "{U+044E}" ;ю
  ob.en    := "x"

  20F  := GetKeyState("F20")

  if (20F)
  {
    switch_language_main()
    return ""
  }

  key := ru_remap_through_custom(ob)

  return key
}

fr_X()
{

  20F := GetKeyState("F20")

  if (20F)
  {
    switch_language_main()
    return ""
  }

  return "x"
}

ru_T()
{

  ob := {}

  ob.topo  := "{U+0422}" ;Т
  ob.below := "{U+0442}" ;т
  ob.en    := "t"

  key := ru_remap_through_custom(ob)

  return key
}


ru_I()
{
  ob := {}

  ob.topo  := "{U+0418}" ; И {U+0418}
  ob.below := "{U+0438}" ; и {U+0438}
  ob.en    := "i"

  key := ru_remap_through_custom(ob)

  return key
}

ru_C()
{

  ob := {}

  ob.topo := "{U+0427}" ; Ч U+0427
  ob.below := "{U+0447}" ; ч U+0447
  ob.en := "c"

  key := ru_remap_through_custom(ob)

  return key

}

ru_dot()
{

  large := "{U+042B}" ; Ы
  small := "{U+044B}" ; ы
  en := "."

  data := resolve_shift(small,en)

  if (data.S = 2)
  {
    toc := data.go_up . large
    return toc
  }

  if (data.S = 1)
  { 
    toc := data.go_up . data.topo
    return toc
  }
  else
  {
    toc := data.go_up . data.below
    return toc
  }
}

ru_remap_through_custom_with_number(en,small,large,num)
{

  RS   := GetKeyState("RShift")
  LS   := GetKeyState("LShift")
  Caps := GetKeyState("CapsLock","T")
  C    := GetKeyState("Ctrl")
  A    := GetKeyState("Alt")

  if (C || A)
  {
    return en
  }

  if (LS)
  {
    co := ["{LShift UP}",num,"{LShift DOWN}"]

    return co
  }


  if (Caps)
  {
    if (RS)
    {
      return small
    }
    else
    {
      return large
    }
  }
  else
  {
    if (RS)
    {
      return large
    }
    else
    {
      return small
    }
  }
}

ru_H()
{

  small := "{U+0445}" ; х {U+0445}
  large := "{U+0425}" ; Х {U+0425}
  en := "h"
  num := 0

  key := ru_remap_through_custom_with_number(en,small,large,num)

  return key

}

; ---------------------------

ru_NN()
{

  ob := {}

  ob.topo := "{U+0419}" ; Й
  ob.below := "{U+0439}" ; й

  key := ru_remap_through_custom(ob)

  return key

}

; ---------------------------

ru_N()
{

  small := "{U+043D}" ; н {U+043D}
  large := "{U+041D}" ; Н {U+041D}
  en := "n"
  num := 1

  key := ru_remap_through_custom_with_number(en,small,large,num)

  return key
}

ru_remap3(en,below,topo)
{

  dual.combo("")

  C := GetKeyState("Ctrl")
  A := GetKeyState("Alt")

  if (C || A)
  {
    SendInput {Blind}%en%
    return
  }

  S := GetKeyState("Shift")
  CL := GetKeyState("CapsLock","T")

  if (CL)
  { 
    tmp := topo
    topo := below
    below := tmp
  }

  if (S)
  {
    dual.SendInput(topo)
  }
  else
  {
    dual.SendInput(below)
  }
}

ru_A()
{
  small := "{U+0430}" ; а {U+0430}
  large := "{U+0410}" ; А {U+0410}
  en := "a"
  num := 2

  key := ru_remap_through_custom_with_number(en,small,large,num)

  return key
}

ru_O()
{

  small := "{U+043E}" ; о {U+043E}
  large := "{U+041E}" ; О {U+041E}
  en := "o"
  num := 3

  key := ru_remap_through_custom_with_number(en,small,large,num)

  return key

}

fr_remap2(en,num)
{

  dual.combo("")

  LS := GetKeyState("RShift")

  if (LS)
  {

    tos := "{RShift UP}{" . num . "}{RShift DOWN}"

    SendInput %tos%

  }
  else
  {
    SendInput {Blind}%en%
  }
}

fr_remap2_for_custom(en,num)
{

  RS := GetKeyState("RShift")

  if (RS)
  {
    return ["{RShift UP}",num,"{RShift DOWN}"]
  }
  else
  {
    return en
  }
}

ru_remap4(en,below,topo,num)
{

  dual.combo("")

  C   := GetKeyState("Ctrl")
  LA  := GetKeyState("LAlt")
  RA  := GetKeyState("RAlt")

  RS  := GetKeyState("RShift")
  LS  := GetKeyState("LShift")
  CL  := GetKeyState("CapsLock","T")


  if (C || LA || RA)
  {
    SendInput {Blind}%en%
    return
  }

  if (CL)
  {
    tmp := topo
    topo := below
    below := tmp
  }

  if (LS)
  {
    toc := "{LShift UP}" . num
    SendInput %toc%
    return
  }

  if (RS)
  {
    SendInput %topo%
  }
  else
  {
    SendInput %below%
  }
}

ru_number(num,symbol)
{

  dual.combo("")

  data := resolve_shift(num,symbol)

  if(data.S)
  {
    tos := data.go_up . data.topo
    SendInput %tos%
  }
  else
  {

    tos := data.below
    ; tos := data.below
    SendInput %tos%
  }
}


fn_row(sym,num)
{

  dual.combo("")

  CL  := GetKeyState("CapsLock","T")

  if (CL)
  {
    Dual.SendInput(num)
  }
  else
  {
    SendInput %sym%
  }
}

switch_language_main()
{

  JustToggled := true

  dual.reset()

  Toggle:=Mod(Toggle+1,4)

  switch Toggle
  {
    case 0:
      ; ToolTip, EN
      Menu, Tray, Icon, cono/old.png
    case 1:
      ; ToolTip, FR 1
      Menu, Tray, Icon, cono/fr_1.png
    case 2:
      ; ToolTip, FR 2
      Menu, Tray, Icon, cono/fr_2.png
    case 3:
      ; ToolTip, RU
      Menu, Tray, Icon, cono/rus.png

  }
  ; SetTimer, RemoveToolTip, 5000

 ; {
 ;  RemoveToolTip:
 ;    sleep 2000
 ;    ToolTip
 ;    return
 ; }
}

ru_E()
{

  fn21 := GetKeyState("F21")

  if (fn21 && Accent = 2)
  { 

    S := GetKeyState("Shift")

    L := GetKeyState("CapsLock","T")
    
    if (S && L)
    {
      return "{U+00EB}" ; ë U+00EB
    }
    else if (L || S)
    {
      return "{U+00CB}" ; Ë U+00CB
    }
    else
    {
      return "{U+00EB}" ; ë U+00EB
    }
    return
  }
  return "e"
}

accent_letter(data)
{

  if (data.LShift)
  {

    LS := GetKeyState("LShift")

    if (LS)
    {
      return ["{LShift UP}",data.LShift,"{LShift DOWN}"]
    }

  }

  if (data.RShift)
  {

    LS := GetKeyState("RShift")

    if (LS)
    {
      return ["{RShift UP}",data.RShift,"{RShift DOWN}"]
    }

  }

  ks21 := GetKeyState("F21")
  
  L := GetKeyState("CapsLock","T")

  S := GetKeyState("Shift")

  if (ks21)
  {
    if (S && L)
    {
      cap := false
    }
    else if (S || L)
    {
      cap := true
    }
    else
    {
      cap := false
    }

    if(cap)
    {
      switch Accent
      {
        case 1:
          return data.single_quote.cap
        case 2:
          return data.double_quote.cap
        case 3:
          return data.grave.cap
        case 4:
          return data.hat.cap
        case 5:
          return data.tilda.cap
        default:
          return
      }
    }
    else
    {
      switch Accent
      {
        case 1:
          return data.single_quote.small
        case 2:
          return data.double_quote.small
        case 3:
          return data.grave.small
        case 4:
          return data.hat.small
        case 5:
          return data.tilda.small
        default:
          return
      }
    }

  }
  else
  { 
    if(L) ; capslock is on
    {
      if(S)
      {
        return data.small
      }
      else
      {
        return data.cap
      }
    }
    else
    {
      if(S)
      {
        return data.cap
      }
      else
      { 
        return data.small
      }
    }
  }
}

; ---------------------

U := {}

U.hat := {}

U.grave := {}

U.tilda := {}

U.single_quote := {}

U.double_quote := {}

U.small := "u"

U.cap := "U"

U.RShift := 7

U.tilda.small :=  "{U+0169}" ; ũ
U.tilda.cap :=  "{U+0168}" ;Ũ

U.grave.cap := "{U+00D9}" ; Ù
U.grave.small := "{U+00F9}" ; ù

U.single_quote.cap  := "{U+00DA}" ; Ú
U.single_quote.small  := "{U+00FA}" ; ú

U.hat.cap := "{U+00DB}" ; Û
U.hat.small := "{U+00FB}" ; û

U.double_quote.cap := "{U+00DC}" ; Ü
U.double_quote.small := "{U+00FC}" ; ü

Loc.U := U

; ---------------------

fr_U()
{
  dual.combo("")

  key := accent_letter(Loc.U)

  my_send(key)
}

; ---------------------------

single_qoute_accent()
{
  dual.combine("F21","'",false,{F20:["'","'","Left"]})
  Accent := 1
}

double_quote_accent(RSH)
{
  dual.combine("F21","""",false,{F20:["""","""","Left"],RShift:RSH})
  Accent := 2
}

grave_accent()
{
  dual.combine("F21","``",false)
  Accent := 3
}

hat_accent()
{
  dual.combine("F21","{^}")
  Accent := 4
}

tilda_accent()
{
  dual.combine("F21","~",false)
  Accent := 5
}


; ---------------------

I := {}

I.hat := {}

I.tilda := {}

I.grave := {}

I.single_quote := {}

I.double_quote := {}

I.small := "i"

I.cap := "I"

I.RShift := ")"

I.tilda.cap := "{U+0128}" ; Ĩ

I.tilda.small := "{U+0129}" ; ĩ

I.grave.cap := "{U+00CC}" ; Ì
I.grave.small := "{U+00EC}" ; ì

I.single_quote.cap := "{U+00CD}" ; Í
I.single_quote.small := "{U+00ED}" ; í

I.hat.cap := "{U+00CE}" ; Î
I.hat.small := "{U+00EE}" ; î

I.double_quote.cap := "{U+00CF}" ; Ï
I.double_quote.small := "{U+00EF}" ; ï

Loc.I := I

fr_I()
{
  return accent_letter(Loc.I)
}

; ---------------------------

C := {}

C.single_quote := {}

C.RShift := ":"

C.small := "c"

C.cap := "C"


C.single_quote.cap := "{U+00C7}" ; Ç

C.single_quote.small := "{U+00E7}" ; ç

Loc.C := C

; ---------------------------

fr_C()
{
  key := accent_letter(Loc.C)

  return key
}

fr_H()
{
  return fr_remap2_for_custom("h",0) ; 0
}

; --------------------------

N := {}

N.tilda := {}

N.small := "n"

N.cap := "N"

N.RShift :=  1

N.tilda.small := "{U+00F1}" ; ñ

N.tilda.cap := "{U+0147}" ; Ň

Loc.N := N

; --------------------------

fr_N()
{

  key := accent_letter(Loc.N)

  return key
}

; ---------------------

A := {}

A.hat := {}

A.grave := {}

A.tilda := {}

A.single_quote := {}

A.double_quote := {}

A.small := "a"

A.cap := "A"

A.RShift :=  2

A.tilda.small :=  "{U+00E3}" ; ã

A.tilda.cap := "{U+00C3}" ; Ã

A.single_quote.cap := "{U+00C1}" ; Á

A.single_quote.small := "{U+00E1}" ; á

A.grave.cap := "{U+00C0}" ; À

A.grave.small := "{U+00E0}" ; à

A.hat.cap := "{U+00C2}" ; Â

A.hat.small := "{U+00E2}" ; â

A.double_quote.cap := "{U+00C4}" ; Ä

A.double_quote.small := "{U+00E4}" ; ä

Loc.A := A

fr_A()
{
  return accent_letter(Loc.A)
}

O := {}

O.small := "o"

O.cap := "O"

O.hat := {}

O.tilda := {}

O.grave := {}

O.single_quote := {}

O.double_quote := {}

O.tilda.small := "{U+00F5}" ; õ

O.tilda.cap := "{U+00D5}" ; Õ

O.RShift := 3

O.grave.cap := "{U+00D2}" ; Ò
O.grave.small := "{U+00F2}" ; ò

O.single_quote.cap := "{U+00D3}" ; Ó
O.single_quote.small := "{U+00F3}" ; ó

O.hat.cap := "{U+00D4}" ; Ô
O.hat.small := "{U+00F4}" ; ô

O.double_quote.cap := "{U+00D6}" ; Ö
O.double_quote.small := "{U+00F6}" ; ö

Loc.O := O

fr_O()
{

  key := accent_letter(Loc.O)

  my_send(key)

}
; ---------------------

E := {}

E.hat := {}

E.grave := {}

E.single_quote := {}

E.double_quote := {}

E.cap := "E"

E.small :=  "e"

E.RShift := "="

E.hat.cap := "{U+00CA}" ; Ê

E.hat.small := "{U+00EA}" ; ê

E.grave.cap := "{U+00C8}" ; È

E.grave.small := "{U+00E8}" ; è

E.single_quote.cap := "{U+00C9}" ; É

E.single_quote.small := "{U+00E9}" ; é

E.double_quote.cap := "{U+00CB}" ; Ë

E.double_quote.small := "{U+00EB}" ; ë

Loc.E := E

; ---------------------

fr_E()
{

  key := accent_letter(Loc.E)

  return key
}


fr_EE()
{

  ob := {}

  ob.topo := "{U+00C9}" ; É
  ob.below := "{U+00E9}" ; é
  ob.en := "é"

  ob.RShift := "?"

  key := ru_remap_through_custom(ob)

  my_send(key)

}
