; loc stands for local

global Loc := {}

global Accent := 0

global Toggle := 0

global JustToggled := false

Menu, Tray, Icon, cono/old.png

ru_symbol_and_letter(sym,small,cap)
{

  dual.combo("")

  RS  := GetKeyState("RShift")
  LS  := GetKeyState("LShift")
  CL := GetKeyState("CapsLock","T")
  C  := GetKeyState("Ctrl")
  A  := GetKeyState("Alt")

  if (LS && RS)
  {
    SendInput {Blind}%cap%
  }
  else if (C || A)
  {
    dual.SendInput(sym)
  }
  else if (CL)
  {
    if (LS || RS)
    {
      dual.SendInput(small)
    }
    else
    {
      dual.SendInput(cap)
    }
  }
  else
  {
    if (LS || RS)
    {
      dual.SendInput(small)
    }
    else
    {
      dual.SendInput(sym)
    } 
  }
}

ru_number_symbol(num,symbol1,symbol2)
{
  dual.combo("")

  RS  := GetKeyState("RShift")
  LS  := GetKeyState("LShift")
  CL := GetKeyState("CapsLock","T")
  C  := GetKeyState("Ctrl")
  A  := GetKeyState("Alt")

  if (LS && RS)
  {

    Dual.SendInput(symbol2)

  }
  else if (C || A)
  {
    SendInput {Blind}%num%
  }
  else if (CL)
  {
    if (LS || RS)
    {
      dual.SendInput(symbol1)
    }
    else
    {
      dual.SendInput(num)
    }
  }
  else
  {
    if (LS || RS)
    {
      dual.SendInput(num)
    }
    else
    {
      dual.SendInput(symbol1)
    } 
  }

}

constant(below,topo)
{
  dual.comboKey(below,{Shift:topo})
}

ru_remap_internal(en,small,cap,data)
{

  data.Shift := cap

  data.CapsLock := cap

  data.LAlt := en

  data.LCtrl := en

  data.RCtrl := en

  data.RAlt := en

  data.CapsLockShift := small

  dual.comboKey(small,data)
}

ru_remap3_20fsilent(en,small,cap)
{
  data := {}

  data.F20 := ""

  ru_remap_internal(en,small,cap,data)
}

ru_remap3(en,small,cap)
{

  data := {}

  ru_remap_internal(en,small,cap,data)

}


fr_remap2(en,num)
{

  dual.combo("")

  RS := GetKeyState("RShift")
  LS := GetKeyState("LShift")
  CL := GetKeyState("CapsLock","T")

  if (CL)
  {
    SendInput {Blind}%en%
  }
  else
  {
    if (LS)
    {
      Dual.SendInput(num)
    }
    else
    {
      SendInput {Blind}%en%
    }
  }
}

ru_remap4(en,small,cap,num)
{

  dual.combo("")

  RS := GetKeyState("RShift")
  LS := GetKeyState("LShift")
  CL := GetKeyState("CapsLock","T")

  LC  := GetKeyState("LCtrl")
  LA  := GetKeyState("LAlt")

  RC  := GetKeyState("RCtrl")
  RA  := GetKeyState("RAlt")

  if (LC || LA || RC || RA)
  {
    SendInput {Blind}%en%
  }
  else if (CL)
  {
    if (RS || LS)
    {
      dual.SendInput(small)
    }
    else
    {
      dual.SendInput(cap)
    }
  }
  else
  {
    if (RS)
    {
      dual.SendInput(cap)
    }
    else if (LS)
    {
      dual.SendInput(num)
    }
    else
    {
      dual.SendInput(small)
    }
  }
}

ru_number(num,symbol)
{
  dual.combo("")

  LS := GetKeyState("LShift")
  RS := GetKeyState("RShift")

  CL := GetKeyState("CapsLock","T")
  C  := GetKeyState("Ctrl")
  A  := GetKeyState("Alt")

  if (C || A)
  {
    SendInput {Blind}%num%
  }
  else if (CL)
  {
    if (RS || LS)
    {
      dual.SendInput(symbol)
    }
    else
    {
      dual.SendInput(num)
    }
  }
  else
  {
    if (RS || LS)
    {
      dual.SendInput(num)
    }
    else
    {
      dual.SendInput(symbol)
    }
  }

}

switch_language_main()
{

  JustToggled := true

  dual.reset()

  Toggle:=Mod(Toggle+1,3)

  switch Toggle
  {
    case 0:
      ToolTip, EN - Left Alt (to exit)
      Menu, Tray, Icon, cono/old.png
    case 1:
      ToolTip, RU - pagedown (to exit)
      Menu, Tray, Icon, cono/rus.png
    case 2:
      ToolTip, FR - pagedown (to exit)
      Menu, Tray, Icon, cono/fr.png

  }
  SetTimer, RemoveToolTip, -5000

  RemoveToolTip:
    ToolTip
    return

}

