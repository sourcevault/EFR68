; loc stands for local

global Loc := {}

global Accent := 0

global Toggle := 0

global JustToggled := false

Menu, Tray, Icon, cono/fr_1.png

my_send(key)
{
  as_list := Dual.subKeySet(key)

  for index, subKey in as_list {
    Dual.sendInternal(subKey)
  }
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


  if (ob.F21)
  {

    ks21 := GetKeyState("F21")

    ; dmp(ks21,Accent,ob.F21,Accent)

    if (ks21 && ob.F21[1] = Accent)
    {
      below := ob.F21[2]
      topo  := ob.F21[3]

      if (Caps)
      {
        tmp := topo
        topo := ob.below
        below := tmp
      }

      if (LS)
      {
        return topo
      }

      return below
    }
  }

  if (ob.F20)
  {

    ks20 := GetKeyState("F20")

    if (ks20)
    {
      return ob.F20
    }
  }

  if (ob.LShift != "")
  {
    if (LS)
    {
      return ["{LShift UP}",ob.LShift,"{LShift DOWN}"]
    }
  }

  if (ob.RShift != "")
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

ru_I()
{
  ob := {}

  ob.topo   := "{U+0418}" ; И {U+0418}
  ob.below  := "{U+0438}" ; и {U+0438}
  ob.en     := "i"
  ob.RShift := ")"

  ob.F21 := [2,"{U+0439}","{U+0419}"] ;"{U+0439}" ; й "{U+0419}" ; Й

  key := ru_remap_through_custom(ob)

  return key
}

ru_C()
{

  ob := {}

  ob.topo := "{U+0427}" ; Ч U+0427
  ob.below := "{U+0447}" ; ч U+0447
  ob.en := "c"
  ob.RShift := ":"

  key := ru_remap_through_custom(ob)

  return key

}

ru_four_symbols(ob)
{

  en := ob.en
  small := ob.small
  large := ob.large
  sym := ob.sym

  dual.combo("")

  if (ob.F20)
  {
    ks20 := GetKeyState("F20")

    if (ks20)
    {
      return ob.F20
    }

  }

  C := GetKeyState("Ctrl")
  A := GetKeyState("Alt")
  LS := GetKeyState("LShift")
  RS := GetKeyState("RShift")
  CL := GetKeyState("CapsLock","T")

  if (CL)
  {
    if (RS)
    {
      below := en
    }
    else
    {
      below := sym
    }
  }
  else
  {
    if (RS)
    {
      below := sym
    }
    else
    {
      below := en
    }
  }

  if (C || A)
  {
    return below
  }

  if (CL)
  {
    if (LS && RS)
    {
      return ["{LShift UP}","{RShift UP}",en,"{LShift DOWN}","{RShift DOWN}"]
    }
    else if (RS)
    {
      return sym
    }
    else if (LS)
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
    if (LS && RS)
    {
      return large
    }
    if (LS)
    {
      return small
    }
    else
    {
      return below
    }
  }

}


ru_comma()
{
  ob := {}

  ob.en    := ","
  ob.small := "{U+044C}" ; ь
  ob.large := "{U+042C}" ; Ь
  ob.sym   := "{U+042C}" ; Ь

  dual.combo("")

  key := ru_four_symbols(ob)

  return key
}

ru_underscore()
{

  ob := {}

  ob.en    := "_"
  ob.small := "{U+0449}" ; щ
  ob.large := "{U+0429}" ; Щ
  ob.sym   := ["{RShift UP}","{|}","{RShift DOWN}"]

  key := ru_four_symbols(ob)

  my_send(key)
}

ru_dot()
{

  ob := {}

  ob.en    := "."
  ob.small := "{U+044B}" ; ы
  ob.large := "{U+042B}" ; Ы
  ob.sym   := ["{RShift UP}","{-}","{RShift DOWN}"]

  key := ru_four_symbols(ob)

  my_send(key)
}

ru_H()
{

  ob := {}

  ob.en := "h"
  ob.RShift := "0"
  ob.below := "{U+0445}" ; х {U+0445}
  ob.topo := "{U+0425}" ; Х {U+0425}

  key := ru_remap_through_custom(ob)

  my_send(key)
}

; ---------------------------

ru_N()
{

  ob := {}
  ob.RShift := 1
  ob.below := "{U+043D}" ; н {U+043D}
  ob.topo := "{U+041D}" ; Н {U+041D}
  ob.en := "n"

  key := ru_remap_through_custom(ob)

  return key
}

ru_A()
{

  ob := {}
  ob.below := "{U+0430}" ; а {U+0430}
  ob.topo := "{U+0410}" ; А {U+0410}
  ob.en := "a"
  ob.RShift := 2

  key := ru_remap_through_custom(ob)

  return key
}

ru_O()
{

  ob := {}

  ob.below := "{U+043E}" ; о {U+043E}
  ob.topo := "{U+041E}" ; О {U+041E}
  ob.en := "o"
  ob.RShift := 3

  key := ru_remap_through_custom(ob)

  return key

}

fr_remap2(en,num)
{
  dual.combo("")

  LS := GetKeyState("RShift")

  if (LS)
  {

    tos := "{RShift UP}{" . num . "}{RShift DOWN}"

    Send %tos%

  }
  else
  {
    Send {Blind}%en%
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
    Send {Blind}%topo%
  }
  else
  {
    Send {Blind}%below%
  }
}

ru_remap4(en,below,topo,sym)
{

  dual.combo("")

  C   := GetKeyState("Ctrl")
  A  := GetKeyState("Alt")

  RS  := GetKeyState("RShift")
  LS  := GetKeyState("LShift")
  CL  := GetKeyState("CapsLock","T")

  if (CL)
  {
    if (RS)
    {
      bas := en
    }
    else
    {
      bas := sym
    }
  }
  else
  {
    if (RS)
    {
      bas := sym
    }
    else
    {
      bas := en
    }
  }

  if (C || A)
  {
    my_send(bas)
    return
  }

  if (CL)
  {
    tmp := topo
    topo := below
    below := tmp
  }

  if (RS)
  {
    toc := ["{RShift UP}",sym,"{RShift DOWN}"]
  }
  else if (LS)
  {
    toc := topo
  }
  else
  {
    toc := below
  }

  my_send(toc)
  return
}


fn_row(sym,num)
{

  dual.combo("")

  CL := GetKeyState("CapsLock","T")

  if (CL)
  {
    Dual.SendInput(num)
  }
  else
  {
    SendInput {Blind}%sym%
  }
}

switch_language_main()
{

  JustToggled := true

  dual.reset()

  Toggle:=Mod(Toggle+1,2)

  switch Toggle
  {
    case 0:
      ; ToolTip, EN
      Menu, Tray, Icon, cono/fr_1.png
    case 1:
      ; ToolTip, RU
      Menu, Tray, Icon, cono/rus.png
    case 2:
      ; ToolTip, FR 2
      Menu, Tray, Icon, cono/fr_2.png
    case 3:
      ; ToolTip, FR 1
      Menu, Tray, Icon, cono/fr_1.png

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


  if (ks21)
  {
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
    if (cap)
    {
      return data.cap
    }
    else
    {
      return data.small
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

U.cap := "{U+0055}" ; U

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


ru_EE()
{

  ob := {}

  ob.sym := ["{RShift UP}","/","{RShift DOWN}"]
  ob.small := "{U+044D}" ; э
  ob.large := "{U+042D}" ; Э
  ob.en := "\"

  key := ru_four_symbols(ob)

  return key

}

ru_B()
{

  ob := {}

  ob.below := "{U+0432}" ; в
  ob.topo := "{U+0412}" ; В
  ob.en := "b"

  key := ru_remap_through_custom(ob)

  return key
}


ru_blackslash() ; grave_accent
{

  key := ru_EE()

  my_send(key)

}

ru_single_quote_accent() ; Aigu Accent
{ 
  
  dual.combine("F21","",{doublePress:30},{RShift:"%",LShift:"&"})
  Accent := 1 
}

single_quote_accent(ob) ; Grave Accent
{ 
  ob.F20 := ["'","'","Left"]


  dual.combine("F21","'",{doublePress:40},ob)
  Accent := 1
}

double_quote_accent(ob) ; Diaeresis Accent
{

  dual.combine("F21","""",{doublePress:40},ob)
  Accent := 2
}

grave_accent(below,ob) ; Acute Accent
{
  dual.combine("F21",below,{doublePress:40},ob)
  Accent := 3
}

; backslash_accent(ob) ; Acute Accent
; {
;   dual.combine("F21","\",{doublePress:40},ob)
;   Accent := 3
; }

hat_accent() ; Circunflex Accent
{
  Accent := 4
  dual.combine("F21","{^}",{doublePress:40})
}

tilda_accent()
{
  Accent := 5
  dual.combine("F21","~",{doublePress:40})
}

; ---------------------

I := {}

I.hat := {}

I.tilda := {}

I.grave := {}

I.single_quote := {}

I.double_quote := {}

I.small := "i"

I.cap := "{U+0049}" ; I

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

C.small := "c" ; c

C.cap := "{U+0043}" ; C

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
  dual.combo("")

  key := fr_remap2_for_custom("h",0)

  my_send(key)
}

; --------------------------

N := {}

N.tilda := {}

N.small := "n"

N.cap := "{U+004E}" ; N

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

A.cap := "{U+0041}" ; A

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

O.cap := "{U+004F}" ; O

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

E.cap := "{U+0045}" ; {U+0045}

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

; ---------------------
