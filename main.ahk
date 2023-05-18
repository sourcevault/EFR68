SendLevel 3
#InputLevel 3

#NoEnv
#SingleInstance force

SendMode Input

#Include <dual/dual>

dual := new Dual({delay: 70, timeout: 300, doublePress: 200, specificDelays: false})

#Include loc.ahk

#Include <dual/defaults>

#If true ; Override defaults.ahk. There will be "duplicate hotkey" errors otherwise.

*F12::dual.reset()

; ------------------French -----------------

*F1::
  dual.combo("")
  SendInput {Ctrl DOWN}
  SendInput {U+00E9}{Ctrl UP}
  return

#if (Toggle=0) ; French Version 5
{
  *=::
  *= UP::grave_accent("CapsLock",{LShift:"{U+0060}"}) ; ` {U+0060}

  *1::fn_row("{F1}",1)

  *2::fn_row("{PgUp}",2)

  *3::fn_row("{PgDn}",3)

  *4::fn_row("{F4}",4)

  *5::fn_row("{F5}",5)

  *6::fn_row("{F6}",6)

  *7::fn_row("{F7}",7)

  *8::fn_row("{F8}",8)

  *9::fn_row("{F9}",9)

  *0::fn_row("{F10}",0)

  *-::dual.comboKey("F11")

  ; ; -----------------------

  *Tab::
  *Tab UP::single_quote_accent({RShift:"%",LShift:"&"})

  *q::dual.comboKey("z",{RShift:"!"})

  *w::dual.comboKey("up")

  *e::dual.comboKey("down")

  ; ;-------------------------

  *r::dual.comboKey("v",{RShift:"$"})

  *t::dual.comboKey("x",{RShift:"@"})

  *CapsLock::dual.comboKey("b",{RShift:["{RShift UP}","[","{RShift DOWN}"]})

  *a::dual.comboKey("s",{RShift:["{RShift UP}","]","{RShift DOWN}"]})

  *s::
  *s UP::dual.combine("Ctrl","t",{doublePress:70},{RShift:"("})

  *d::
  *d UP::dual.combine("RShift","",{doublePress:70},{custom:Func("fr_I")})

  *f::
  *f UP::dual.combine("RAlt","",{doublePress:30},{custom:Func("fr_C")})

  ; "d",false,{RShift:["{RShift UP}","-","{RShift DOWN}"]}

  *g::dual.comboKey("d",{RShift:"#"})

  ; ; -------------------------

  *LShift::
  *LShift UP::double_quote_accent({RShift:"<",LShift:"?"})

  *z::dual.comboKey("g",{RShift:">"})

  *x::dual.comboKey("m",{RShift:"{"})

  *c::dual.comboKey("l",{RShift:"}"})

  *v::dual.comboKey(".",{RShift:["{RShift UP}","-","{RShift DOWN}"]})

  *b::dual.comboKey("k",{RShift:"{U+003B}"})

  ; ;-------------------------

  *`::
  *` UP::hat_accent()

  *F8::
  *F8 UP::tilda_accent()

  *left::switch_language_main()

  *right::dual.comboKey("j",{RShift:["{RShift UP}","+","{RShift DOWN}"]})

  ; ;-------------------------

  *y::dual.comboKey("\",{RShift:["{RShift UP}","/","{RShift DOWN}"]})

  *u::dual.comboKey("home")
  *i::dual.comboKey("left")
  *o::dual.comboKey("right")
  *p::dual.comboKey("end")

  *\::dual.comboKey("F12")

  *h::fr_H()

  *j::
  *j UP::dual.combine("RAlt","",{doublePress:30},{custom:Func("fr_N")})

  *k::
  *k UP::dual.combine("RShift","",{doublePress:30},{custom:Func("fr_A")})

  *l::
  *l UP::dual.combine("Ctrl","",{doublePress:30},{custom:Func("fr_O")})

  *;::fr_remap2("r",4)

  *'::fr_remap2("p",5)

  *n::dual.comboKey("_",{RShift:"|"})

  *m::fr_remap2("f",6)

  *,::fr_U()

  *.::fr_remap2(",",8)

  */::fr_remap2("y",9)

  ; ;-------------------------

  *RShift::dual.comboKey("w",{RShift:"*"})

   ; ;------------------------

  *up::dual.comboKey("q")

  *down::dual.comboKey("F15")

  *[::dual.comboKey("F16")

  *]::dual.comboKey("F17")

   ; ;-------------------------

   ; LEFT THUMB CLUSTER (COPIED)

  *Backspace::
  *Backspace UP::dual.combine("Ctrl","Backspace",{doublePress:250})

  *Delete::
  *Delete UP::dual.combine("LShift","Tab")

  *LCtrl::
  *LCtrl UP::dual.combine("RShift","Enter",{doublePress:250})

   ; ;-------------------------

  *LAlt::dual.comboKey("F13")

  *Home::
  *Home UP::dual.combine("F20","F2",{doublePress:30})

    ; if (JustToggled)
    ; {
    ;   JustToggled := false
    ;   SendInput {F20 up}
    ; }
    ; else
    ; {
    ; }

  *End::dual.comboKey("Delete")

   ; RIGHT THUMB CLUSTER

  *RCtrl::
  *RCtrl Up::dual.combine("Ctrl","{Esc}",{doublePress:70})

  *Enter::
  *Enter UP::dual.combine("LAlt","",{doublePress:70},{custom:Func("fr_E")})


  *PgUp::
  *PgUp UP::
    dual.combine("F20","F3",{doublePress:40})
    return


  *PgDn::dual.comboKey("F14")


    ; if (JustToggled)
    ; {
    ;   JustToggled := false
    ;   SendInput {F20 up}
    ; }
    ; else
    ; {
    ; }


  *Space::
  *Space UP::dual.combine("LShift","Space")
}



#if (Toggle=1) ; RU
{

  *=::dual.comboKey("CapsLock",{LShift:"{U+0060}",RShift:"{U+2116}"}) ; ` {U+0060}

  *1::fn_row("{F1}",1)

  *2::fn_row("{PgUp}",2)

  *3::fn_row("{PgDn}",3)

  *4::fn_row("{F4}",4)

  *5::fn_row("{F5}",5)

  *6::fn_row("{F6}",6)

  *7::fn_row("{F7}",7)

  *8::fn_row("{F8}",8)

  *9::fn_row("{F9}",9)

  *0::fn_row("{F10}",0)

  *-::dual.comboKey("F11")

  ; ; -----------------------

  *Tab::
  *Tab UP::ru_single_quote_accent()

  *q::ru_remap4("z","{U+0437}","{U+0417}","!") ; з ; З

  *w::dual.comboKey("up")

  *e::dual.comboKey("down")

  ; ;-------------------------

  *r::ru_remap4("v","{U+0431}","{U+0411}","$") ; б U+0431 ;Б U+0411

  *t::ru_remap4("x","{U+044E}","{U+042E}","@") ; "x" "{U+044E}" ю "{U+042E}" Ю

  *CapsLock::ru_remap4("b","{U+0432}","{U+0412}","{U+005B}") ; в ; В ; {U+0432} ; {U+0412}

  *a::ru_remap4("s","{U+0441}","{U+0421}","{U+005D}") ; с ; С

  *s::ru_remap4("t","{U+0442}","{U+0422}","(") ;т  ;Т

  *d::
  *d UP::dual.combine("RShift","",{doublePress:70},{custom:Func("ru_I")})

  *f::
  *f UP::dual.combine("RAlt","",{doublePress:30},{custom:Func("ru_C")})

  *g::ru_remap4("d","{U+0434}","{U+0414}","{#}") ; д ; Д

  ; ; -------------------------

  *LShift::
  *LShift UP::double_quote_accent({RShift:"<",LShift:"?"})

  *z::ru_remap4("g","{U+0433}","{U+0413}",">") ; г ; Г

  *x::ru_remap4("m","{U+043C}","{U+041C}","{") ; м ; М

  *c::ru_remap4("l","{U+043B}","{U+041B}","}") ; л ; Л

  *v::ru_dot()

  *b::ru_remap4("k","{U+043A}","{U+041A}","{;}") ; к ; К

  ; ;-------------------------

  *`::
  *` UP::hat_accent()

  *F8::
  *F8 UP::tilda_accent()

  *left::switch_language_main()

  *right::ru_remap4("j","{U+0436}","{U+0416}","+") ; ж {U+0436} ; Ж {U+0416}

  ; ;-------------------------

  *y::ru_blackslash()

  *u::dual.comboKey("home")
  *i::dual.comboKey("left")
  *o::dual.comboKey("right")
  *p::dual.comboKey("end")


  *\::dual.comboKey("F12")

  *h::ru_H()

  *j::
  *j UP::dual.combine("RAlt","",{doublePress:30},{custom:Func("ru_N")})

  *k::
  *k UP::dual.combine("RShift","",{doublePress:30},{custom:Func("ru_A")})

  *l::
  *l UP::dual.combine("Ctrl","",{doublePress:30},{custom:Func("ru_O")})

  *;::ru_remap4("r","{U+0440}","{U+0420}",4) ; р {U+0440} ; Р {U+0420}

  *'::ru_remap4("p","{U+043F}","{U+041F}",5) ; п {U+043F} ; П {U+041F}

  *n::ru_underscore()

  *m::ru_remap4("f","{U+0444}","{U+0424}",6) ; ф {U+0444} ; Ф {U+0424}

  *,::ru_remap4("u","{U+0443}","{U+0423}",7) ; у {U+0443} ; У {U+0423}

  *.::ru_comma()
  
  */::ru_remap4("y","{U+044F}","{U+042F}",8) ; я {U+044F} ; Я {U+042F}

  *RShift::ru_remap4("w","{U+0448}","{U+0428}",9) ; ш {U+0448} ; Ш {U+0428}

   ; ;------------------------

  *up::ru_remap3("q","{U+0446}","{U+0426}") ; ц {U+0446}  Ц {U+0426}

  *down::dual.comboKey("F15")

  *[::dual.comboKey("F16")

  *]::dual.comboKey("F17")

   ; ;-------------------------

   ; LEFT THUMB CLUSTER (COPIED)

  *Backspace::
  *Backspace UP::dual.combine("Ctrl","Backspace",{doublePress:250})

  *Delete::
  *Delete UP::dual.combine("LShift","Tab")

  *LCtrl::
  *LCtrl UP::dual.combine("RShift","Enter",{doublePress:250})

   ; ;-------------------------

  *LAlt::dual.comboKey("F14")

  *Home::
  *Home UP::dual.combine("F20","F2",{doublePress:250})

    return

  *End::dual.comboKey("Delete")

   ; RIGHT THUMB CLUSTER

  *RCtrl::
  *RCtrl Up::dual.combine("Ctrl","{Esc}",{doublePress:30})

  *Enter::
  *Enter UP::dual.combine("LAlt","",{doublePress:70},{custom:Func("ru_E")})


  *PgDn::dual.comboKey("F2")

  *PgUp::
  *PgUp UP::dual.combine("F20","F3",{doublePress:250},{Shift:"{U+042A}"}) ; Ъ


  *Space::
  *Space UP::dual.combine("LShift","Space")

}