key_to_switch_lang(char)
{

  dual.combo("")

  S := GetKeyState("Shift")

  if (S)
  {
    Dual.SendInput(char)
  }
  else
  {
    switch_language_main()
  }

}

switch_language_on_F20_with_modifier()
{

  currentKey := A_ThisHotkey

  is_up := (SubStr(currentKey, -1) = "UP")

  if (!is_up)
  {
    return
  }

  fn20 := GetKeyState("F20")

  if (fn20)
  {
    switch_language_main()
  }

  return

}

switch_language_on_F20()
{

  fn20 := GetKeyState("F20")

  if (fn20)
  {
    switch_language_main()
  }

}

switch_language()
{

  currentKey := A_ThisHotkey

  is_up := (SubStr(currentKey, -1) = "UP")

  if (!is_up)
  {
    return
  }

  switch_language_on_F20()

}

ru_e()
{

  currentKey := A_ThisHotkey

  is_up := (SubStr(currentKey, -1) = "UP")

  if (!is_up)
  {
    return 1
  }

  fn21 := GetKeyState("F21")

  if (fn21 && Accent = 2)
  { 

    S := GetKeyState("Shift")

    L := GetKeyState("CapsLock","T")
    
    if (S && L)
    {
      dual.SendInput("{U+00EB}") ; ë U+00EB
    }
    else if (L || S)
    {
      dual.SendInput("{U+00CB}") ; Ë U+00CB
    }
    else
    {
      dual.SendInput("{U+00EB}") ; ë U+00EB
    }
    return
  }
  return
}

accent_letter(data)
{

  if (data.LShift)
  {

    LS := GetKeyState("LShift")

    if (LS)
    {
      dual.SendInput(data.LShift)
      return
    }

  }

  ks21 := GetKeyState("F21")
  
  L := GetKeyState("CapsLock","T")

  RS := GetKeyState("RShift")

  if (ks21)
  {
    if (RS && L)
    {
      cap := false
    }
    else if (RS || L)
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
          dual.SendInput(data.single_quote.cap)
        case 2:
          dual.SendInput(data.double_quote.cap)
        case 3:
          dual.SendInput(data.grave.cap)
        case 4:
          dual.SendInput(data.hat.cap)
        default:
          return
      }
    }
    else
    {
      switch Accent
      {
        case 1:
          dual.SendInput(data.single_quote.small)
        case 2:
          dual.SendInput(data.double_quote.small)
        case 3:
          dual.SendInput(data.grave.small)
        case 4:
          dual.SendInput(data.hat.small)
        default:
          return
      }
    }

  }
  else
  { 
    if(L) ; capslock is on
    {
      if(RS)
      {
        dual.SendInput(data.small)
      }
      else
      {
        dual.SendInput(data.cap)
      }
    }
    else
    {
      if(RS)
      {
        dual.SendInput(data.cap)
      }
      else
      {
        ds := data.small
        SendInput {Blind}%ds%
      }
    }
  }

  return
}

accent_letter_with_mod(data)
{

  currentKey := A_ThisHotkey

  is_up := (SubStr(currentKey, -1) = "UP")

  if (!is_up)
  {
    return 1
  }

  accent_letter(data)

}


my_combine(data)
{ 
  dual.combine(data.mod,data.letter,data.setting,data.combinator)
}

ru_H()
{


  letter := "{U+0445}" ; х {U+0445}

  combinator := {}

  combinator.LShift := ["{Shift UP}",0]

  combinator.RShift := "{U+0425}" ; Х {U+0425}

  combinator.CapsLock := "{U+0425}" ; Х {U+0425}

  combinator.Alt := "h"

  combinator.Ctrl := "h"

  combinator.CapsLockShift := "{U+0445}" ; х {U+0445}
  
  setting := {}

  setting.doublePress := 70

  setting.timeout := 100

  dual.combine("RAlt",letter,setting,combinator)

}

ru_N()
{

  combinator := {}

  letter := "{U+043D}" ; н {U+043D}

  combinator.LShift := ["{Shift UP}",1]

  combinator.RShift := "{U+041D}" ; Н {U+041D}

  combinator.CapsLock := "{U+041D}" ; Н {U+041D}

  combinator.Alt := "n"

  combinator.Ctrl := "n"

  combinator.CapsLockShift := "{U+043D}" ; н {U+043D}
  
  setting := {}

  setting.doublePress := 70

  setting.timeout := 100

  dual.combine("F20",letter,setting,combinator)

}

ru_A()
{

  combinator := {}

  letter := "{U+0430}" ; а {U+0430}

  combinator.LShift := ["{Shift UP}",2]

  combinator.RShift := "{U+0410}" ; А {U+0410}

  combinator.CapsLock := "{U+0410}" ; А {U+0410}

  combinator.Alt := "a"

  combinator.Ctrl := "a"

  combinator.CapsLockShift := "{U+0430}" ; а {U+0430}
  
  setting := {}

  setting.doublePress := 70

  setting.timeout := 100

  dual.combine("Ctrl",letter,setting,combinator)

}

ru_O()
{
  combinator := {}

  letter := "{U+043E}" ; о {U+043E}

  combinator.LShift := ["{Shift UP}",3]

  combinator.RShift := "{U+041E}" ; О {U+041E}

  combinator.CapsLock := "{U+041E}" ; О {U+041E}

  combinator.Alt := "o"

  combinator.Ctrl := "o"

  combinator.CapsLockShift := "{U+043E}" ; о {U+043E}
  
  setting := {}

  setting.doublePress := 70

  setting.timeout := 100

  dual.combine("LAlt",letter,setting,combinator)
}

fr_h()
{
  letter := "h"

  combinator := {}

  combinator.LShift := ["{Shift Up}",0]

  combinator.CapsLockShift := "h"

  setting := {}

  setting.doublePress := 70

  dual.combine("RAlt",letter,setting,combinator)

}

fr_j()
{
  letter := "n"

  combinator := {}

  combinator.LShift := ["{Shift Up}",1]

  combinator.CapsLockShift := "n"

  setting := {}

  setting.doublePress := 70

  dual.combine("F20",letter,setting,combinator)
}
combine_accent(symbol,num)
{
  dual.combine("F21",symbol)
  Accent := num
}

combine_accent_symbol(symbol1,num,symbol2)
{
  dual.combine("F21",symbol1,{Shift:symbol2})
  Accent := num
}

single_qoute_accent()
{
  dual.combine("F21","'",false,{F20:["'","'","Left"]})
  Accent := 1
}

double_qoute_accent()
{
  dual.combine("F21","""",false,{F20:["""","""","Left"]})
  Accent := 2
}

grave_accent()
{
  dual.combine("F21","``")
  Accent := 3
}

hat_accent()
{
  dual.combine("F21","{^}")
  Accent := 4
}

; ---------------------------

RU_T := {}

RU_T.mod := "LAlt"

RU_T.letter := "{U+0442}" ; т {U+0442}

RU_T.setting := false

combinator := {}

combinator.Shift := "{U+0422}" ; Т {U+0422}

combinator.CapsLock := "{U+0422}" ; Т {U+0422}

combinator.LAlt := "t"

combinator.RAlt := "t"

combinator.Ctrl := "t"

combinator.CapsLockShift := "{U+0442}" ; т {U+0442}

RU_T.combinator := combinator

Loc.RU_T := RU_T

; ---------------------------

RU_I := {}

RU_I.mod := "Ctrl"

RU_I.letter := "{U+0438}" ; и {U+0438}

RU_I.setting := false

combinator := {}

combinator.Shift := "{U+0418}" ; И {U+0418}

combinator.CapsLock := "{U+0418}" ; И {U+0418}

combinator.LAlt := "i"

combinator.RAlt := "i"

combinator.Ctrl := "i"

combinator.CapsLockShift := "{U+0438}" ; {U+0438}

RU_I.combinator := combinator

Loc.RU_I := RU_I

; ---------------------------

RU_C := {}

RU_C.mod := "RShift"

RU_C.letter := "{U+0447}" ; ч U+0447

RU_C.setting := false

combinator := {}

combinator.Shift := "{U+0427}" ; Ч U+0427

combinator.CapsLock := "{U+0427}" ; Ч U+0427

combinator.LAlt := "c"

combinator.RAlt := "c"

combinator.Ctrl := "c"

combinator.CapsLockShift := "{U+0447}" ; ч U+0447

RU_C.combinator := combinator

Loc.RU_C := RU_C

; ---------------------------

RU_dot := {}

RU_dot.mod := "RAlt"

RU_dot.letter := "." 

RU_dot.setting := {delay:70,doublePress:70,timeout:400}

combinator := {}

combinator.Shift := "{U+0427}" ; Ы ; {U+042B}

combinator.CapsLock := "."

combinator.LAlt := "."

combinator.RAlt := "."

combinator.Ctrl := "."

combinator.CapsLockShift := "."

RU_dot.combinator := combinator

Loc.RU_dot := RU_dot

; ---------------------------

V := {}

V.mod := "LShift"

V.letter := "{U+0431}" ; б U+0431

V.setting := false

combinator := {}

combinator.Shift := "{U+0411}" ; Б U+0411

combinator.CapsLock := "{U+0411}" ; Б

combinator.LAlt := ["v"]

combinator.LCtrl := ["v"]

combinator.RAlt := ["v"]

combinator.RCtrl := ["v"]

combinator.CapsLockShift := "{U+0431}" ; б U+0431

V.combinator := combinator

Loc.V := V

; ---------------------------

H := {}

H.mod := "LAlt"

H.letter := "h"

H.setting := false

combinator := {}

combinator.LShift := [0]

combinator.RShift := "H"

Loc.H := H

; ---------------------------

NN := {}

NN.mod := "F20"

NN.letter := "{U+0439}" ; й U+0439

NN.setting := false

combinator := {}

combinator.Shift := "{U+0419}" ; Й U+0419

combinator.CapsLock := "{U+0419}" ; Й

combinator.CapsLockShift := "{U+0439}" ; й

NN.combinator := combinator

Loc.NN := NN

; ---------------------------

N := {}

N.letter := "{U+0438}" ; и U+0438

N.setting := false

combinator := {}

combinator.LCtrl := "n"

combinator.RCtrl := "n"

combinator.LAlt := "n"

combinator.RAlt := "n"

combinator.Shift := "{U+0418}" ; И U+0418

combinator.F20 := 1

combinator.CapsLock := "{U+0418}" ; И

combinator.CapsLockShift := "{U+0438}" ; и

N.combinator := combinator

Loc.N := N

; ---------------------------

EE := {}

EE.mod := "F20"

EE.letter := "{U+00E9}" ; é U+00E9

EE.setting := false

combinator := {}

combinator.Shift := "{U+00C9}" ; É U+00C9

combinator.CapsLock := "{U+00C9}" ; É

combinator.CapsLockShift := "{U+00E9}" ; é

EE.combinator := combinator

Loc.EE := EE

; ---------------------------

E := {}

E.hat := {}

E.grave := {}

E.single_quote := {}

E.double_quote := {}

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

A := {}

A.hat := {}

A.grave := {}

A.single_quote := {}

A.double_quote := {}

A.small := "a"

A.cap := "A"

A.LShift := 2

A.single_quote.cap := "{U+00C1}" ; Á

A.single_quote.small := "{U+00E1}" ; á

A.grave.cap := "{U+00C0}" ; À

A.grave.small := "{U+00E0}" ; à

A.hat.cap := "{U+00C2}" ; Â

A.hat.small := "{U+00E2}" ; â

A.double_quote.cap := "{U+00C4}" ; Ä

A.double_quote.small := "{U+00E4}" ; ä

Loc.A := A

; ---------------------

I := {}

I.hat := {}

I.grave := {}

I.single_quote := {}

I.double_quote := {}

I.small := "i"

I.cap := "I"

I.grave.cap := "{U+00CC}" ; Ì
I.grave.small := "{U+00EC}" ; ì

I.single_quote.cap := "{U+00CD}" ; Í
I.single_quote.small := "{U+00ED}" ; í

I.hat.cap := "{U+00CE}" ; Î
I.hat.small := "{U+00EE}" ; î

I.double_quote.cap := "{U+00CF}" ; Ï
I.double_quote.small := "{U+00EF}" ; ï

Loc.I := I

; ---------------------

O := {}

O.hat := {}

O.grave := {}

O.single_quote := {}

O.double_quote := {}

O.LShift := 3

O.small := "o"

O.cap := "O"

O.grave.cap := "{U+00D2}" ; Ò
O.grave.small := "{U+00F2}" ; ò

O.single_quote.cap := "{U+00D3}" ; Ó
O.single_quote.small := "{U+00F3}" ; ó

O.hat.cap := "{U+00D4}" ; Ô
O.hat.small := "{U+00F4}" ; ô

O.double_quote.cap := "{U+00D6}" ; Ö
O.double_quote.small := "{U+00F6}" ; ö

Loc.O := O

; ---------------------

U := {}

U.hat := {}

U.grave := {}

U.single_quote := {}

U.double_quote := {}

U.small := "u"

U.cap := "U"

U.LShift := 7

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

C := {}

C.single_quote := {}

C.small := "c"

C.cap := "C"

C.single_quote.cap := "{U+00C7}" ; Ç

C.single_quote.small := "{U+00E7}" ; ç

Loc.C := C

; ---------------------------

